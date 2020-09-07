from django.db import  models
# Create your models here.
class message(models.Model):
    title=models.CharField(max_length=15)
    username=models.CharField(max_length=20)
    content=models.TextField(max_length=500)
    publish=models.DateTimeField()
class Article(models.Model):
    _CHOICE=(
        ('1', 'c#'),
        ('2', 'python'),
        ('3', 'sql'),
        ('4', '数据结构'),
    )
    title=models.CharField(max_length=20)
    type=models.CharField(max_length=4,choices=_CHOICE)
    introduce=models.CharField(max_length=100)
    content=models.TextField(max_length=10000)
    #通过顺序就映射了数据库的数据了