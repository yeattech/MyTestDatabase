CREATE TABLE customers_list (
    cust_id   NUMBER,
    region    VARCHAR2(20)
)
PARTITION BY LIST (region) (
    PARTITION asia VALUES ('Malaysia','Singapore','Thailand'),
    PARTITION europe VALUES ('Germany','France'),
    PARTITION americas VALUES ('USA','Canada'),
    PARTITION other VALUES (DEFAULT)
);

-- Insert sample data
INSERT INTO customers_list VALUES (1, 'Malaysia');  -- asia
INSERT INTO customers_list VALUES (2, 'USA');       -- americas
INSERT INTO customers_list VALUES (3, 'France');    -- europe
INSERT INTO customers_list VALUES (4, 'Brazil');    -- other
COMMIT;

-- Check partitions
SELECT * FROM customers_list PARTITION (asia);
