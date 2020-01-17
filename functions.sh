function depman_generate_dockerfile()
{
    PLUGIN_PATH=$1
    envsubst < "$PLUGIN_PATH/Dockerfile.template" > "$PLUGIN_PATH/Dockerfile"
}
