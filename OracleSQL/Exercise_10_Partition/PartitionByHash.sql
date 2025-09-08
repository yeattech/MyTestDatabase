CREATE TABLE orders_hash (
    order_id   NUMBER,
    order_date DATE
)
PARTITION BY HASH (order_id)
PARTITIONS 4;  -- 4 partitions automatically created

-- Insert sample data
INSERT INTO orders_hash VALUES (101, DATE '2025-01-01');
INSERT INTO orders_hash VALUES (102, DATE '2025-01-02');
INSERT INTO orders_hash VALUES (103, DATE '2025-01-03');
INSERT INTO orders_hash VALUES (104, DATE '2025-01-04');
COMMIT;

-- Check partition name
SELECT table_name, partition_name
FROM user_tab_partitions
WHERE table_name = 'ORDERS_HASH';

-- Check which partition each row landed in
SELECT * FROM orders_hash partition (SYS_P579); 
