from django.shortcuts import render, redirect
from django.db.models import Count

# Create your views here.
from crop_yield.models import admin_reg, crop_yield_data, dist_soil, soil_list, yield_fertilizer

def index(request):
    return render(request,'Prediction/index.html')

def home(request):
    return render(request,'Prediction/home.html')

def contact(request):
    return render(request,'Prediction/contact.html')

def registration(request):
    if request.method == "POST":
        fname = request.POST.get('fname')
        lname = request.POST.get('lname')
        email = request.POST.get('email')
        pwd = request.POST.get('pwd')
        conpwd = request.POST.get('conpwd')
        mobile = request.POST.get('mob')
        admin_reg.objects.create(fname = fname, lname = lname, email = email, pwd = pwd, conpwd = conpwd, mobile = mobile)
        return redirect('login')
    return render(request,'Prediction/registration.html')

def login(request):
    if request.method == "POST":
        aname = request.POST.get('admin_email')
        pswd = request.POST.get('admin_pwd')
        try:
            check = admin_reg.objects.get(email=aname, pwd=pswd)
            request.session['reg_id'] = check.reg_id
            request.session['email'] = check.email
            request.session['mobile'] = check.mobile
            return redirect('home')
        except:
            pass
    return render(request,'Prediction/login.html')

def yield_data(request):
    chart = ''
    district_name = dist_soil.objects.all()
    if request.method == "POST":
        dist_soil1 = request.POST.get('distsoil')
        print(dist_soil1)
        # chart = crop_yield_data.objects.exclude(district=dist_soil1).values('production','soil_type')
        chart = crop_yield_data.objects.filter(district=dist_soil1).values('soil_type','production','crop')
        #chart = crop_yield_data.objects.filter(soil_type=dist_soil1).values('soil_type').annotate(datacount=Count("production"))
        print(chart)
    return render(request, 'Prediction/yield_data.html', {'list':district_name, 'obj':chart})

def response_query(request):
    view_data = yield_fertilizer.objects.all()
    return render(request, 'Prediction/response_query.html',{'prod':view_data})

def view_crop_data(request):
    view_data = crop_yield_data.objects.all()
    return render(request, 'Prediction/view_crop_data.html',{'prod':view_data})

def dist_soiltype(request):
    data = soil_list.objects.all()
    if request.method == "POST":
        dist = request.POST.get("dist_name")
        soil = request.POST.get("soil_name")
        dist_soil.objects.create(dist_name=dist, type_soil=soil)
    return render(request, 'Prediction/dist_soiltype.html', {'soil_data':data})

def soillist(request):
    if request.method == "POST":
        soil = request.POST.get("soil_name")
        soil_list.objects.create(soil_type=soil)
    return render(request, 'Prediction/soillist.html')

def logout(request):
    del request.session['reg_id'], request.session['email'], request.session['mobile']
    return redirect('index')