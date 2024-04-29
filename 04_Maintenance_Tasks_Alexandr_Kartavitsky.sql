CREATE OR REPLACE FUNCTION maintenance_task() RETURNS VOID AS $$
DECLARE
    last_month DATE;
BEGIN
    last_month := CURRENT_DATE - INTERVAL '1 month';
    
    EXECUTE FORMAT('DROP TABLE IF EXISTS sales_data_%s', TO_CHAR(last_month, 'YYYY_MM'));
    EXECUTE FORMAT('CREATE TABLE IF NOT EXISTS sales_data_%s PARTITION OF sales_data FOR VALUES FROM (%L) TO (%L)',
                   TO_CHAR(CURRENT_DATE + INTERVAL '1 month', 'YYYY_MM'),
                   CURRENT_DATE + INTERVAL '1 month',
                   CURRENT_DATE + INTERVAL '2 months');
END;
$$ LANGUAGE plpgsql;