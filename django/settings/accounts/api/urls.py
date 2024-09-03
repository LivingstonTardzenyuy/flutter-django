from django.urls import path, include

urlpatterns = [path('', include('dj_rest_auth.urls')),
               
    path('rest-auth/registration/', include('dj_rest_auth.registration.urls')),                                                                                                                                                                                                            
    path('auth/', include('dj_rest_auth.urls')),path('account/', include('allauth.urls')),]