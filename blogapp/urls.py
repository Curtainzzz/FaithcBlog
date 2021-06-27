from blogapp.views import *
from django.urls import path

urlpatterns = [
    # path(r'css/', article_list, name="article_list"),
    path(r"article_list/", article_list, name="article_list"),
    path(r'message/',message),
    path(r'save/',save),
    # path(r'article/',article),
    path(r'article/<int:article_id>/', ArticleDetailView.as_view(), name='article'),
    path(r'games/',games, name="games" ),
    path(r'',article_list, name="article_list"),
    path(
        r'category/<category_slug>.html',
        CategoryView.as_view(),
        name='category_detail'),
    path(
        r'tag/<tag_slug>.html',
        TagView.as_view(),
        name = 'tag_detail'),
]