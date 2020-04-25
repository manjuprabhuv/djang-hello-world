from django.urls import path
from hello.views import MessageView


urlpatterns = [path("messages/", MessageView.as_view(), name="messages-all")]
