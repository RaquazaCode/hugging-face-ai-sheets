
ES_JAVA_OPTS=-'Xms512m -Xmx512m' elasticsearch -E node.name=elasticsearch -E cluster.name=es-local -E discovery.type=single-node -E cluster.routing.allocation.disk.threshold_enabled=false &
./wait-for-it.sh -t 30 localhost:9200
if [ -z "$API_KEY" ] && [ -z "$PASSWORD" ]; then
  python3 -m argilla
elif [ -z "$API_KEY" ] && [ -n "$PASSWORD" ]; then
  export ARGILLA_LOCAL_AUTH_DEFAULT_PASSWORD=$PASSWORD
  python3 -m argilla
elif [ -n "$API_KEY" ] && [ -z "$PASSWORD" ]; then
  export ARGILLA_LOCAL_AUTH_DEFAULT_APIKEY=$API_KEY
  python3 -m argilla
else
  export ARGILLA_LOCAL_AUTH_DEFAULT_APIKEY=$API_KEY
  export ARGILLA_LOCAL_AUTH_DEFAULT_PASSWORD=$PASSWORD
  python3 -m argilla
fi
