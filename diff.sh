#!/bin/bash

if [ "$1" == "-s" ]; then
	SUMMARIZE=true
fi

REPO_DIR=`dirname $0`
cd ${REPO_DIR}
while read dst
do
	src=${dst/./$HOME}
	if [ -z "$SUMMARIZE" ]; then
		diff "${src}" "${dst}"
	else
		if ! cmp ${src} ${dst} >/dev/null 2>&1; then
			echo "${src} and ${dst} are different"
			echo "=> diff ${src} ${dst}"
		fi
	fi
done < <(find . -type f -not -path "*.git/*" | 
	grep -v "~" | 
	grep -v "swp$" | 
	grep -v ".gitignore" | 
	grep -v "update.sh" | 
	grep -v "diff.sh" | 
	grep -v ".md$")
