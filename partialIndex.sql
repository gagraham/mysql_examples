ALTER TABLE sample_ip.ip_address_varchar20 DROP INDEX idx_ip_accress_3chars;
ALTER TABLE sample_ip.ip_address_varchar20 DROP INDEX idx_ip_accress_7chars;
ALTER TABLE sample_ip.ip_address_varchar20 DROP INDEX idx_ip_accress_all_chars;

-- First 3 characters
CREATE INDEX idx_ip_address_3chars ON sample_ip.ip_address_varchar20
(ip_address(3));
-- First 7 characters (xxx.xxx)
CREATE INDEX idx_ip_address_7chars ON sample_ip.ip_address_varchar20
(ip_address(7));
-- All characters (xxx.xxx.xxx.xxx)
CREATE INDEX idx_ip_address_all_chars ON sample_ip.ip_address_varchar20
(ip_address);

