#! /bin/sh

LIB=$1

for ver in `cat $LIB.txt`
do
    image_name="${LIB}_api_extract-$ver"
    # if [ ! "$(docker image ls | grep "$image_name ")" ]
    # then
        image_dir="./$LIB/image/$ver"
        rm -f $image_dir/Dockerfile ./image/$ver/*.py ./image/$ver/*.sh
        cp ./$LIB/Dockerfile $image_dir
        cp ./$LIB/*.py $image_dir
        cp ./$LIB/*.sh $image_dir
        docker build --build-arg MY_PARAM="${LIB}_${ver}" $image_dir -t $image_name &
    # else
    #     echo $image_name already exists
    # fi
done
ansi