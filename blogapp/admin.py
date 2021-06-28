from django.contrib import admin
import markdown
# Register your models here.
from blogapp.models import *
admin.site.register(Message)

admin.site.register(Category)
admin.site.register(Tag)
admin.site.register(Article)

# class ArticleAdmin(admin.ModelAdmin):
#     def save_model(self, request, obj, form, change):
#         obj.content = markdown.markdown(obj.content,
#             extensions=[
#                 'markdown.extensions.extra',
#                 'markdown.extensions.codehilite',
#                 'markdown.extensions.toc',
#             ]
#             )
#         super().save_model(request, obj, form, change)
# admin.site.register(Article,ArticleAdmin)