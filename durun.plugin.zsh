DURUN_HOME=${DURUN_HOME:-$HOME/.durun/home}

function durun(){
    mkdir -p ${DURUN_HOME}/$(pwd)
    docker run --rm -it \
        --net=host \
        --group-add=sudo \
        --group-add=video \
        --user=$(id -u):$(id -g) \
        --volume=/etc/group:/etc/group:ro \
        --volume=/etc/passwd:/etc/passwd:ro \
        --volume=/etc/shadow:/etc/shadow:ro \
        -v $DURUN_HOME/$(pwd):$HOME \
        -v "$SSH_AUTH_SOCK:$SSH_AUTH_SOCK" -e SSH_AUTH_SOCK="$SSH_AUTH_SOCK" \
        -v "$HOME/.gitconfig:$HOME/.gitconfig:ro" \
        -v "$HOME/.config/gh:$HOME/.config/gh:ro" \
        -v $(pwd):$(pwd) \
        --workdir=$(pwd) \
        $@
}
