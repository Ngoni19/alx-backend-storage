#!/usr/bin/env python3
""" Script -> Update School """
import pymongo
from typing import List


def update_topics(mongo_collection, name, topics):
    """ Method: Change the data

        Args:
            mongo_collection:
            name: School
            topics: School name

        Return:
            None
    """
    query: dict = {'name': name}
    mongo_collection.update_many(query, {"$set": {"topics": topics}})
