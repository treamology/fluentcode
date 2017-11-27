"""Serializers for the python execution portion of the site API.

This module holds the serializers for the potential responses from the API
and the corresponding serializers for database models.
"""

from rest_framework import serializers

class ExecutionRequestSerializer(serializers.Serializer):
    """Sent by the client when it wants to execute some code"""
    code = serializers.CharField()

class ExecutionStateSerializer(serializers.Serializer):
    """Status update for code execution"""
    # token = serializers.CharField()

