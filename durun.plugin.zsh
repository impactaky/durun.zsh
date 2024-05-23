DURUN_HOME=${DURUN_HOME:-$HOME/.durun/home}
mkdir -p ${DURUN_HOME}
alias durun='docker run --rm -it --net=host --group-add=sudo --user=$(id -u):$(id -g) --volume=/etc/group:/etc/group:ro --volume=/etc/passwd:/etc/passwd:ro --volume=/etc/shadow:/etc/shadow:ro -v $DURUN_HOME/$(pwd):$HOME -v $(pwd):$(pwd) --workdir=$(pwd) --group-add=video'
