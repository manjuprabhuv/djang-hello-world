from rest_framework import generics

from hello.models import Message
from hello.serializers import MessageSerializer


class MessageView(generics.ListAPIView):
    """
       Provides a get method handler.
       """

    queryset = Message.objects.all()
    # serializer_class = MessageSerializer

    def get_serializer_class(self):
        print("get_serializer_class called")
        return MessageSerializer
