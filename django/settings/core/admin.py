from django.contrib import admin

from django.contrib.auth.admin import User 
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import User 

# Register your models here.
admin.site.register(User)
# class UserAdmin(BaseUserAdmin):
#     # This fieldset allow use to specify the fields needed to be use when adding a user.
#     add_fieldsets = (
#         (
#             None,
#             {
#                 "classes": ("wide",),
#                 "fields": ("username","email" "password1", "password2", ),
#             },
#         ),
#     )