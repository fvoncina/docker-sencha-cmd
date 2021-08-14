#!/bin/bash

BUILDER_NAME=docker-sencha-cmd
BUILDER=$(docker buildx ls | grep $BUILDER_NAME)

if [ -z "${BUILDER}" ]; then
 echo "No builder, creating"
 docker buildx create --name $BUILDER_NAME
fi

docker buildx use $BUILDER_NAME
docker buildx build --build-arg "SENCHACMD_VERSION=7.4.0.39" --platform linux/amd64,linux/arm64 -t "fvoncina/docker-sencha-cmd:7.4.0.39"  --push .


# declare -a versions=(
#     "7.4.0.39" 
#     "7.3.0.19"  
#     "7.2.0.66"   
#     "7.1.0.15"
#     "7.0.0.40"
#     "6.7.0.63"
#     "6.6.0.13"
#     "6.5.3.6"    
# )

# INDEX=0
# for version in "${versions[@]}"
# do
#     echo "Building version: $version"    
#     docker build --build-arg "SENCHACMD_VERSION=$version" -t "fvoncina/docker-sencha-cmd:$version" . 
#     if (( $INDEX == 0 )); then
#         docker tag "fvoncina/docker-sencha-cmd:$version" "fvoncina/docker-sencha-cmd:latest"
#     fi
#     if [[ $1 == "push" ]]; then
#         echo "Pushing version: $version"
#         docker push "fvoncina/docker-sencha-cmd:$version"        
#         if (( $INDEX == 0 )); then
#             docker push "fvoncina/docker-sencha-cmd:latest"
#         fi
#     fi
#     let INDEX=${INDEX}+1    
# done

docker buildx rm $BUILDER_NAME