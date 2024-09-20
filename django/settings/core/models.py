# from django.contrib.auth.models import AbstractUser
# from django.db import models

# from django.contrib.auth.backends import ModelBackend

# # Create your models here.
# class User(AbstractUser):
#     email = models.EmailField(unique=True)
    
    
# class EmailBackend(ModelBackend):
#     def authenticate(self, request, username=None, password=None, **kwargs):
#         from django.contrib.auth import get_user_model
#         UserModel = get_user_model()
        
#         try:
#             user = UserModel.objects.get(username=username)
#         except UserModel.DoesNotExist:
#             try:
#                 user = UserModel.objects.get(email=username)
#             except UserModel.DoesNotExist:
#                 UserModel().set_password(password)
#             else:
#                 if user.check_password(password) and self.user_can_authenticate(user):
#                     return user
#         else:
#             if user.check_password(password) and self.user_can_authenticate(user):
#                 return user

from django.contrib.auth.models import AbstractUser
from django.db import models
from django_resized import ResizedImageField


def upload_to(inst, filename):
    return "/profile/"+str(filename)

class User(AbstractUser):
    email = models.EmailField(unique=True)
    nickname = models.CharField(max_length=55)
    profile_picture = ResizedImageField(size=[500, 300], upload_to=upload_to, null=True, blank=True)
    
