from django.shortcuts import render
import blogapp.models
from django.core.paginator import Paginator
from django.http import HttpResponseRedirect
import datetime
# Create your views here.
def message(request):
    # print(request.GET)
    all=blogapp.models.message.objects.order_by('-id').all()
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
    content =blogapp.models.message(title=title,content=context, username=username,publish=publish)
    content.save()
    return HttpResponseRedirect('/message/')
def blog(request):
    limit=5
    print(11111111111)
    article=blogapp.models.Article.objects.order_by('-id').all()
    paginator=Paginator(article,limit)
    page=request.GET.get('page',1)
    loaded=paginator.page(page)
    return  render(request,'blog.html',{'articles':loaded})
def article(request):
    # print(request.GET.get('id',1))
    # print(222222222)
    article=blogapp.models.Article.objects.filter(id=request.GET.get('id',1))
    return render(request,'article.html',{'articles':article})
def games(request):
    return render(request,'games.html')
