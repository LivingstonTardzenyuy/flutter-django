from rest_framework import serializers
from book.models import Subject, Author, Publisher, Book 

import base64   # to convert our image to base64 encode 

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
    
    image_memory = serializers.SerializerMethodField("get_image_memory")
    price_with_discount = serializers.SerializerMethodField("get_price_with_discount")
    class Meta:
        model=Book
        # fields=["name", "price", "discount", "image", "preview", "last_sold", "subject", "author", "publisher"]
        exclude=("last_sold",)
        
        
        
    def get_image_memory(request, book:Book):
        with open( book.image.name, 'rb' ) as loadedfile:
            return base64.b64encode(loadedfile.read())
        
    def get_price_with_discount(request, book:Book):
        return book.price - (book.discount/100) * book.price 