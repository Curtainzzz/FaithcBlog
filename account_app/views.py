from django.views.generic import FormView,RedirectView,TemplateView
# from django.contrib.sites.models import Site
from django.contrib.auth.views import LoginView
from django.urls.base import reverse
from django.core.mail import send_mail
from django.shortcuts import redirect,get_object_or_404

from account_app.form import *
from .defines import *
# Create your views here.

class BlogRegisterView(FormView):
    template_name = 'account/register_form.html'
    form_class = RegisterForm

    def form_valid(self, form):
        user = form.save(False)
        user.is_active = False
        user.source = 'Register'
        user.save(True)
        # site = Site.objects.get_current().domain
        ip = self.request.get_host()
        path = reverse('account_app:result')
        user_id = user.id
        url=f"http://{ip}{path}?type=validation&id={user_id}"
        print(EMAIL_REGISTER_MESSAGE.format(url=url), user.email)
        send_mail('验证您的电子邮箱',EMAIL_REGISTER_MESSAGE.format(url=url),None,[user.email])
        url = reverse('account_app:result') + '?type=register&id=' + str(user.id)
        print(url,2222222222222)
        return redirect(url)

class BlogLoginView(LoginView):
    template_name = 'account/login_form.html'
    success_url = 'blogapp:article_list'
    authentication_form = LoginForm

    def get_success_url(self):
        return reverse(self.success_url)

class BlogLogoutView(RedirectView):
    url = '/account/login/'

    def get(self, request, *args, **kwargs):
        from django.contrib.auth import logout
        logout(request)
        return super(BlogLogoutView, self).get(request, *args, **kwargs)

class RegisterResultView(TemplateView):
    template_name = 'account/result.html'

    def get(self, request, *args, **kwargs):
        r_type = request.GET.get('type')
        r_id = request.GET.get('id')
        print(r_type,r_id)
        user = get_object_or_404(get_user_model(), id=r_id)
        if user.is_active:
            return redirect('/')
        context = {}
        if r_type in result_get_dct:
            context = result_get_dct[r_type](user)
        return self.render_to_response(context)

def register_result(user):
    content = '''
       恭喜您注册成功，一封验证邮件已经发送到您 {email} 的邮箱，请验证您的邮箱后登录本站。
       '''.format(email=user.email)
    title = '注册成功'
    return {'title': title, 'content': content}

def validation_result(user):
    user.is_active = True
    user.save()
    content = '''
    恭喜您已经成功的完成邮箱验证，您现在可以使用您的账号来登录本站。
    '''
    title = '验证成功'
    return {'title': title, 'content': content}

result_get_dct = {
    'register': register_result,
    'validation': validation_result,

}