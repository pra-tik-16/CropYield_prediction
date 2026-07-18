from django.db import models

# Create your models here.
class admin_reg(models.Model):
    reg_id = models.AutoField(primary_key=True)
    fname = models.CharField(max_length=100)
    lname = models.CharField(max_length=100)
    email = models.CharField(max_length=300)
    pwd = models.CharField(max_length=20)
    conpwd = models.CharField(max_length=20)
    mobile = models.CharField(max_length=10)

class crop_yield_data(models.Model):
    crop_id = models.AutoField(primary_key=True)
    state = models.CharField(max_length=300)
    district = models.CharField(max_length=300)
    crop_year = models.CharField(max_length=20)
    season = models.CharField(max_length=300)
    crop = models.CharField(max_length=300)
    area = models.CharField(max_length=300)
    soil_type = models.CharField(max_length=300)
    temperature = models.CharField(max_length=300)
    potassium_p = models.CharField(max_length=30)
    phosphorous_ph = models.CharField(max_length=30)
    nitrogen_n = models.CharField(max_length=30)
    fertilizer_f = models.CharField(max_length=300)
    production = models.IntegerField()
    humid = models.CharField(max_length=30)
    moist = models.CharField(max_length=30)

class yield_fertilizer(models.Model):
    yield_id = models.AutoField(primary_key=True)
    district = models.CharField(max_length=300)
    soil_type = models.CharField(max_length=300)
    temp = models.CharField(max_length=30)
    humid = models.CharField(max_length=30)
    moisture = models.CharField(max_length=30)
    potassium = models.CharField(max_length=30)
    phosphorous = models.CharField(max_length=30)
    nitrogen = models.CharField(max_length=30)
    fertilizer = models.CharField(max_length=300)

class dist_soil(models.Model):
    dist_id = models.AutoField(primary_key=True)
    dist_name = models.CharField(max_length=300)
    type_soil = models.CharField(max_length=300)

class soil_list(models.Model):
    soil_id = models.AutoField(primary_key=True)
    soil_type = models.CharField(max_length=300)

class farmer_query_agri(models.Model):
    farmer_id = models.AutoField(primary_key=True)
