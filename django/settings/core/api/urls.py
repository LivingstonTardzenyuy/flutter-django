from django.contrib import admin
from django.urls import path, include
from django.http import HttpResponse
from .views import aPage

urlpatterns = [
    path('', aPage),
    
]
