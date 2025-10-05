#!/bin/bash

# Number of iterations
COUNT=100

# Loop to send the message 100 times
for ((i=1; i<=COUNT; i++))
do
    echo "This is a test log message" | nc localhost 5001
    echo "Sent message $i of $COUNT"
done

echo "Finished sending $COUNT messages."
