BUILDER_NAME=docker-sencha-cmd
BUILDER=$(docker buildx ls | grep $BUILDER_NAME)

if [ -z "${BUILDER}" ]; then
 echo "No builder, creating"
 docker buildx create --name $BUILDER_NAME
fi

docker buildx use $BUILDER_NAME
docker buildx build --build-arg "SENCHACMD_VERSION=7.4.0.39" --platform linux/arm64 -t "fvoncina/docker-sencha-cmd:7.4.0.39"  --push .