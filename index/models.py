from django.db import models
from Machine_owner.models import MachineOwner  # Import MachineOwner model




# Create your models here.

class Machine_details(models.Model):
    
    Machine_id = models.BigAutoField (primary_key = True)
    Machine_Name= models.CharField(max_length=200, null=False)
    Machine_type=models.CharField(max_length=200,null=False)
    Description=models.CharField(max_length=200,null=False)
    Machine_price = models.DecimalField(max_digits=10, decimal_places=2)
    Image=models.ImageField(upload_to ='uploads/')
    Machine_owner=models.ForeignKey(MachineOwner , on_delete=models.CASCADE, related_name='machines')
    
    def __str__(self):
        return  self.Machine_Name


