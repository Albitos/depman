function depman_get_tag()
{
    IMAGE_NAME=$1
    if [[ $IMAGE_NAME != *"/"* ]]
    then
       IMAGE_NAME="library/$IMAGE_NAME"
    fi
    DATA_FILE_NAME=${IMAGE_NAME//\//@}
    DATA_FILE="$DEPMAN_DIR/data/tags/$DATA_FILE_NAME.data"
    touch $DATA_FILE

    if [ ! -s $DATA_FILE ]
    then
        depman_load_tags "$IMAGE_NAME"
    fi

    sort -u "$DEPMAN_DIR/data/tags/$DATA_FILE_NAME.data" | fzf
}

function depman_load_tags()
{
    IMAGE_NAME=$1
    DATA_FILE_NAME=${IMAGE_NAME//\//@}

    PAGE=1
    COUNT=0
    TOTAL=1

    mkdir -p "$DEPMAN_DIR/data/tags"

    while [ $COUNT -le $TOTAL ]; do
        DATA=$(curl -L -s "https://registry.hub.docker.com/v2/repositories/$IMAGE_NAME/tags?page_size=100&page=$PAGE")
        echo $DATA | jq -r '."results"[]["name"]' >> "$DEPMAN_DIR/data/tags/$DATA_FILE_NAME.data"
        COUNT=$(($PAGE * 100))
        TOTAL=$(echo $DATA | jq '."count"')
        PAGE=$(($PAGE+1))
        depman_progress $COUNT $TOTAL "Reading Docker Hub tags"
    done
    echo "\n"
}
