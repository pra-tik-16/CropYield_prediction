from django.db import models

# Create your models here.

class user_registration(models.Model):
    reg_id = models.AutoField(primary_key=True)
    fname = models.CharField(max_length=100)
    lname = models.CharField(max_length=100)
    email = models.CharField(max_length=300)
    pwd = models.CharField(max_length=20)
    conpwd = models.CharField(max_length=20)
    mobile = models.CharField(max_length=10)