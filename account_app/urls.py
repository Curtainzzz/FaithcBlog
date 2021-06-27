
from account_app.views import *
from django.urls import path,re_path

urlpatterns = [
    path(r'login/', BlogLoginView.as_view(), name='login'),
    path(r'register/', BlogRegisterView.as_view(), name='register'),
    path(r'logout/', BlogLogoutView.as_view(), name='logout'),
    re_path(r'result/', RegisterResultView.as_view(), name='result'),
]