docker stop mongo
docker rm mongo

export DATA_DIR=`pwd`/data
echo $DATA_DIR
mkdir -p $DATA_DIR

export EX_DIR=`pwd`/mongodb-sample-dataset
echo $EX_DIR

docker run -p 27017:27017 \
       -v $DATA_DIR:/data/db \
       -v $EX_DIR:/mongodb-sample-dataset \
       --name mongo \
       -d mongo

export DHC=$(docker ps -aqf "name=mongo")

docker exec -it $DHC mongosh
