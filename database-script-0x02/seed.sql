-- Seed Sample Data for Airbnb Clone

-- Insert Users
INSERT INTO Users (username, email, password_hash, phone, is_host) VALUES
('john_guest', 'john@email.com', 'hashedpass1', '123-456-7890', FALSE),
('jane_host', 'jane@email.com', 'hashedpass2', '098-765-4321', TRUE);

-- Insert Properties
INSERT INTO Properties (owner_id, title, description, location, price_per_night, max_guests) VALUES
(2, 'Cozy Apartment in NYC', 'Modern 1-bed with view', 'New York, NY', 150.00, 2);

-- Insert Bookings
INSERT INTO Bookings (user_id, property_id, check_in, check_out, total_price) VALUES
(1, 1, '2025-01-10', '2025-01-15', 750.00);

-- Insert Reviews
INSERT INTO Reviews (user_id, property_id, rating, comment) VALUES
(1, 1, 5, 'Amazing stay! Clean and comfortable.');

-- Insert Payments
INSERT INTO Payments (booking_id, amount, status, transaction_id) VALUES
(1, 750.00, 'completed', 'txn_12345');