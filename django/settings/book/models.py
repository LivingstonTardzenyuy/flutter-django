from django.db import models

# Create your models here.
class Subject(models.Model):
    name = models.CharField(max_length=250)
    
class Author(models.Model):
    name = models.CharField(max_length=250)
    
    def __str__(self):
        return self.name
    
class Publisher(models.Model):
    name = models.CharField(max_length=500)
    

class Book(models.Model):
    name = models.CharField(max_length=500)
    price = models.IntegerField()
    discount = models.IntegerField()
    image = models.ImageField(upload_to="image", null=True)
    preview = models.FileField(upload_to="preview", null=True)
    last_sold = models.DateTimeField(null=True)
    subject = models.ForeignKey(Subject, related_name='book_subject', on_delete=models.PROTECT, null=True)
    author = models.ForeignKey(Author, related_name='book_author', on_delete=models.PROTECT, null=True)
    publisher = models.ForeignKey(Publisher, related_name='book_publisher', on_delete=models.PROTECT, null=True)
    
    
    def __str__(self):
        return self.name