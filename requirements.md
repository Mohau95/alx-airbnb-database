from django.db import models
from django.contrib.auth.models import AbstractUser

# -------------------------------
# USER ENTITY
# -------------------------------
class User(AbstractUser):
    ROLE_CHOICES = (
        ('guest', 'Guest'),
        ('host', 'Host'),
    )
    role = models.CharField(max_length=10, choices=ROLE_CHOICES, default='guest')
    # username, email, password already included in AbstractUser
    # add any extra fields here if needed

    def __str__(self):
        return self.username

# -------------------------------
# PROPERTY ENTITY
# -------------------------------
class Property(models.Model):
    owner = models.ForeignKey(User, on_delete=models.CASCADE, related_name='properties')
    title = models.CharField(max_length=255)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    location = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title

# -------------------------------
# BOOKING ENTITY
# -------------------------------
class Booking(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='bookings')
    property = models.ForeignKey(Property, on_delete=models.CASCADE, related_name='bookings')
    start_date = models.DateField()
    end_date = models.DateField()
    status = models.CharField(max_length=50, default='pending')  # pending, confirmed, cancelled
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} booking {self.property.title}"

# -------------------------------
# REVIEW ENTITY
# -------------------------------
class Review(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='reviews')
    property = models.ForeignKey(Property, on_delete=models.CASCADE, related_name='reviews')
    rating = models.PositiveIntegerField()  # 1-5 stars
    comment = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.user.username} review on {self.property.title}"

# -------------------------------
# PAYMENT ENTITY
# -------------------------------
class Payment(models.Model):
    booking = models.OneToOneField(Booking, on_delete=models.CASCADE, related_name='payment')
    amount = models.DecimalField(max_digits=10, decimal_places=2)
    payment_date = models.DateTimeField(auto_now_add=True)
    payment_method = models.CharField(max_length=50)  # e.g., 'Credit Card', 'PayPal'

    def __str__(self):
        return f"Payment for {self.booking}"
