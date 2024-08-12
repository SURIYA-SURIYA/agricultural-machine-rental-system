from django import forms
from .models import Farmer

from django.contrib.auth.hashers import make_password, check_password

class FarmerRegistrationForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = Farmer
        fields = ['username', 'password', 'email', 'address', 'mobile_no', 'aadhar_no']

    def save(self, commit=True):
        user = super().save(commit=False)
        user.password = make_password(self.cleaned_data['password'])
        if commit:
            user.save()
        return user

class FarmerLoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)

    def clean(self):
        cleaned_data = super().clean()
        username = cleaned_data.get('username')
        password = cleaned_data.get('password')

        if not Farmer.objects.filter(username=username).exists():
            raise forms.ValidationError('Invalid username or password')

        user = Farmer.objects.get(username=username)
        if not check_password(password, user.password):
            raise forms.ValidationError('Invalid username or password')

        return cleaned_data


from django import forms
from .models import RentalRequest

from django import forms
from .models import RentalRequest
from django import forms
from .models import RentalRequest

class RentalRequestForm(forms.ModelForm):
    class Meta:
        model = RentalRequest
        fields = ['rental_days']  # Include only the fields you want to be editable in the form

from django import forms
from .models import Payment

class PaymentForm(forms.ModelForm):
    class Meta:
        model = Payment
        fields = ['amount', 'cvv_number', 'debit_card_number']
