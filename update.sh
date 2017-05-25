#!/bin/bash

REPO_DIR=`dirname $0`
cd ${REPO_DIR}
while read dst
do
	src=${dst/./$HOME}
	echo "${src} -> ${dst}"
	cp ${src} ${dst}
done < <(find . -type f -not -path "*.git/*" | 
	grep -v "~" | 
	grep -v "swp$" | 
	grep -v ".gitignore" | 
	grep -v "update.sh" | 
	grep -v ".md$")
