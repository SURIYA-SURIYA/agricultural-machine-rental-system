from django.urls import path
from .views import *
from . import views


urlpatterns = [
    path('', Homepage, name='home'),
    path('about/', aboutpage, name='about'),
    path('contact/', contactpage, name='contact'),
    path('machine_details_view/',machine_details_view,name='machine_details_view'),
    path('machie_detail_delete/delete/<int:id>/',Deletemachines,name='Deleted_machine_details'),
    path('machine_update/update/<int:id>/',Machineupdate,name='machine_update'),
    path('machine-details/', views.machine_details_page, name='machine_details_page'),


]

