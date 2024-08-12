from django import forms
from .models import MachineOwner
from django.contrib.auth.hashers import make_password, check_password

class MachineOwnerRegistrationForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)

    class Meta:
        model = MachineOwner
        fields = ['username', 'password', 'email', 'address', 'mobile_no', 'aadhar_no']

    def save(self, commit=True):
        user = super().save(commit=False)
        user.password = make_password(self.cleaned_data['password'])
        if commit:
            user.save()
        return user

class MachineOwnerLoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)

    def clean(self):
        cleaned_data = super().clean()
        username = cleaned_data.get('username')
        password = cleaned_data.get('password')

        if not MachineOwner.objects.filter(username=username).exists():
            raise forms.ValidationError('Invalid username or password')

        user = MachineOwner.objects.get(username=username)
        if not check_password(password, user.password):
            raise forms.ValidationError('Invalid username or password')

        return cleaned_data
