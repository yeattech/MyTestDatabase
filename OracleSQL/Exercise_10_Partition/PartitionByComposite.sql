CREATE TABLE transactions_comp (
    txn_id     NUMBER,
    txn_date   DATE,
    amount     NUMBER
)
PARTITION BY RANGE (txn_date)
SUBPARTITION BY HASH (txn_id)
SUBPARTITIONS 2  -- 2 hash subpartitions in each range partition
(
    PARTITION p1 VALUES LESS THAN (DATE '2025-07-01'),
    PARTITION p2 VALUES LESS THAN (DATE '2026-01-01')
);

-- Insert sample data
INSERT INTO transactions_comp VALUES (1, DATE '2025-03-15', 500); -- p1, hash
INSERT INTO transactions_comp VALUES (2, DATE '2025-05-20', 600); -- p1, hash
INSERT INTO transactions_comp VALUES (3, DATE '2025-09-10', 700); -- p2, hash
INSERT INTO transactions_comp VALUES (4, DATE '2025-12-25', 800); -- p2, hash
COMMIT;

-- Check partition name
SELECT table_name, partition_name
FROM user_tab_partitions
WHERE table_name = 'TRANSACTIONS_COMP';