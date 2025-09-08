-- Create table
CREATE TABLE sales_range (
    sale_id    NUMBER,
    sale_date  DATE,
    amount     NUMBER
)
PARTITION BY RANGE (sale_date) (
    PARTITION q1 VALUES LESS THAN (DATE '2025-04-01'),
    PARTITION q2 VALUES LESS THAN (DATE '2025-07-01'),
    PARTITION q3 VALUES LESS THAN (DATE '2025-10-01'),
    PARTITION q4 VALUES LESS THAN (DATE '2026-01-01')
);

-- Insert sample data
INSERT INTO sales_range VALUES (1, DATE '2025-01-15', 100); -- Goes into q1
INSERT INTO sales_range VALUES (2, DATE '2025-05-20', 200); -- Goes into q2
INSERT INTO sales_range VALUES (3, DATE '2025-08-10', 300); -- Goes into q3
INSERT INTO sales_range VALUES (4, DATE '2025-11-25', 400); -- Goes into q4
COMMIT;

-- Check partitions
SELECT * FROM sales_range PARTITION (q1);
