# Partitioning Performance Report

## Before
- Queries on bookings with date filters scanned the entire bookings table.

## After
- Partitioned by start_date into yearly ranges.
- Queries on specific date ranges only scan the relevant partition.
- `EXPLAIN ANALYZE` showed significantly reduced execution times.

## Conclusion
Partitioning improved performance for large booking datasets.
