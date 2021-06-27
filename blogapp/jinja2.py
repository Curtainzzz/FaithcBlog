from django.contrib.staticfiles.storage import staticfiles_storage
from django.urls import reverse
from jinja2 import Environment
from django.utils.html import format_html
def circle_page(curr_page,loop_page):
    offset=abs(loop_page-curr_page)
    if offset<3:
        if offset==0:
            page_ele='<li><a style="background:#ddd" href="?page=%s">%s</a></li>'%(loop_page,loop_page)
        else:
            page_ele='<li><a href="?page=%s">%s</a></li>'%(loop_page,loop_page)
    else:
        page_ele=''
    return format_html(page_ele)

def environment(**options):
    env = Environment(**options)
    env.globals.update({
        'static': staticfiles_storage.url,
        'url': reverse,

    })
    env.filters['circle_page']=circle_page
    return env