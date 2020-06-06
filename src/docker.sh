function depman_generate_dockerfile()
{
    PLUGIN_PATH=$1
    rm "$PLUGIN_PATH/Dockerfile"
    cp "$PLUGIN_PATH/Dockerfile.template" "$PLUGIN_PATH/Dockerfile"

    keys=''
    if [ -n "$ZSH_VERSION" ]; then
       keys=${(k)DEPMAN_CONFIG[@]}
    elif [ -n "$BASH_VERSION" ]; then
       # assume Bash
       # assume something else
       keys=${!DEPMAN_CONFIG[@]}
    fi
    setopt shwordsplit
    for key in $keys
    do
      value=${DEPMAN_CONFIG[$key]}
      sed -i "s#{{[[:blank:]]*${key}[[:blank:]]*}}#${value}#g" "$PLUGIN_PATH/Dockerfile"
    done
}

function depman_get_container_user_home()
{
    IMAGE_NAME=$1
    USER_PASSWD=$(docker run --rm --interactive --tty "${DEPMAN_DOCKER_FLAGS[@]}" "$IMAGE_NAME" sh -c "getent passwd $DEPMAN_UID")
    USER_HOME=$(echo $USER_PASSWD | cut -d : -f 6)
    mkdir -p "$DEPMAN_DIR/workspaces/home/$USER_HOME"
    echo $USER_HOME
}
