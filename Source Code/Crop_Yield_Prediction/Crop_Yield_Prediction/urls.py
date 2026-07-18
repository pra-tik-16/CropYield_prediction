"""Crop_Yield_Prediction URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.conf import settings
from django.conf.urls import url
from django.conf.urls.static import static
from django.contrib import admin
from django.urls import path
from crop_yield import views as view
from farmer import views as viewfarmer

urlpatterns = [
    path('admin/', admin.site.urls),
    url('^$', view.index, name="index"),
    url('^home/$', view.home, name="home"),
    url('^contact/$', view.contact, name="contact"),
    url('^login/$', view.login, name="login"),
    url('^registration/$', view.registration, name="registration"),
    url('^view_crop_data/$', view.view_crop_data, name="view_crop_data"),
    url('^response_query/$', view.response_query, name="response_query"),
    url('^soillist/$', view.soillist, name="soillist"),
    url('^dist_soiltype/$', view.dist_soiltype, name="dist_soiltype"),
    url('^yield_data/$', view.yield_data, name="yield_data"),
    url('^logout/$', view.logout, name="logout"),
    url('^user_home/$', viewfarmer.user_home, name="user_home"),
    url('^user_login/$', viewfarmer.user_login, name="user_login"),
    url('^user_reg/$', viewfarmer.user_reg, name="user_reg"),
    url('^crop_data/$', viewfarmer.crop_data, name="crop_data"),
    url('^adv_search/$', viewfarmer.adv_search, name="adv_search"),
    url('^query_farmer/$', viewfarmer.query_farmer, name="query_farmer"),
    url('^crop_prediction/$', viewfarmer.crop_prediction, name="crop_prediction"),
    url('^user_logout/$', viewfarmer.user_logout, name="user_logout"),
]+static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)