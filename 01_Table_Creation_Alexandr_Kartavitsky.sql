CREATE TABLE sales_data (
    sale_id SERIAL,
    product_id INTEGER,
    region_id INTEGER,
    salesperson_id INTEGER,
    sale_amount NUMERIC,
    sale_date DATE,
	PRIMARY KEY (sale_id, sale_date)
) PARTITION BY RANGE (sale_date);

CREATE TABLE sales_data_2023_05 PARTITION OF sales_data FOR VALUES FROM ('2023-05-01') TO ('2023-06-01');
CREATE TABLE sales_data_2023_04 PARTITION OF sales_data FOR VALUES FROM ('2023-04-01') TO ('2023-05-01');
CREATE TABLE sales_data_2023_03 PARTITION OF sales_data FOR VALUES FROM ('2023-03-01') TO ('2023-04-01');
CREATE TABLE sales_data_2023_02 PARTITION OF sales_data FOR VALUES FROM ('2023-02-01') TO ('2023-03-01');
CREATE TABLE sales_data_2023_01 PARTITION OF sales_data FOR VALUES FROM ('2023-01-01') TO ('2023-02-01');
CREATE TABLE sales_data_2022_12 PARTITION OF sales_data FOR VALUES FROM ('2022-12-01') TO ('2023-01-01');
CREATE TABLE sales_data_2022_11 PARTITION OF sales_data FOR VALUES FROM ('2022-11-01') TO ('2022-12-01');
CREATE TABLE sales_data_2022_10 PARTITION OF sales_data FOR VALUES FROM ('2022-10-01') TO ('2022-11-01');
CREATE TABLE sales_data_2022_09 PARTITION OF sales_data FOR VALUES FROM ('2022-09-01') TO ('2022-10-01');
CREATE TABLE sales_data_2022_08 PARTITION OF sales_data FOR VALUES FROM ('2022-08-01') TO ('2022-09-01');
CREATE TABLE sales_data_2022_07 PARTITION OF sales_data FOR VALUES FROM ('2022-07-01') TO ('2022-08-01');
CREATE TABLE sales_data_2022_06 PARTITION OF sales_data FOR VALUES FROM ('2022-06-01') TO ('2022-07-01');