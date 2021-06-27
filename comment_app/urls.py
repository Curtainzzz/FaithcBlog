from django.urls import path
from . import views

urlpatterns = [
    path(
        'article/<int:article_id>/post_comment',
        views.CommentPostView.as_view(),
        name="post_comment",
    )
]
