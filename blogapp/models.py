from django.db import  models
from django.contrib.auth.models import User
from django.utils.timezone import now
from django.urls import reverse
from abc import abstractclassmethod

# Create your models here.
class BaseModel(models.Model):
    id = models.AutoField(primary_key=True)
    created_time = models.DateTimeField('创建时间', default=now)
    last_mod_time = models.DateTimeField('修改时间', default=now)
    class Meta:
        abstract = True

class SlugModel(BaseModel):
    slug = models.SlugField(default='no-slug', max_length=60, blank=True)
    class Meta:
        abstract = True
    @abstractclassmethod
    def get_absolute_url(self):
        pass

class Message(models.Model):
    title=models.CharField('标题', max_length=15)
    username=models.CharField('用户名', max_length=20)
    content=models.TextField('内容', max_length=500)
    publish=models.DateTimeField('发布时间', default=now)

class Category(SlugModel):
    name = models.CharField('分类', max_length=30, unique=True)

    def get_absolute_url(self):
        return reverse(
            'blogapp:category_detail', kwargs={
                'category_slug': self.slug})

class Tag(SlugModel):
    name = models.CharField('标签名', max_length=30, unique=True)

    def get_absolute_url(self):
        return reverse('blogapp:tag_detail', kwargs={'tag_slug': self.slug})

    def get_article_count(self):
        return Article.objects.filter(tags__name=self.name).distinct().count()

class Article(models.Model):
    # user = models.ForeignKey(User)
    title=models.CharField('标题', max_length=20)
    # _CHOICE=(
    #     ('1', 'c#'),
    #     ('2', 'python'),
    #     ('3', 'sql'),
    #     ('4', '数据结构'),
    # )
    # type=models.CharField(max_length=4,choices=_CHOICE, default='1')
    category = models.ForeignKey(Category,
        on_delete=models.CASCADE,
        db_column = "category",
        verbose_name="分类",
        )
    tags = models.ManyToManyField('Tag', verbose_name='标签集合', blank=True)
    introduce=models.CharField('介绍', max_length=100)
    content=models.TextField('内容', max_length=10000)
    #通过顺序就映射了数据库的数据了1

    def get_absolute_url(self):
        return reverse(
            'blogapp:article', kwargs={
                'article_id': self.id})

    def comment_list(self):
        comments = self.comment_set.filter(is_enable=True)
        return comments