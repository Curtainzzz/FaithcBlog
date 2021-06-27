from django.contrib import admin

# Register your models here.
from blogapp.models import *
admin.site.register(Message)
admin.site.register(Article)
admin.site.register(Category)
admin.site.register(Tag)