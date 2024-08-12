from django.urls import path
from .views import *
from . import views


urlpatterns = [
    path('register1/', views.register1, name='register1'),
    path('login1/', views.login1, name='login1'),
    path('dashboard1/', views.dashboard1, name='dashboard1'),
    path('rental_requests/', owner_rental_requests, name='owner_rental_requests'),
    path('accept_rental_request/<int:request_id>/', views.accept_rental_request, name='accept_rental_request'),
    path('reject_rental_request/<int:request_id>/', views.reject_rental_request, name='reject_rental_request'),
   # path('view_payment/<int:payment_id>/', views.view_payment_details, name='view_payment_details'),



]

