### http interfaces that might be useful in troubleshooting

|   |   |
|---|---|
|Validate that elasticsearch is running|http://127.0.0.1:9200|
|Load the index template|http://127.0.0.1:9200/_cat/indices?v |
|Load received logs|http://127.0.0.1:9200/filebeat-*/_search?pretty|
|Kibana home|http://127.0.0.1:5601/app/home/|

