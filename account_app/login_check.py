import functools
from django.shortcuts import redirect, reverse

def login_require(func):
    @functools.wraps(func)
    def decorator(obj, *args, **kwargs):
        if not obj.request.user.is_authenticated:
            return redirect(reverse('account_app:login'))
        return func(obj,*args, **kwargs)
    return decorator