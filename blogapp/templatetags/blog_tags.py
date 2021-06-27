
from django import template
from blogapp.models import Category,Tag

register = template.Library()

@register.inclusion_tag('tags/sidebar_right.html')
def load_sidebar(user=None):
    """
    加载侧边栏
    :return:
    """
    sidebar_categorys = Category.objects.all()
    # 标签云 计算字体大小
    # 根据总数计算出平均值 大小为 (数目/平均值)*步长
    increment = 5
    tags = Tag.objects.all()
    sidebar_tags = None

    if tags and len(tags) > 0:
        import random
        # s = [t for t in [(t, t.get_article_count()) for t in tags] if t[1]]
        s = [t for t in [(t, int(random.random()*20+1)) for t in tags] if t[1]]
        count = sum([t[1] for t in s])
        dd = 1 if (count == 0 or not len(tags)) else count / len(tags)
        sidebar_tags = list(
            map(lambda x: (x[0], x[1], int((x[1] / dd) * increment + 10)), s))
        random.shuffle(sidebar_tags)
    return {
        'sidebar_categorys': sidebar_categorys,
        'sidebar_tags': sidebar_tags,
        'user':user,
    }


@register.simple_tag
def query(qs, **kwargs):
    """ template tag which allows queryset filtering. Usage:
          {% query books author=author as mybooks %}
          {% for book in mybooks %}
            ...
          {% endfor %}
    """
    return qs.filter(**kwargs)