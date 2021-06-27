from django.db import models
from django.contrib.auth.models import AbstractUser
from django.urls import reverse
from django.utils.timezone import now
# Create your models here.

class BlogUser(AbstractUser):
    nickname = models.CharField('昵称', max_length=100, blank=True)
    created_time = models.DateTimeField('创建时间', default=now)
    last_mod_time = models.DateTimeField('修改时间', default=now)
    source = models.CharField('创建来源', max_length=100, blank=True)

    def get_absolute_url(self):
        return reverse(
            'blogapp:auth_detail', kwargs={
                'author_name': self.username})