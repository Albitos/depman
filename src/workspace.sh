function depman_get_workspace_dir()
{
    WORKSPACE_HOME="$DEPMAN_DIR/workspaces$PWD"
    mkdir -p "$WORKSPACE_HOME"
    echo $WORKSPACE_HOME
}

function depman_switch_image()
{
    PLUGIN=$1
    printf "Docker Hub image name: "
    read IMAGE_NAME
    IMAGE_TAG=$(depman_get_tag "$IMAGE_NAME")

    WORKSPACE_HOME=$(depman_get_workspace_dir)
    depman_write_config "$WORKSPACE_HOME/workspace.json" "plugins.$PLUGIN.image" "$IMAGE_NAME"
    depman_write_config "$WORKSPACE_HOME/workspace.json" "plugins.$PLUGIN.tag" "$IMAGE_TAG"
    depman_load_config "$WORKSPACE_HOME/workspace.json"
}
