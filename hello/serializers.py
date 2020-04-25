from rest_framework import serializers

from hello.models import Message


class MessageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Message
        fields = ["text", "created_date"]
