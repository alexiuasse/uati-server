from django.contrib.auth.models import User
from django.db import models


class Profile(models.Model):
    name = models.CharField(verbose_name="Nome Completo", max_length=150)
    user = models.OneToOneField(
        User, on_delete=models.CASCADE, verbose_name="Usuário"
    )
    # Allow same restaurant type in a week to be sorted out
    allow_repeated_week = models.BooleanField(default=True)
    app_system_theme = models.CharField(default="system_theme")
