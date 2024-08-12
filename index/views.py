from django.shortcuts import render,redirect
from django.http import HttpResponse
from .models import Machine_details  # Import your Machine model
from .forms import *
from .models import *

# Create your views here.
def Homepage(request):
    
    return render(request,'index.html')

def aboutpage(request):
    
    return render(request,'about.html')

def contactpage(request):
    
    return render(request,'contact.html')

# machine Details add page
def machine_details_page(request):
    
    context = {
        'Machine_details_form':Machine_details_form()
    }
    
    if request.method == "POST":
        
        Machine_details_Form = Machine_details_form(request.POST ,request.FILES)
        
        if Machine_details_Form.is_valid():
            
            Machine_details_Form.save()
    
    return render(request,'Machine_details.html',context)

#machine detail view Page
def machine_details_view(request):
    context={
    "all_machines": Machine_details.objects.all()
    }
    
    return render(request,'machine_details_view.html',context)

#machines Delete page
def Deletemachines(request, id ):
    
    selected_machine = Machine_details.objects.get(Machine_id  = id)
    selected_machine.delete()
    
    return redirect('/index/machine_details_view/')
    
#machines update page  
def Machineupdate(request , id):
    
    selected_machine = Machine_details.objects.get(Machine_id = id )
 
    context = {
 
    "machine_form ": Machine_details_form(instance = selected_machine),
    
    }
    if request.method == "POST":
        
        Machine_details_Form = Machine_details_form(request.POST ,request.FILES ,instance = selected_machine)

        if Machine_details_Form.is_valid():
            
            Machine_details_Form.save()
            
            return redirect('/index/machine_details_view/')

    
    return render(request, 'Machine_details.html',context)