#!/bin/sh
mlflow server \
    --backend-store-uri sqlite:///my.db\
    --host $SERVER_HOST \
    --port $SERVER_PORT