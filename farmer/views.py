from django.shortcuts import render
from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import FarmerRegistrationForm, FarmerLoginForm
from .models import Farmer
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required



def register(request):
    if request.method == 'POST':
        form = FarmerRegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Registration successful. You can now log in.')
            return redirect('login')
    else:
        form = FarmerRegistrationForm()
    return render(request, 'farmer/register.html', {'form': form})


def login(request):
    if request.method == 'POST':
        form = FarmerLoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            user = Farmer.objects.get(username=username)
            request.session['user_id'] = user.id
            messages.success(request, 'Login successful.')
            return redirect('dashboard')  # Redirect to dashboard after login
    else:
        form = FarmerLoginForm()
    return render(request, 'farmer/login.html', {'form': form})
'''
def dashboard(request):
    return render(request, 'farmer/dashboard.html')
'''

from index.models import Machine_details  # Import your Machine model
from farmer.models import Farmer
def dashboard(request):
    # Fetch all machines
    all_machines = Machine_details.objects.all()
    farmer_id = Farmer.objects.all() # or however you get the farmer's ID

    context = {
        'farmer_id': farmer_id,
        'all_machines': all_machines,
    }
    
    return render(request, 'farmer/dashboard.html', context)


from django.shortcuts import render, get_object_or_404, redirect
from .models import  RentalRequest
from .forms import RentalRequestForm
# Relative import
# Absolute import


def view_machines(request):
    all_machines = Machine_details.objects.all()
    farmer_id = Farmer.objects.all() # or however you get the farmer's ID
    form = RentalRequestForm()
    return render(request, 'dashboard.html', {'all_machines': all_machines,'farmer_id': farmer_id,'form': form})

from .models import RentalRequest
from .forms import RentalRequestForm

from django.shortcuts import render, get_object_or_404, redirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from .forms import RentalRequestForm
from .models import Machine_details, RentalRequest, Farmer
from Machine_owner.models import MachineOwner

def rental_request(request, machine_id,farmer_id):
    machine = get_object_or_404(Machine_details, pk=machine_id)
    farmer = get_object_or_404(Farmer, pk=farmer_id)
    owner = machine.Machine_owner  # Get the machine owner from the Machine_details model
    
    #farmer = get_object_or_404(Farmer,username=request.user.username)
    #farmer = Farmer.objects.get(request.POST['farmer'])
    
    if request.method == 'POST':
        form = RentalRequestForm(request.POST)
        if form.is_valid():
            rental_request = form.save(commit=False)
            rental_request.machine = machine  # Associate the machine
            rental_request.owner = owner  # Associate the owner
            rental_request.farmer = farmer  # Associate the farmer

            # Set additional fields
            rental_request.farmer_name = farmer.username
            rental_request.farmer_contact = farmer.mobile_no
            rental_request.owner_username = owner.username

            rental_request.save()
            return redirect('success')  # Redirect to a success page or wherever you want
    else:
        form = RentalRequestForm()

    context = {
        'form': form,
        'machine': machine,
        'owner': owner,
        'farmer': farmer
    }
    return render(request, 'farmer/rental_request.html', context)



def success(request):
    return render(request, 'farmer/success.html')

def farmer_rental_requests(request):
    farmer_id = request.session['user_id']
    rental_requests = RentalRequest.objects.filter(farmer_id=farmer_id).select_related('machine', 'owner')

    context = {
        'rental_requests': rental_requests
    }
    return render(request, 'farmer/farmer_rental_requests.html', context)

def rental_request_details(request, request_id):
    rental_request = get_object_or_404(RentalRequest, id=request_id, farmer_id=request.session['user_id'])

    context = {
        'rental_request': rental_request
    }
    return render(request, 'farmer/rental_request_details.html', context)

from .models import RentalRequest, Payment
from .forms import PaymentForm
import uuid


'''
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from .forms import PaymentForm
from .models import RentalRequest
import uuid

def payment(request, request_id):
    rental_request = get_object_or_404(RentalRequest, id=request_id, farmer_id=request.session['user_id'])
    total_amount = rental_request.total_amount()  # Calculate total amount

    if request.method == 'POST':
        form = PaymentForm(request.POST)
        if form.is_valid():
            payment = form.save(commit=False)
            payment.rental_request = rental_request
            payment.farmer = rental_request.farmer
            payment.transaction_id = uuid.uuid4().hex  # Generate a unique transaction ID
            payment.save()
            messages.success(request, 'Payment successful.')
            return redirect('payment_success')  # Redirect to a success page
    else:
        form = PaymentForm(initial={'amount': total_amount})  # Pre-fill the amount

    context = {
        'form': form,
        'rental_request': rental_request,
        'total_amount': total_amount
    }
    return render(request, 'farmer/payment.html', context)
'''
from django.shortcuts import render, get_object_or_404, redirect
from django.contrib import messages
from .forms import PaymentForm
from .models import RentalRequest, Payment
import uuid

def payment(request, request_id):
    rental_request = get_object_or_404(RentalRequest, id=request_id, farmer_id=request.session['user_id'])
    total_amount = rental_request.total_amount()  # Calculate total amount

    # Check if a payment has already been made for this rental request
    if Payment.objects.filter(rental_request=rental_request).exists():
        messages.warning(request, 'Payment for this rental request has already been made.')
        return redirect('payment_success')  # Redirect to a success page or appropriate page

    if request.method == 'POST':
        form = PaymentForm(request.POST)
        if form.is_valid():
            payment = form.save(commit=False)
            payment.rental_request = rental_request
            payment.farmer = rental_request.farmer
            payment.transaction_id = uuid.uuid4().hex  # Generate a unique transaction ID
            payment.save()
            messages.success(request, 'Payment successful.')
            return redirect('payment_success')  # Redirect to a success page
    else:
        form = PaymentForm(initial={'amount': total_amount})  # Pre-fill the amount

    context = {
        'form': form,
        'rental_request': rental_request,
        'total_amount': total_amount
    }
    return render(request, 'farmer/payment.html', context)

def payment_success(request):
    return render(request, 'farmer/payment_success.html')