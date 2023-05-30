#!/usr/bin/env python3
""" Script -> shows top students  """
import pymongo


def tp_st(mongo_collection):
    """ Method: Average top students

        Args:
            mongo_collection: Collection to find avg top

        Return:
            List all top students
    """
    tp_st = mongo_collection.aggregate([
        {
            "$project": {
                "name": "$name",
                "averageScore": {"$avg": "$topics.score"}
            }
        },
        {"$sort": {"averageScore": -1}}
    ])

    return tp_st
