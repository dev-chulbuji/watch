#!/bin/bash

TITLE=$1
TOTAL=$(ls | wc -l)
IDX=$(($TOTAL - 1))

check_title_empty() {
	if [ -z $TITLE ]; then
		ehco "Enter TITLE plzz"
		exit 1;
	fi
}

create_md() {
	if [ "$IDX" -gt 10 ]; then
		FILE_PATH=$IDX\_$TITLE
	else
		FILE_PATH=0$IDX\_$TITLE
	fi

	mkdir -p $(pwd)/$FILE_PATH
	mkdir -p $(pwd)$FILE_PATH/imgs
	touch $(pwd)$FILE_PATH/index.md

	# add index in README
	echo "[$TITLE](/$FILE_PATH/index.md)  " >> README.md
}

exit_if_fail() {
	echo "Excute command: ($@)"
	($@)
	RET=$?
	if [ "$RET" -ne 0 ]; then
		echo "Erro occur during execute command: ($@)"
		exit $RET
	fi
}

exit_if_fail check_title_empty
exit_if_fail create_md

