from django.contrib import admin

# Register your models here.
from blogapp.models import message,Article
admin.site.register(message)
admin.site.register(Article)