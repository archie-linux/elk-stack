### Deploy ELK Stack

- docker-compose up -d

### Verify Services are Running

- docker ps

### Test Log Forwarding

- echo "This is a test log message" | nc localhost 5000
- cat << EOF | nc localhost 5000
First log line
Second log line
Third log line
EOF

- ./send_messages.sh

<img src="./screenshots/Send Messages.png" alt="drawing" width="400"/>

### Inspect Logstash Logs

- docker logs logstash

<img src="./screenshots/LogStash Logs.png" alt="drawing" width="400"/>

### Access Kibana and View Logs

1. Open your browser and go to: http://localhost:5601d

2. In Kibana:

<img src="./screenshots/ES - New Data.png" alt="drawing" width="400"/>

<br />

<img src="./screenshots/ES - Create Data View.png" alt="drawing" width="400"/>

3. Return to "Discover" to see your forwarded logs

<img src="./screenshots/ES - Discover.png" alt="drawing" width="400"/>

4. Teardown ELK Stack

- docker-compose down

### Test Filebeat Configuration

1. Verify my-app logs

- docker exec my-app cat /logs/test.log

<img src="./screenshots/My App.png" alt="drawing" width="400"/>


2. Check Filebeat

<pre>
{"log.level":"info","@timestamp":"2025-03-05T07:06:08.018Z","log.logger":"input","log.origin":{"function":"github.com/elastic/beats/v7/filebeat/input/log.NewInput","file.name":"log/input.go","file.line":174},"message":"Configured paths: [/logs/test.log]","service.name":"filebeat","input_id":"7b4ac858-0717-42ad-8264-52f4f1d3b597","ecs.version":"1.6.0"}
{"log.level":"info","@timestamp":"2025-03-05T07:06:08.018Z","log.logger":"crawler","log.origin":{"function":"github.com/elastic/beats/v7/filebeat/beater.(*crawler).startInput","file.name":"beater/crawler.go","file.line":148},"message":"Starting input (ID: 8327598775202748513)","service.name":"filebeat","ecs.version":"1.6.0"}
{"log.level":"info","@timestamp":"2025-03-05T07:06:08.018Z","log.logger":"crawler","log.origin":{"function":"github.com/elastic/beats/v7/filebeat/beater.(*crawler).Start","file.name":"beater/crawler.go","file.line":106},"message":"Loading and starting Inputs completed. Enabled inputs: 1","service.name":"filebeat","ecs.version":"1.6.0"}
{"log.level":"info","@timestamp":"2025-03-05T07:06:08.019Z","log.logger":"input.harvester","log.origin":{"function":"github.com/elastic/beats/v7/filebeat/input/log.(*Harvester).Run","file.name":"log/harvester.go","file.line":311},"message":"Harvester started for paths: [/logs/test.log]","service.name":"filebeat","input_id":"7b4ac858-0717-42ad-8264-52f4f1d3b597","source_file":"/logs/test.log","state_id":"native::2097443-65025","finished":false,"os_id":"2097443-65025","harvester_id":"babc84c9-cb3d-46e1-9dc8-54aa249277ef","ecs.version":"1.6.0"}
</pre>

3. Monitor Logstash

<img src="./screenshots/Logstash Logs - Src Filebeat.png" alt="drawing" width="400"/>

<br />

<img src="./screenshots/Test Logs - Kibana.png" alt="drawing" width="400"/>

4. Stop my-app

- docker-compose my-app
