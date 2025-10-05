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


### Observe Logstash Logs

- docker logs logstash

<img src="./screenshots/LogStash Logs.png" alt="drawing" width="400"/>

### Access Kibana and View Logs

1. Open your browser and go to: http://localhost:5601

2. In Kibana:

<img src="./screenshots/ES - New Data.png" alt="drawing" width="400"/>

<br />

<img src="./screenshots/ES - Create Data View.png" alt="drawing" width="400"/>


3. Return to "Discover" to see your forwarded logs

<img src="./screenshots/ES - Discover.png" alt="drawing" width="400"/>

4. Teardown ELK Stack

- docker-compose down
