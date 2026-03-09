-- =====================================================
-- Crea tutti i database aggiuntivi al primo avvio.
-- Eseguito automaticamente da /docker-entrypoint-initdb.d/
-- =====================================================

-- Database contatti
CREATE DATABASE IF NOT EXISTS `confluence_contacts` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `confluence_contacts`.* TO 'confluence'@'%';

-- Dfusione - Production
CREATE DATABASE IF NOT EXISTS `db1ywgcfln6ko1` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `db1ywgcfln6ko1`.* TO 'confluence'@'%';

-- Media Prospect - Production
CREATE DATABASE IF NOT EXISTS `db8mwsqzhezgcg` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `db8mwsqzhezgcg`.* TO 'confluence'@'%';

-- Interactive Global Data - Production
CREATE DATABASE IF NOT EXISTS `dbbsplwbo27riv` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `dbbsplwbo27riv`.* TO 'confluence'@'%';

-- Lean ADV - Production
CREATE DATABASE IF NOT EXISTS `dbbvt3npg0g3ey` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `dbbvt3npg0g3ey`.* TO 'confluence'@'%';

-- Lithium Main
CREATE DATABASE IF NOT EXISTS `dbemqtn9jyekyk` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `dbemqtn9jyekyk`.* TO 'confluence'@'%';

-- Levante Media - Production
CREATE DATABASE IF NOT EXISTS `dbg3kzec8qennw` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `dbg3kzec8qennw`.* TO 'confluence'@'%';

-- Netpulse Media - Production
CREATE DATABASE IF NOT EXISTS `dbhi9cvdwadwsr` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `dbhi9cvdwadwsr`.* TO 'confluence'@'%';

-- Digity Solutions - Production
CREATE DATABASE IF NOT EXISTS `dbqmhgqdjxxyad` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `dbqmhgqdjxxyad`.* TO 'confluence'@'%';

-- Logs - Revelop SRL
CREATE DATABASE IF NOT EXISTS `dbtp2gmxsji1pl` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `dbtp2gmxsji1pl`.* TO 'confluence'@'%';

-- Lithium Ads - Production
CREATE DATABASE IF NOT EXISTS `dby2mm99vtfozo` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
GRANT ALL PRIVILEGES ON `dby2mm99vtfozo`.* TO 'confluence'@'%';

FLUSH PRIVILEGES;
