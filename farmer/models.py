from django.db import models
from django.contrib.auth.models import User
from index.models import Machine_details
from Machine_owner.models import MachineOwner


# Create your models here.
from django.db import models

class Farmer(models.Model):
    username = models.CharField(max_length=150, unique=True)
    password = models.CharField(max_length=128)
    email = models.EmailField(unique=True)
    address = models.TextField()
    mobile_no = models.CharField(max_length=15)
    aadhar_no = models.CharField(max_length=12, unique=True)

    def __str__(self):
        return self.username


class RentalRequest(models.Model):
    STATUS_CHOICES = [
        ('PENDING', 'Pending'),
        ('APPROVED', 'Approved'),
        ('REJECTED', 'Rejected'),
        ('COMPLETED', 'Completed'),
    ]

    farmer = models.ForeignKey(Farmer, on_delete=models.CASCADE, related_name='rental_requests')
    machine = models.ForeignKey(Machine_details, on_delete=models.CASCADE, related_name='rental_requests')
    owner = models.ForeignKey(MachineOwner, on_delete=models.CASCADE, related_name='rental_requests')
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='PENDING')
    rental_days = models.PositiveIntegerField()
    farmer_name = models.CharField(max_length=150)  # Store farmer's name
    farmer_contact = models.CharField(max_length=15)  # Store farmer's contact
    owner_username = models.CharField(max_length=150)  # Store machine owner's username

    def total_amount(self):
        return self.machine.Machine_price * self.rental_days
    
    def __str__(self):
        return f"{self.farmer.username} - {self.machine.Machine_Name} - {self.status}"
from django.db import models
from .models import Farmer, RentalRequest
class Payment(models.Model):
    rental_request = models.ForeignKey(RentalRequest, on_delete=models.CASCADE, related_name='payments')
    farmer = models.ForeignKey(Farmer, on_delete=models.CASCADE)
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    payment_date = models.DateTimeField(auto_now_add=True)
    transaction_id = models.CharField(max_length=100, unique=True)
    cvv_number = models.CharField(max_length=4)
    debit_card_number = models.CharField(max_length=16)
    payment_status = models.CharField(max_length=10, default='Completed')

    def __str__(self):
        return f"{self.farmer.username} - {self.amount}"
