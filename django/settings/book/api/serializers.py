from rest_framework import serializers
from book.models import Subject, Author, Publisher, Book 

class SubjectSerializer(serializers.ModelSerializer):
    book_subject = serializers.StringRelatedField(many=True)
    class Meta:
        model = Subject
        fields = "__all__"
        
    
class AuthorSerializer(serializers.ModelSerializer):
    book_author = serializers.StringRelatedField(many=True)
    class Meta:
        model = Author 
        field = "__all__"
        
class PublisherSerializer(serializers.ModelSerializer):
    book_publisher = serializers.StringRelatedField(many=True)
    class Meta:
        model = Publisher
        fields = "__all__"
        
class BooksSerializer(serializers.ModelSerializer):
    author = serializers.StringRelatedField()
    publisher = serializers.StringRelatedField()
    subject = serializers.StringRelatedField()
    class Meta:
        model=Book
        # fields=["name", "price", "discount", "image", "preview", "last_sold", "subject", "author", "publisher"]
        fields="__all__"