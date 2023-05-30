#!/usr/bin/env python3
""" Script -> funct returns the list of school having a specific topic """
import pymongo


def schools_by_topic(mongo_collection, topic: str):
    """ Method: Search the school based in school

        Args:
            mongo_collection: Collection
            topic: Content

        Return:
            List of school
    """
    query: dict = {"topics": topic}
    schools: list = []

    for school in mongo_collection.find(query):
        schools.append(school)

    return schools
