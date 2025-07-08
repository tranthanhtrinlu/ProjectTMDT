-- Initialize role data for KeyBoard Shop
-- This script should be run once to create initial roles

-- Insert roles if they don't exist
INSERT IGNORE INTO roles (name, description) VALUES 
('USER', 'Regular user role - can browse and purchase products'),
('ADMIN', 'Administrator role - full system access');

-- Verify the roles were created
SELECT * FROM roles; 