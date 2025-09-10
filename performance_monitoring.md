# Performance Monitoring and Schema Refinement

## Tools Used
- `EXPLAIN ANALYZE` to measure execution plans.
- `SHOW PROFILE` for query profiling.

## Bottlenecks Found
- Full table scans on bookings and reviews.
- Joins without indexes caused slow lookups.

## Changes Made
- Added indexes on bookings(user_id), bookings(property_id), and reviews(property_id).
- Partitioned bookings table by start_date.

## Improvements
- Execution time decreased for joins involving users and bookings.
- Queries filtered by date range now scan fewer rows due to partitioning.
