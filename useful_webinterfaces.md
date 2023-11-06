### http interfaces that might be useful in troubleshooting

|   |   |
|---|---|
|Validate that elasticsearch is running|http://127.0.0.1:9200|
|Load the index template|http://127.0.0.1:9200/_cat/indices?v |
|Load received logs|http://127.0.0.1:9200/*/_search?pretty|
|Kibana task manager|http://127.0.0.1:9200/.kibana_task_manager_7.17.14_001/|

