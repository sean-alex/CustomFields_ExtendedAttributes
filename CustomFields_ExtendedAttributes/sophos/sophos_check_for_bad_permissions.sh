#!/bin/bash

# see KBA 131749 (https://community.sophos.com/kb/en-us/131749)
test_directories=(/ '/Library/' '/Library/Caches/' '/Library/Application Support/')
root_owner='d[rwxsStT\-]{9}[^0-9]*[0-9]+ (0) .*'
not_group_or_other_writeable='d[rwxsS\-]{3}[r\-](-)[xsS\-][r\-](-).*'
result=0

for directory in "${test_directories[@]}"; do
	dir_ls=`ls -ldn "$directory"`
	if ! ( ( [[ $dir_ls =~ $not_group_or_other_writeable ]] || test -k "$directory" ) && [[ $dir_ls =~ $root_owner ]] ); then
		echo 'BAD PERMISSIONS ' 'ls -ld' "$directory"
		result=$(expr $result + 1)
	fi
done

if [ $result -eq 0 ]; then
	echo 'No Bad Permissions Found'
fi

exit $result