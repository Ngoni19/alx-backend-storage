#!/usr/bin/env python3
""" Script -> Log stats """
from pymongo import MongoClient


if __name__ == "__main__":
    client = MongoClient('mongodb://127.0.0.1:27017')
    nginx_db = client.logs.nginx
    methods = ["GET", "POST", "PUT", "PATCH", "DELETE"]

    num_logs = nginx_db.count_documents({})
    print(f'{num_logs} logs')

    print('Methods:')
    for method in methods:
        num_method = nginx_db.count_documents({'method': method})
        print(f'\tmethod {method}: {num_method}')

    check = nginx_db.count_documents(
        {"method": "GET", "path": "/status"}
    )

    print(f'{check} status check')
