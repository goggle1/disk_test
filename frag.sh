#!/bin/sh

ROOT_DIR=$1
LOG=$2

function frag_file()
{
	local FILE
	FILE=$1
	/usr/sbin/filefrag ${FILE} >> $LOG
}

function list_dir()
{	
	local DIR
	local FILE2
	DIR=$1
	for FILE2 in `ls -a ${DIR}`
  	do
		echo "${DIR}/${FILE2}"
  		if [ x"${FILE2}" != x"." -a x"${FILE2}" != x".." ]; then
			if [ -d "${DIR}/${FILE2}" ]; then
				list_dir "${DIR}/${FILE2}"
      			elif [ -f "${DIR}/${FILE2}" ]; then
      				frag_file "${DIR}/${FILE2}"
			fi
		fi
	done
}

if [ x"${ROOT_DIR}" = x"" ]; then
	echo "please input DIR name"
	exit 1
fi

if [ x"${LOG}" = x"" ]; then
	echo "please input LOG name"
	exit 1
fi

list_dir ${ROOT_DIR}
