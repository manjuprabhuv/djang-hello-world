from django import forms
from django.contrib import admin

from hello.models import Message


@admin.register(Message)
class MessageAdmin(admin.ModelAdmin):
    def has_add_permission(self, request, obj=None):
        return True
