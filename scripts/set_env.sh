#!/bin/zsh

# urls:
# - http://zsh.sourceforge.net/Intro/intro_4.html
# - https://github.com/robbyrussell/oh-my-zsh/blob/master/tools/install.sh

set_env_var() {
	export $1=$2
	printf "${BLUE}$1: ${RED}$2${NORMAL}\n"
}

main() {
	# Use colors, but only if connected to a terminal, and that terminal
	# supports them.
	if which tput >/dev/null 2>&1; then
		ncolors=$(tput colors)
	fi
	if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
		RED="$(tput setaf 1)"
		GREEN="$(tput setaf 2)"
		YELLOW="$(tput setaf 3)"
		BLUE="$(tput setaf 4)"
		BOLD="$(tput bold)"
		NORMAL="$(tput sgr0)"
	else
		RED=""
		GREEN=""
		YELLOW=""
		BLUE=""
		BOLD=""
		NORMAL=""
	fi

	# Only enable exit-on-error after the non-critical colorization stuff,
	# which may fail on systems lacking tput or terminfo
	# set -e

	# root path (used for extract subdir and generate docker image/tag name)
	set_env_var LI3DS_ROOT_PATH 		$(realpath .)
	# DOCKER settings for building/pushing images
	set_env_var LI3DS_DOCKER_PROXY 		""
    set_env_var LI3DS_DOCKER_OPTIONS 	$DOCKER_PROXY
	set_env_var LI3DS_DOCKER_REGISTRY 	""
}

main
