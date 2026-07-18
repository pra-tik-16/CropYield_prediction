from django.db.models import Max, Min
from django.shortcuts import render, redirect


# Create your views here.
from crop_yield.models import crop_yield_data, yield_fertilizer, dist_soil
from farmer.models import user_registration


def user_home(request):
    return render(request,'farmer_yield/user_home.html')

def user_login(request):
    if request.method == "POST":
        uname = request.POST.get('user_email')
        pswd = request.POST.get('user_pwd')
        try:
            check = user_registration.objects.get(email=uname, pwd=pswd)
            request.session['reg_id'] = check.reg_id
            request.session['email'] = check.email
            request.session['mobile'] = check.mobile
            return redirect('user_home')
        except:
            pass
    return render(request,'farmer_yield/user_login.html')

def user_reg(request):
    if request.method == "POST":
        fname = request.POST.get('fname')
        lname = request.POST.get('lname')
        email = request.POST.get('email')
        pwd = request.POST.get('pwd')
        conpwd = request.POST.get('conpwd')
        mobile = request.POST.get('mob')
        user_registration.objects.create(fname = fname, lname = lname, email = email, pwd = pwd, conpwd = conpwd, mobile = mobile)
        return redirect('user_login')
    return render(request,'farmer_yield/user_reg.html')

def crop_data(request):
    # state_list = ['Tamil Nadu','Karanataka','Andhra Pradesh', 'Kerala']
    # dist_list = [['ARIYALUR','COIMBATORE', 'CUDDALORE', 'DHARMAPURI', 'DINDIGUL', 'ERODE', 'KANCHIPURAM',
    #                     'KANNIYAKUMARI', 'KARUR', 'KRISHNAGIRI', 'MADURAI', 'NAGAPATTINAM', 'NAMAKKAL', 'PERAMBALUR',
    #                     'PUDUKKOTTAI', 'RAMANATHAPURAM', 'SALEM', 'SIVAGANGA', 'THANJAVUR', 'THE NILGIRIS', 'THENI',
    #                     'THIRUVALLUR', 'THIRUVARUR', 'TIRUCHIRAPPALLI', 'TIRUNELVELI', 'TIRUPPUR', 'TIRUVANNAMALAI',
    #                     'TUTICORIN', 'VELLORE', 'VILLUPURAM', 'VIRUDHUNAGAR'],
    #              ['Bagalkot', 'Bengaluru Urban', 'Bengaluru Rural', 'Belagavi', 'Ballari', 'Bidar', 'Vijayapur', 'Chamarajanagar',
    #               'Chikballapur', 'Chikkamagaluru', 'Chitradurga', 'Dakshina Kannada', 'Davanagere', 'Dharwad', 'Gadag',
    #               'Kalaburagi', 'Hassan', 'Haveri', 'Kodagu', 'Kolar', 'Koppal', 'Mandya', 'Mysuru', 'Raichur', 'Ramanagara',
    #               'Shivamogga', 'Tumakuru', 'Udupi', 'Uttara Kannada', 'Yadgir'],
    #              ['Anantapur', 'Chittoor', 'East Godavari', 'Guntur', 'Kadapa', 'Krishna', 'Kurnool', 'Sri Potti Sri Ramulu Nellore',
    #               'Prakasam', 'Srikakulam',	'Visakhapatnam', 'Vizianagaram', 'West Godavari'],
    #              ['Alappuzha', 'Ernakulam', 'Idukki', 'Kannur', 'Kasaragod', 'Kollam', 'Kottayam', 'Kozhikode', 'Malappuram',
    #               'Palakkad', 'Pathanamthitta', 'Thiruvananthapuram', 'Thrissur', 'Wayanad']]
    con = {
        "crop_list" : ['Apple', 'Arecanut', 'Arhar/Tur', 'Ash Gourd', 'Bajra', 'Banana', 'Beans & Mutter(Vegetable)',
                       'Beet Root', 'Ber', 'Bhindi', 'Bitter Gourd', 'Black pepper', 'Bottle Gourd', 'Brinjal', 'Cabbage',
                       'Cardamom', 'Carrot', 'Cashewnut', 'Castor seed', 'Cauliflower', 'Citrus Fruit', 'Coconut', 'Coriander',
                       'Cotton(lint)', 'Cucumber', 'Drum Stick', 'Dry chillies', 'Dry ginger', 'Garlic', 'Gram', 'Grapes',
                       'Groundnut', 'Guar seed', 'Horse-gram', 'Jack Fruit', 'Jowar', 'Jute', 'Korra', 'Lab-Lab', 'Litchi',
                       'Maize', 'Mango', 'Mesta', 'Moong(Green Gram)', 'Niger seed', 'Onion', 'Orange', 'Other Cereals & Millets',
                       'Other Citrus Fruit', 'Other Fresh Fruits', 'Other Kharif pulses', 'Other Vegetables', 'Papaya', 'Peach',
                       'Pear', 'Pineapple', 'Plums', 'Pome Fruit', 'Pome Granet', 'Potato', 'Pulses total', 'Pump Kin', 'Ragi',
                       'Rapeseed &Mustard', 'Redish', 'Ribed Guard', 'Rice', 'Samai', 'Sannhamp', 'Sesamum', 'Small millets',
                       'Snak Guard', 'Soyabean', 'Sugarcane', 'Sunflower', 'Sweet potato', 'Tapioca', 'Tobacco', 'Tomato',
                       'Total foodgrain', 'Turmeric', 'Turnip', 'Urad', 'Varagu', 'Water Melon', 'Wheat', 'Yam'],
        "soil_list" : ['Alluvium', 'Black', 'Calcareous Black', 'Clay Loam', 'Coastal Alluvium', 'Deep Red Loam',
                       'Deep Red Soil', 'Lateritic', 'Non Calcareous Brown', 'Non Calcareous Red', 'Red Loamy',
                       'Red Sandy Loam', 'Red Sandy Soil', 'Saline Coastal Alluvium'],
        "season_list":['Winter', 'Summer', 'Spring', 'Autumn'],
        "fert_list": ['Urea', 'DAP', '14 - 35 - 14', '28 - 28', '17 - 17 - 17', '20 - 20', '10 / 26 / 2026'],
        "state_list": ['Tamil Nadu',]
    }
    if request.method == "POST":
        state = request.POST.get('state')
        district = request.POST.get('district')
        area = request.POST.get('area')
        crop = request.POST.get('crop')
        crop_year = request.POST.get('year')
        season = request.POST.get('season')
        soil_type = request.POST.get('soil')
        temperature = request.POST.get('temperature')
        potassium = request.POST.get("potassium_p")
        phosphorous = request.POST.get("phosphorus_ph")
        nitrogen = request.POST.get("nitro_n")
        fertilizer = request.POST.get("fertilizer_f")
        production = request.POST.get('production')
        humidity = request.POST.get('humid_h')
        moisture = request.POST.get('moist_m')
        crop_yield_data.objects.create(state = state, district = district, crop_year = crop_year,
                                       season = season, crop = crop, area = area, soil_type = soil_type,
                                       temperature = temperature, potassium_p = potassium, phosphorous_ph = phosphorous,
                                       nitrogen_n =nitrogen, fertilizer_f = fertilizer, production = production,
                                       humid=humidity,moist=moisture)
    return render(request,'farmer_yield/crop_data.html', {'data':con})

def query_farmer(request):
    val1=""
    val=""
    con = dist_soil.objects.all()
    if request.method == "POST":
        val_dist = request.POST.get("district")
        val_state = request.POST.get("state")
        soiltype=dist_soil.objects.filter(dist_name=val_dist)
        for i in soiltype:
            value = i.type_soil
            val=crop_yield_data.objects.filter(state=val_state,district = val_dist, soil_type=value)
            for i in val:
                val1=i.district
        print(val1)
    return render(request,'farmer_yield/query_farmer.html', {'data':con, 'vdist':val, 'dist':val1})

def adv_search(request):
    val=""
    val1=""
    con = {
        "soil_list": ['Alluvium', 'Black', 'Calcareous Black', 'Clay Loam', 'Coastal Alluvium', 'Deep Red Loam',
                      'Deep Red Soil', 'Lateritic', 'Non Calcareous Brown', 'Non Calcareous Red', 'Red Loamy',
                      'Red Sandy Loam', 'Red Sandy Soil', 'Saline Coastal Alluvium']
    }
    if request.method == "POST":
        val_soil = request.POST.get('soil')
        val=yield_fertilizer.objects.filter(soil_type=val_soil)
        for i in val:
            val1=i.soil_type
    return render(request,'farmer_yield/adv_search.html', {'data':con, 'vdist':val, 'soil1':val1})

def crop_prediction(request):
    val=""
    val1=""
    con = {
        "soil_list": ['Alluvium', 'Black', 'Calcareous Black', 'Clay Loam', 'Coastal Alluvium', 'Deep Red Loam',
                      'Deep Red Soil', 'Lateritic', 'Non Calcareous Brown', 'Non Calcareous Red', 'Red Loamy',
                      'Red Sandy Loam', 'Red Sandy Soil', 'Saline Coastal Alluvium']
    }
    if request.method=="POST":
        valsoil = request.POST.get('soil')
        max1=crop_yield_data.objects.filter(soil_type=valsoil).aggregate(Max('production'))
        #max1 = crop_yield_data.objects.aggregate(Max('production'))
        aa=max1['production__max']
        print(aa)
        val=crop_yield_data.objects.filter(soil_type=valsoil, production=aa)
        for i in val:
            val1=i.soil_type
    return render(request, 'farmer_yield/crop_prediction.html', {'prod':val, 'data':con, 'soil1':val1})

def user_logout(request):
    del request.session['reg_id'], request.session['email'], request.session['mobile']
    return render(request,'Prediction/index.html')