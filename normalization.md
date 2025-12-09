# Database Normalization to 3NF

## Initial Schema Review
Starting with entities from ERD: User, Property, Booking, Review, Payment.

## Step 1: 1NF (Atomic Values)
- All fields are atomic (no multi-value like comma-separated amenities).
- Example: Property. Amenities → Split to separate Amenities table if needed.

## Step 2: 2NF (No Partial Dependencies)
- Primary keys are composite where needed (e.g., Booking. I'd as single PK).
- Removed: No non-key attributes depend on part of composite key (e.g., Booking.user_id doesn't determine total_price alone).

## Step 3: 3NF (No Transitive Dependencies)
- Removed redundancies: e.g., User. Email doesn't depend on User. City (added Address table if needed).
- Final: All non-key attributes depend only on PK. No repeating groups.
- Benefits: Reduces redundancy (e.g., user details not duplicated in bookings), improves integrity.

Schema is now in 3NF – optimized for Airbnb's scalability.