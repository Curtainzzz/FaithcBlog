from django.db import models

# Create your models here.
from django.conf import settings
from blogapp.models import BaseModel,Article

class Comment(BaseModel):
    message = models.TextField('评论', max_length=400)
    author = models.ForeignKey(
        settings.AUTH_USER_MODEL,
        verbose_name='作者',
        on_delete=models.CASCADE,
    )
    article = models.ForeignKey(
        Article,
        verbose_name='文章',
        on_delete=models.CASCADE,
    )
    parent_comment = models.ForeignKey(
        'self',
        verbose_name='上级评论',
        blank=True,
        null=True,
        on_delete=models.CASCADE
    )
    # root_comment = models.ForeignKey(
    #     'self',
    #     verbose_name='根级评论',
    #     blank=True,
    #     null=True,
    #     on_delete=models.CASCADE
    # )
    is_enable = models.BooleanField(
        '是否显示',
        default=True,
        blank=False,
        null=False,
    )
    class Meta:
        ordering = ['id']
        verbose_name = "评论"