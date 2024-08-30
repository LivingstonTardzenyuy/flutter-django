from django.http import HttpResponse, JsonResponse
from django.contrib.auth.models import User
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def aPage(request):
    # user = User.objects.get(pk=1)
    username = request.Post.get('username')
    email = request.POST.get('email')
    
    print(email)
    print(username)
    return JsonResponse({"username": username, "email":email})