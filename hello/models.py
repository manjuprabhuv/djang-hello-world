from django.db import models
from django.utils import timezone


class Message(models.Model):
    text = models.TextField()
    created_date = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.text

    class Meta:
        db_table = "hello_messages"
