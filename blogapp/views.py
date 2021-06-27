from django.views.generic.list import ListView
from django.views.generic import DetailView
from django.shortcuts import render
from django.core.paginator import Paginator
from django.http import HttpResponseRedirect
from django.shortcuts import get_object_or_404
from django import forms
from blogapp.models import *
from comment_app.form import CommentForm
import datetime
import markdown
ARTICLE_LIMIT = 5

# Create your views here.
def message(request):
    # print(request.GET)
    all=message.objects.order_by('-id').all()
    limit=8
    paginator=Paginator(all,limit)
    page=request.GET.get('page',1)
    loadded=paginator.page(page)
    return render(request,'message.html',{'all': loadded})
def save(request):
    username=request.POST.get("name")
    title=request.POST.get("title")
    context=request.POST.get("message")
    publish=datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    content =message(title=title,content=context, username=username,publish=publish)
    content.save()
    return HttpResponseRedirect('/message/')
def blog(request):
    limit=5
    article=Article.objects.order_by('-id').all()
    paginator=Paginator(article,limit)
    page=request.GET.get('page',1)
    loaded=paginator.page(page)
    return  render(request,'blog.html',{'articles':loaded})

def article_list(request):
    article = Article.objects.order_by('-id').all()
    paginator = Paginator(article, ARTICLE_LIMIT)
    page = request.GET.get('page', 1)
    loaded = paginator.page(page)
    return render(request, 'article_list.html', {'articles': loaded})

# def article(request):
#     # print(request.GET.get('id',1))
#     # print(222222222)
#     article=Article.objects.filter(id=request.GET.get('id',1))
#     return render(request,'article.html',{'articles':article})

class ArticleDetailView(DetailView):
    template_name = 'blog/article_detail.html'
    pk_url_kwarg = 'article_id'
    model = Article
    context_object_name = 'article'

    def get_object(self, queryset=None):
        obj = super().get_object()
        obj.content = markdown.markdown(obj.content,
            extensions=[
                'markdown.extensions.extra',
                'markdown.extensions.codehilite',
                'markdown.extensions.toc',
            ]
            )
        return obj

    def get_context_data(self, **kwargs):
        form = CommentForm()
        user = self.request.user
        if user.is_authenticated:
            form.fields.update({
                'message': forms.CharField(widget=forms.Textarea(attrs={'placeholder':"请输入",'class':"layui-textarea",'lay-verify':'required','rows':5})),
            })
            # form.fields["username"].initial = user.username
        article_comments = self.object.comment_list()
        kwargs['article_comments'] = article_comments
        kwargs['form'] = form

        return super().get_context_data(**kwargs)



def games(request):
    return render(request,'games.html')

class CategoryView(ListView):
    template_name = "article_list.html"
    # context_object_name属性用于给上下文变量取名（在模板中使用该名字）
    context_object_name = 'articles'

    def get_queryset(self):
        slug = self.kwargs['category_slug']
        category = get_object_or_404(Category, slug=slug)
        articles = Article.objects.filter(category=category)
        paginator = Paginator(articles, ARTICLE_LIMIT)
        loaded = paginator.page(1)
        # categorynames = list(
        #     map(lambda c: c.name, category.get_sub_categorys()))
        # article_list = Article.objects.filter(
        #     category__name__in=categorynames, status='p')
        return loaded

class TagView(ListView):
    template_name = "article_list.html"
    context_object_name = 'articles'

    def get_queryset(self):
        slug = self.kwargs['tag_slug']
        tag = get_object_or_404(Tag, slug=slug)
        articles = Article.objects.filter(tags__name=tag.name)
        paginator = Paginator(articles, ARTICLE_LIMIT)
        loaded = paginator.page(1)
        return loaded
