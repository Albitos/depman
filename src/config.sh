function depman_load_config()
{
  local FILE=$1
  if [ ! -f $FILE ]; then
    FILE=$DEPMAN_DEFAULT_CONFIG_FILE
  fi
  local DATA=`cat $FILE | jq -r 'leaf_paths as $p | [$p, getpath($p)] | "DEPMAN_CONFIG["+(.[0] | join("."))+"]=\""+.[1]+"\""'`
  declare -Ag DEPMAN_CONFIG=()
  eval "$DATA"
}

function depman_ensure_config()
{
  local FILE=$1
  if ! jq -e < $FILE; then
    cp "$DEPMAN_DEFAULT_CONFIG_FILE" "$FILE"
  fi
}

function depman_write_config()
{
  local FILE=$1
  local KEY=$2
  local VALUE=$3

  depman_ensure_config $FILE

  local DATA=$(jq --arg VALUE "$VALUE" ".$KEY = \$VALUE" $FILE)
  echo $FILE
  echo $DATA

  echo "$DATA" > $FILE
}

