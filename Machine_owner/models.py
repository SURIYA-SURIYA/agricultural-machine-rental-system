from django.db import models

class MachineOwner(models.Model):
    username = models.CharField(max_length=150, unique=True)
    password = models.CharField(max_length=128)
    email = models.EmailField(unique=True)
    address = models.TextField()
    mobile_no = models.CharField(max_length=15)
    aadhar_no = models.CharField(max_length=12, unique=True)

    def __str__(self):
        return self.username
