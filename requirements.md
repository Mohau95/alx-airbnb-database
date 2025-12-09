# Airbnb Clone ERD Requirements

## Entities

### User
- id (Primary Key)
- username
- email
- password
- role (guest/host)
- created_at

### Property
- id (Primary Key)
- owner_id (Foreign Key → User)
- title
- description
- price
- location
- created_at

### Booking
- id (Primary Key)
- user_id (Foreign Key → User)
- property_id (Foreign Key → Property)
- start_date
- end_date
- status
- created_at

### Review
- id (Primary Key)
- user_id (Foreign Key → User)
- property_id (Foreign Key → Property)
- rating
- comment
- created_at

### Payment
- id (Primary Key)
- booking_id (Foreign Key → Booking)
- amount
- payment_date
- payment_method

## Relationships

- User → Property (1:N)  
- User → Booking (1:N)  
- Property → Booking (1:N)  
- Property → Review (1:N)  
- Booking → Payment (1:1)  
- User → Review (1:N)
