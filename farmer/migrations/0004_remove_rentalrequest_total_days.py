# Generated by Django 4.2.13 on 2024-07-29 13:44

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('farmer', '0003_payment'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='rentalrequest',
            name='total_days',
        ),
    ]
