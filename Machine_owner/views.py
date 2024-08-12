from django.shortcuts import render, redirect
from django.contrib import messages
from .forms import MachineOwnerRegistrationForm, MachineOwnerLoginForm
from .models import MachineOwner
from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required
from .forms import MachineOwnerLoginForm

def register1(request):
    if request.method == 'POST':
        form = MachineOwnerRegistrationForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Registration successful. You can now log in.')
            return redirect('login1')
    else:
        form = MachineOwnerRegistrationForm()
    return render(request, 'owners/register1.html', {'form': form})


def login1(request):
    if request.method == 'POST':
        form = MachineOwnerLoginForm(request.POST)
        if form.is_valid():
            username = form.cleaned_data['username']
            user = MachineOwner.objects.get(username=username)
            request.session['user_id'] = user.id
            messages.success(request, 'Login successful.')
            return redirect('dashboard1')  # Redirect to dashboard after login
    else:
        form = MachineOwnerLoginForm()
    return render(request, 'owners/login1.html', {'form': form})

def dashboard1(request):
    '''
    payments = Payment.objects.all()

    context = {
        'payments': payments,
    }
    '''
    return render(request, 'owners/dashboard1.html')


from farmer.models import RentalRequest
from django.shortcuts import render, get_object_or_404, redirect

'''
def owner_rental_requests(request):
    request_owner_id = request.session['user_id']
    rental_requests = RentalRequest.objects.filter(owner_id=request_owner_id)

    context = {
        'rental_requests': rental_requests
    }
    return render(request, 'owners/rental_requests.html', context)
'''
def owner_rental_requests(request):
    request_owner_id = request.session['user_id']
    rental_requests = RentalRequest.objects.filter(owner_id=request_owner_id).select_related('farmer', 'machine')

    context = {
        'rental_requests': rental_requests
    }
    return render(request, 'owners/rental_requests.html', context)
from django.urls import reverse

def accept_rental_request(request, request_id):
    rental_request = get_object_or_404(RentalRequest, id=request_id)
    if rental_request.owner.id == request.session['user_id']:
        rental_request.status = 'APPROVED'
        rental_request.save()
        messages.success(request, 'Rental request accepted.')
    return redirect(reverse('owner_rental_requests'))

def reject_rental_request(request, request_id):
    rental_request = get_object_or_404(RentalRequest, id=request_id)
    if rental_request.owner.id == request.session['user_id']:
        rental_request.status = 'REJECTED'
        rental_request.save()
        messages.success(request, 'Rental request rejected.')
    return redirect(reverse('owner_rental_requests'))
'''
from django.shortcuts import render, get_object_or_404
from farmer.models import Payment, RentalRequest
from django.http import HttpResponseForbidden

def view_payment_details(request, payment_id):
    # Get the payment object
    payment = get_object_or_404(Payment, id=payment_id)
    # Check if the user is authorized to view this payment
    if payment.rental_request.owner.id != request.session.get('user_id'):
        return HttpResponseForbidden("You are not allowed to view this payment detail.")

    context = {
        'payment': payment,
        'rental_request': payment.rental_request,
    }
    return render(request, 'owners/payment_details.html', context)
'''