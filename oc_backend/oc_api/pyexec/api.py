from rest_framework import serializers


class PythonResult(object):
    def __init__(self, status, output):
        self.status = status
        self.output = output

