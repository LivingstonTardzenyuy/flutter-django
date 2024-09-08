from django.shortcuts import render

from rest_framework import generics
from book.api.serializers import *
from book.models import Book

class BooksListView(generics.ListAPIView):
    queryset = Book.objects.all()
    serializer_class = BooksSerializer
    
    