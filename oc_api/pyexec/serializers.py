"""Serializers for the python execution portion of the site API.

This module holds the serializers for the potential responses from the API
and the corresponding serializers for database models.
"""

from rest_framework import serializers

class ExecutionRequestSerializer(serializers.Serializer):
    """Sent by the client when it wants to execute some code"""
    code = serializers.CharField()
    inputs = serializers.ListField(
        child=serializers.CharField()
    )
    section_id = serializers.IntegerField(required=False)

class ExecutionStateSerializer(serializers.Serializer):
    """Status update for code execution"""
    # token = serializers.CharField()

class TestResultSerializer(serializers.Serializer):
    success = serializers.BooleanField()
    out = serializers.CharField()
    err = serializers.CharField()


class ExecutionResultSerializer(serializers.Serializer):
    status = serializers.IntegerField()

    result = serializers.CharField(required=False)
    error = serializers.CharField(required=False)

    reason = serializers.CharField(required=False)

    results = TestResultSerializer(required=False, many=True)
