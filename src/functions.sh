# shellcheck source=src/config.sh
source "$DEPMAN_DIR/src/config.sh"

# shellcheck source=src/progressbar.sh
source "$DEPMAN_DIR/src/progressbar.sh"

# shellcheck source=src/dockerhub.sh
source "$DEPMAN_DIR/src/dockerhub.sh"

# shellcheck source=src/docker.sh
source "$DEPMAN_DIR/src/docker.sh"

# shellcheck source=src/workspace.sh
source "$DEPMAN_DIR/src/workspace.sh"

function depman_reload()
{
    source "$DEPMAN_DIR/shrc"
}
