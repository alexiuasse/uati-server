from django.urls import path

from .views import GoogleLogin

app_name = "user"

urlpatterns = [
    path('rest/user/auth/google/', GoogleLogin.as_view(), name='google_login')
]
