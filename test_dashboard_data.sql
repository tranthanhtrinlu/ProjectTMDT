-- Update some custom orders to READY/SHIPPED status for testing dashboard
UPDATE custom_orders SET status = 'READY' WHERE id IN (14, 15, 16, 17);

-- Check the updated data
SELECT 
    'Custom Orders' as table_name,
    status,
    COUNT(*) as count,
    SUM(total_price) as total_revenue
FROM custom_orders 
WHERE status IN ('READY', 'SHIPPED')
GROUP BY status;

-- Check orders data for comparison
SELECT 
    'Regular Orders' as table_name,
    payment_status,
    COUNT(*) as count,
    SUM(total_price) as total_revenue
FROM orders 
WHERE payment_status = 'PAYMENT_SUCCEED'
GROUP BY payment_status;

-- Test the revenue query directly
SELECT 
    DATE(created_at) as date,
    SUM(total_price) as revenue
FROM custom_orders 
WHERE status IN ('READY', 'SHIPPED')
  AND DATE(created_at) = CURDATE()
GROUP BY DATE(created_at);

SELECT 
    DATE(created_at) as date,
    SUM(total_price) as revenue
FROM orders 
WHERE payment_status = 'PAYMENT_SUCCEED'
  AND DATE(created_at) = CURDATE()
GROUP BY DATE(created_at); 