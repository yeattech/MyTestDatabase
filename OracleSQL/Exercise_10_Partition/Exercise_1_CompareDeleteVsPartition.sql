# Step 1. Create Tablespaces (optional, for clarity)
CREATE TABLESPACE ts_sales1 DATAFILE 'ts_sales1.dbf' SIZE 100M AUTOEXTEND ON;
CREATE TABLESPACE ts_sales2 DATAFILE 'ts_sales2.dbf' SIZE 100M AUTOEXTEND ON;

# Step 2. Create a Partitioned Table
-- Partition by quarter on a date column:
CREATE TABLE sales (
    sale_id     NUMBER,
    region      VARCHAR2(20),
    sale_date   DATE,
    amount      NUMBER
)
PARTITION BY RANGE (sale_date) (
    PARTITION sales_q1 VALUES LESS THAN (DATE '2025-04-01') TABLESPACE ts_sales1,
    PARTITION sales_q2 VALUES LESS THAN (DATE '2025-07-01') TABLESPACE ts_sales1,
    PARTITION sales_q3 VALUES LESS THAN (DATE '2025-10-01') TABLESPACE ts_sales2,
    PARTITION sales_q4 VALUES LESS THAN (DATE '2026-01-01') TABLESPACE ts_sales2
);

# Step 3. Insert Sample Data
BEGIN
  FOR i IN 1..1000000 LOOP
    INSERT INTO sales VALUES (
      i,
      CASE MOD(i, 4)
        WHEN 0 THEN 'Asia'
        WHEN 1 THEN 'Europe'
        WHEN 2 THEN 'Americas'
        ELSE 'Other'
      END,
      DATE '2025-01-01' + MOD(i, 365),
      ROUND(DBMS_RANDOM.VALUE(10, 1000), 2)
    );
  END LOOP;
  COMMIT;
END;
/

# Step 4. Case A – Delete by Tag (Row by Row)
SET TIMING ON;
DELETE FROM sales WHERE region = 'Asia';
COMMIT;

-- Will scan the whole table (unless you have an index on region).
-- Generates lots of undo/redo.
-- Slower for big data.

# 🔹 Step 5. Reload Data (for fair comparison)
-- Run the insert block again (Step 3) to restore 1M rows.

# 🔹 Step 6. Case B – Drop Partition
SET TIMING ON;
ALTER TABLE sales DROP PARTITION sales_q1 UPDATE GLOBAL INDEXES;
-- Instant metadata operation.
-- Very little undo/redo.
-- Drops all rows in sales_q1 (covers ~¼ of data).
-- Global indexes preserved with UPDATE GLOBAL INDEXES.

# Step 7. Compare Results
-- Check:
--  Elapsed time (SET TIMING ON in SQL*Plus or SQLcl).
--  Undo/redo usage (query V$UNDOSTAT or V$TRANSACTION).
--  Index status (query USER_INDEXES).

SELECT * FROM SALES;
SELECT COUNT(*) FROM SALES;
SELECT COUNT(*) FROM SALES WHERE region = 'Asia';