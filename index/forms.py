from django.forms import ModelForm
from .models import *
from django import forms

class Machine_details_form(ModelForm):
    class Meta:
        model=Machine_details
        fields = ['Machine_Name','Machine_type','Description','Machine_price','Image','Machine_owner']  # Include only the fields you want to be editable in the form
        widgets = {
            'Machine_Name': forms.TextInput(attrs={'class':'form-control'}),
            'Machine_type': forms.TextInput(attrs={'class':'form-control'}),
            'Description': forms.TextInput(attrs={'class':'form-control'}),
            'Machine_price': forms.TextInput(attrs={'class':'form-control'}),

}
        

# farmer/forms.py
