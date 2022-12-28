
ES_JAVA_OPTS=-'Xms512m -Xmx512m' elasticsearch -E node.name=elasticsearch -E cluster.name=es-local -E discovery.type=single-node -E cluster.routing.allocation.disk.threshold_enabled=false &
./wait-for-it.sh -t 30 localhost:9200
python3 -m argilla