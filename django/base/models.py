from django.db import models
from django.contrib.auth.models import User
from django.utils.safestring import mark_safe
from django.utils.translation import gettext as _


class IPAddressHistoricalModel(models.Model):
    ip_address = models.GenericIPAddressField(_('IP address'))

    class Meta:
        abstract = True


class BaseManager(models.Manager):

    def get_owner_queryset(self, user):
        queryset = super().get_queryset()
        # if user.is_superuser:
        #     return queryset
        return queryset.filter(owner=user)


class BaseModel(models.Model):
    owner = models.ForeignKey(
        User,
        verbose_name=_("User"),
        on_delete=models.CASCADE,
        null=True,
        blank=True
    )
    objects = BaseManager()

    class Meta:
        abstract = True


class BaseConfigModel(BaseModel):
    name = models.CharField(
        verbose_name=_("Name"),
        max_length=128,
    )
    color = models.CharField(
        verbose_name=_("Color"),
        default="#ffffff",
        max_length=7,
    )

    class Meta:
        abstract = True

    def __str__(self):
        return self.name

    @property
    def get_render_color(self):
        return mark_safe(f"<span class='badge' style='background-color: {self.color}'>{self.color}</span>")
