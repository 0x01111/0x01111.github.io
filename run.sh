 #!/bin/bash

current_time=`date "+%Y-%m-%d_%H:%M"`
current_time=`date "+%Y%m%d"`

br_name=`git br | grep "*"`
br_name=${br_name/* /}
echo $br_name
gitlog=`git st | grep modified | awk '{print\$2}'`
file_name=""
echo $gitlog
echo "++++++++++++++++++++++++"
for lg in ${gitlog[@]}
do
echo '    '$lg
file_name=${file_name}__$lg
done
echo "++++++++++++++++++++++++"

#file_name=${gitlog/ /_/g}

msg=${current_time}_${br_name}_${file_name}
msg=${current_time}_${file_name}
msg="fix"
echo $msg

git pull origin master
git commit -am $msg
git push


