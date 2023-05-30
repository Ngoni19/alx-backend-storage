#!/usr/bin/env python3
""" Script -> shows top students  """
import pymongo


def top_students(mongo_collection):
    students = mongo_collection.find()
    scores = {}
    for student in students:
        name = student["name"]
        marks = student["marks"]
        avg_score = sum(marks)/len(marks)
        scores[name] = {"averageScore": avg_score}

    sorted_scores = sorted(scores.items(), key=lambda x: x[1]["averageScore"], reverse=True)
    sorted_students = [{"name": item[0], "averageScore": item[1]["averageScore"]} for item in sorted_scores]

    return sorted_students

