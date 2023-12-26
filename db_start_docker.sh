#!/bin/bash

if [ "$#" -ne 1 ] ; then
    echo "Invalid no of args"
    echo "please mention no.of directories to go back"
    exit 1
fi

if [[ $1 == "start" ]]; then
	
	# runs the cassandra docker
	passWord="sanin"

	docker start cass3.11 && docker exec -it cass3.11 bash -c "exit"
	# runs the postgres docker
	docker start postgres && docker exec -it postgres bash -c "exit"
	exit

elif [[ $1 == "stop" ]]; then

	docker stop cass3.11 
	docker stop postgres 

else
	echo "dbdocker: $1 is not a command"
	echo "see dbdocker --help"
fi

if [[ $1 == "--help" ]]; then
	
	echo "Commands:"
	echo "start \t strats the postgres and cassandra database conatainers from docker"
	echo "stop \t stops the postgres and cassandra database conatainers from docker"

fi
