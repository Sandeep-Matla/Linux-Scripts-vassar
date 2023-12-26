#!/bin/bash
#Script to run python command in prod & and return output

# excuting in prod
args=("$@")
length=${#args[@]}

outputFiles=()

if [ $length < 2 ] ; then
	echo "Invalid no of arguments"
	exit 3
fi

#prodEnv="vassarml@192.168.3.190"
prodEnv="vassaralabs@192.168.1.172"
#prodPass="Inkritivassar"
prodPass="vijay"

command="${args[0]}"
workingDir="${args[1]}"


echo "excuting $command in host::$prodEnv"

prodExecCommand="cd $workingDir && $command"

echo "final command : $prodExecCommand"
sshpass -p $prodPass ssh $prodEnv $prodExecCommand

## transfering output files

localDir="/home/sandeep-vassar/Documents/temp/shhTransferTest/"

for((i=2; i < $length ; i++)); do
	file="${args[i]}"
	outputFiles+=("$file")
	
	echo "command :: sshpass -p $prodPass scp $prodEnv:$file $localDir"

	sshpass -p "$prodPass" scp "$prodEnv:$file" "$localDir"
done


exit



