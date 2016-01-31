#!/bin/bash

MONGODB1=`ping -c 1 mongodb-primary | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`
MONGODB2=`ping -c 1 mongodb-secondary-1 | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`
MONGODB3=`ping -c 1 mongodb-secondary-2 | head -1  | cut -d "(" -f 2 | cut -d ")" -f 1`

/scripts/wait-until-started.sh


echo "================================="
echo "Writing to MongoDB"
mongo ${MONGODB1} <<EOF
  use database-test
  rs.config()
  var p = {title: "Good News!", content: "It's working!"}
  db.entries.save(p)
EOF