from django.shortcuts import render

# Create your views here.
from django.views.generic.edit import FormView
from .form import CommentForm
from .models import Comment,Article
from account_app.login_check import login_require
from django.http import HttpResponseRedirect

class CommentPostView(FormView):
    form_class = CommentForm
    template_name = 'blog/article_detail.html'
    model = Comment

    @login_require
    def form_valid(self, form):
        comment = form.save(False)
        user = self.request.user
        article_id = self.kwargs['article_id']
        article = Article.objects.get(pk=article_id)
        comment.author = user
        comment.article = article
        if form.cleaned_data['parent_comment_id']:
            parent_comment = Comment.objects.get(
                pk=form.cleaned_data['parent_comment_id'])
            comment.parent_comment = parent_comment
        comment.save(True)
        return HttpResponseRedirect(
            "%s#div-comment-%d" %
            (article.get_absolute_url(), comment.pk))

