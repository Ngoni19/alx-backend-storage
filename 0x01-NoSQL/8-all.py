#!/usr/bin/env python3
""" Script -> List documents """
import pymongo


def list_all(mongo_collection) -> list:
    """ Lists all docs in a collection
        Args:
            mongo_collection: Collection of object

        Return:
            List with docs
    """
    documents: list = []

    for document in mongo_collection.find():
        documents.append(document)

    return documents
