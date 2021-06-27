
from django.forms import  ModelForm
from django import forms
from .models import Comment

class CommentForm(ModelForm):
    # username = forms.CharField(widget=forms.HiddenInput)
    parent_comment_id = forms.IntegerField(
        widget=forms.HiddenInput, required=False)

    class Meta:
        model = Comment
        fields = ['message']