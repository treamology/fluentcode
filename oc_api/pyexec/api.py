from rest_framework import serializers


class PythonResult(object):
    def __init__(self, status, output):
        self.status = status
        self.output = output


class PythonResultSerializer(serializers.Serializer):
    status = serializers.IntegerField()
    output = serializers.CharField(max_length=255)
