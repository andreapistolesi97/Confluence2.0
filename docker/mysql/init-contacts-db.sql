-- =====================================================
-- Crea il database secondario per i contatti.
-- Eseguito automaticamente al primo avvio di MySQL
-- grazie a /docker-entrypoint-initdb.d/.
-- =====================================================

CREATE DATABASE IF NOT EXISTS `confluence_contacts`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

GRANT ALL PRIVILEGES ON `confluence_contacts`.* TO 'confluence'@'%';
FLUSH PRIVILEGES;
