# Optimization Report

## Initial Query
- Joins bookings, users, properties, and payments.
- Without indexes, query execution was slower.

## Optimization Steps
- Added indexes:
  - bookings(user_id)
  - bookings(property_id)
  - payments(booking_id)
- Reduced unnecessary columns in SELECT.

## Result
- Using `EXPLAIN ANALYZE`, the query showed reduced execution time after indexes.
- Query now scans fewer rows and uses index lookups.
