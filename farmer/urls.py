from django.urls import path
from .views import *
from . import views


urlpatterns = [
    path('register/', views.register, name='register'),
    path('login/', views.login, name='login'),
    path('dashboard/', views.dashboard, name='dashboard'),
    path('rental-request/', views.rental_request, name='rental_request'),
    path('rental-request/<int:machine_id>/<int:farmer_id>/', views.rental_request, name='rental_request'),
    path('success/', views.success, name='success'),  # Ensure this is included
    path('farmer_rental_requests/', views.farmer_rental_requests, name='farmer_rental_requests'),
    path('rental_request_details/<int:request_id>/', views.rental_request_details, name='rental_request_details'),
    path('payment/<int:request_id>/', views.payment, name='payment'),
    path('payment/success/', payment_success, name='payment_success'),




]
