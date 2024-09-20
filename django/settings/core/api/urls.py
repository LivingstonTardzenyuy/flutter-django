from django.contrib import admin
from django.urls import path, include
from django.http import HttpResponse
from .views import aPage

# urlpatterns = [
#     path('', aPage),
# ]



urlpatterns = [
    path('rest-auth/', include('dj_rest_auth.urls')),
    path('auth/registration/', include('dj_rest_auth.registration.urls')),                                                                                                                                                                                                            
    path('auth/', include('dj_rest_auth.urls')),
    path('account/', include('allauth.urls')),
    ]