#!/bin/bash

## eval won't work from bashScript but works when used from zshrc/bashrc
if [ "$#" -ne 1 ] ; then
    echo "Invalid no of args"
    echo "please mention no.of directories to go back"
    exit 1
fi

if [[ $1 =~ ^[0-9]+$ ]]; then
	backs="$1"
    command="cd "

    if [ $backs -eq 0 ]; then
        exit 2
    fi

    for ((i=0; i<backs; i++)); do
        command+="../"
    done

    eval "$command"
    echo "$command"
else
    echo "provide a digit"
fi