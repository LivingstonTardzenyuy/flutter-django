from django.urls import path 

from book.api.views import BooksListView

urlpatterns = [
    path('', BooksListView.as_view(), name='book_list'),
]
