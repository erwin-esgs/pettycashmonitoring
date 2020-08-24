-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 19, 2020 at 07:31 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alvien`
--

-- --------------------------------------------------------

--
-- Table structure for table `akun`
--

CREATE TABLE `akun` (
  `kodeakun` varchar(10) NOT NULL,
  `nama` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `akun`
--

INSERT INTO `akun` (`kodeakun`, `nama`) VALUES
('1800002', 'Biaya Transport'),
('1800014', 'Biaya Parkir'),
('1800015', 'Biaya Bensin/Solar'),
('1800018', 'Biaya Jamuan Makan T'),
('1800022', 'Biaya Kirim Barang/D'),
('1800143', 'Biaya Bank');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `idkaryawan` varchar(30) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `telepon` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`idkaryawan`, `nama`, `telepon`) VALUES
('ahua2302@gmail.com', 'Christine', '08977899995'),
('alvien.chandra01@gmail.com', 'Alvien', '08977899993'),
('erlin@sawitindo.com', 'Erlin', '087788339612'),
('handraputra@sawitindo.com', 'Handra', '089673218560'),
('rendyardinata@sawitindo.com', 'Rendy', '081254368135'),
('rinny@gmail.com', 'Rinny', '085628046723');

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `user` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `query` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_length` text COLLATE utf8_bin DEFAULT NULL,
  `col_collation` varchar(64) COLLATE utf8_bin NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) COLLATE utf8_bin DEFAULT '',
  `col_default` text COLLATE utf8_bin DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `column_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 NOT NULL DEFAULT '',
  `transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `settings_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `export_type` varchar(10) COLLATE utf8_bin NOT NULL,
  `template_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `template_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Dumping data for table `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'alvien', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"alvien\",\"phpmyadmin\",\"vien\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(1, 'root', 'server', 'alvien', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"alvien\",\"phpmyadmin\",\"vien\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Structure of table @TABLE@\",\"latex_structure_continued_caption\":\"Structure of table @TABLE@ (continued)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Content of table @TABLE@\",\"latex_data_continued_caption\":\"Content of table @TABLE@ (continued)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"csv_columns\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `item_type` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `tables` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"alvien\",\"table\":\"user\"},{\"db\":\"alvien\",\"table\":\"saldo\"},{\"db\":\"alvien\",\"table\":\"akun\"},{\"db\":\"alvien\",\"table\":\"karyawan\"},{\"db\":\"alvien\",\"table\":\"transaksi\"},{\"db\":\"alvien\",\"table\":\"peminjam\"},{\"db\":\"vien\",\"table\":\"user\"},{\"db\":\"vien\",\"table\":\"transaksi\"},{\"db\":\"vien\",\"table\":\"saldo\"},{\"db\":\"vien\",\"table\":\"peminjam\"}]'),
('cpses_wmnho2ocx6', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmnho2ocx6', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"karyawan\"}]'),
('cpses_wmnho2ocx6', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"saldo\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"karyawan\"}]'),
('cpses_wmnho2ocx6', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"transaksi\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"saldo\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"karyawan\"}]'),
('cpses_wmnho2ocx6', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"user\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"transaksi\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"saldo\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"karyawan\"}]'),
('cpses_wmf4agjpru', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmf4agjpru', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"user\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmf4agjpru', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"user\"}]'),
('cpses_wmf4agjpru', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"user\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmeqk3town', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmeqk3town', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"karyawan\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmeqk3town', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"saldo\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"karyawan\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmeqk3town', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"transaksi\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"saldo\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"karyawan\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmeqk3town', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"user\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"transaksi\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"saldo\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"karyawan\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmlpy7nw7u', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"pma__users\"}]'),
('cpses_wmlpy7nw7u', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"pma__relation\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"pma__users\"}]'),
('root', '[{\"db\":\"alvien\",\"table\":\"user\"},{\"db\":\"alvien\",\"table\":\"saldo\"},{\"db\":\"alvien\",\"table\":\"akun\"},{\"db\":\"alvien\",\"table\":\"karyawan\"},{\"db\":\"alvien\",\"table\":\"transaksi\"},{\"db\":\"alvien\",\"table\":\"peminjam\"},{\"db\":\"vien\",\"table\":\"user\"},{\"db\":\"vien\",\"table\":\"transaksi\"},{\"db\":\"vien\",\"table\":\"saldo\"},{\"db\":\"vien\",\"table\":\"peminjam\"}]'),
('cpses_wmnho2ocx6', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmnho2ocx6', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"karyawan\"}]'),
('cpses_wmnho2ocx6', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"saldo\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"karyawan\"}]'),
('cpses_wmnho2ocx6', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"transaksi\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"saldo\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"karyawan\"}]'),
('cpses_wmnho2ocx6', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"user\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"transaksi\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"saldo\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"karyawan\"}]'),
('cpses_wmf4agjpru', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmf4agjpru', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"user\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmf4agjpru', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"user\"}]'),
('cpses_wmf4agjpru', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"user\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmeqk3town', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmeqk3town', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"karyawan\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmeqk3town', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"saldo\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"karyawan\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmeqk3town', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"transaksi\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"saldo\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"karyawan\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmeqk3town', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"user\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"transaksi\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"saldo\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"karyawan\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"akun\"}]'),
('cpses_wmlpy7nw7u', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"pma__users\"}]'),
('cpses_wmlpy7nw7u', '[{\"db\":\"wmpmyid_alvien\",\"table\":\"pma__relation\"},{\"db\":\"wmpmyid_alvien\",\"table\":\"pma__users\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `master_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_db` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_table` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `foreign_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `search_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `display_field` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `prefs` text COLLATE utf8_bin NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `table_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text COLLATE utf8_bin NOT NULL,
  `schema_sql` text COLLATE utf8_bin DEFAULT NULL,
  `data_sql` longtext COLLATE utf8_bin DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') COLLATE utf8_bin DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2020-08-08 09:44:58', '{\"Console\\/Mode\":\"collapse\"}'),
('cpses_wmnho2ocx6', '2020-08-08 10:12:21', '{\"Console\\/Mode\":\"collapse\"}'),
('cpses_wmlpy7nw7u', '2020-08-19 16:36:46', '{\"Console\\/Mode\":\"collapse\"}'),
('root', '2020-08-08 09:44:58', '{\"Console\\/Mode\":\"collapse\"}'),
('cpses_wmnho2ocx6', '2020-08-08 10:12:21', '{\"Console\\/Mode\":\"collapse\"}'),
('cpses_wmlpy7nw7u', '2020-08-19 16:36:46', '{\"Console\\/Mode\":\"collapse\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL,
  `tab` varchar(64) COLLATE utf8_bin NOT NULL,
  `allowed` enum('Y','N') COLLATE utf8_bin NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) COLLATE utf8_bin NOT NULL,
  `usergroup` varchar(64) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

-- --------------------------------------------------------

--
-- Table structure for table `saldo`
--

CREATE TABLE `saldo` (
  `id` varchar(1) NOT NULL,
  `saldo` int(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `saldo`
--

INSERT INTO `saldo` (`id`, `saldo`) VALUES
('1', 2500000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `idtransaksi` varchar(12) NOT NULL,
  `kodeakun` varchar(20) NOT NULL,
  `karyawan` varchar(30) NOT NULL,
  `jumlah` int(15) NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `kredit` int(1) NOT NULL,
  `statustrans` int(1) NOT NULL,
  `username` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`idtransaksi`, `kodeakun`, `karyawan`, `jumlah`, `keterangan`, `kredit`, `statustrans`, `username`) VALUES
('200811222425', '1800022', 'alvien.chandra01@gmail.com', 1200000, 'Biaya Kirim Dokumen', 1, 0, 'kasir'),
('200811222729', '1800015', 'alvien.chandra01@gmail.com', 600000, 'Bensin Mobil', 1, 0, 'kasir'),
('200811222909', '1800014', 'alvien.chandra01@gmail.com', 350000, 'Parkir Gedung', 1, 0, 'kasir'),
('200811223353', '1101010', '--Pengisian Saldo--', 2150000, '', 0, 0, ''),
('200811230403', '1800014', 'alvien.chandra01@gmail.com', 900000, 'Parkir Kendaraan', 1, 0, 'kasir'),
('200811230441', '1800014', 'alvien.chandra01@gmail.com', 1200000, 'Biaya Bensin Mobil', 1, 0, 'kasir'),
('200811230652', '1101010', '--Pengisian Saldo--', 2100000, '', 0, 0, ''),
('200813203524', '1800015', 'erlin@sawitindo.com', 300000, 'Biaya Bensin Mobil', 1, 0, 'kasir'),
('200813203554', '1800002', 'alvien.chandra01@gmail.com', 450000, 'Biaya Transport Jakarta Bogor', 1, 0, 'kasir'),
('200813203626', '1800022', 'handraputra@sawitindo.com', 600000, 'Biaya Kirim Dokumen', 1, 0, 'kasir'),
('200813203718', '1800014', 'ahua2302@gmail.com', 750000, 'Biaya Parkir Dinas Luar', 1, 0, 'kasir'),
('200813203934', '1800015', 'rendyardinata@sawitindo.com', 200000, 'Bensin Mobil', 1, 0, 'kasir'),
('200813204157', '1101010', '--Pengisian Saldo--', 2300000, '', 0, 0, ''),
('200813215647', '1800014', 'rendyardinata@sawitindo.com', 450000, 'Biaya Parkir Dinas Luar', 1, 0, 'kasir'),
('200813215729', '1800002', 'handraputra@sawitindo.com', 350000, 'Ongkos Ojek ke Jakarta Selatan', 1, 0, 'kasir'),
('200813215758', '1800022', 'erlin@sawitindo.com', 500000, 'Biaya Kirim Barang ke Samarinda', 1, 0, 'kasir'),
('200813215833', '1800015', 'alvien.chandra01@gmail.com', 250000, 'Bensin Mobil Kijang', 1, 0, 'kasir'),
('200813215855', '1800143', 'ahua2302@gmail.com', 150000, 'Biaya RTGS Bank', 1, 0, 'kasir'),
('200813215918', '1800002', 'rendyardinata@sawitindo.com', 400000, 'Biaya Transport Jakarta Bogor', 1, 0, 'kasir'),
('200813220125', '1101010', '--Pengisian Saldo--', 2100000, '', 0, 0, ''),
('200813220449', '1800002', 'rendyardinata@sawitindo.com', 250000, 'Biaya Transport ke Tangerang ', 1, 0, 'kasir'),
('200813220632', '1800014', 'handraputra@sawitindo.com', 450000, 'Biaya Parkir Dinas Luar', 1, 0, 'kasir'),
('200813220658', '1800022', 'erlin@sawitindo.com', 650000, 'Biaya Kirim Dokumen', 1, 0, 'kasir'),
('200813220731', '1800015', 'alvien.chandra01@gmail.com', 350000, 'Biaya Bensin Mobil', 1, 0, 'kasir'),
('200813220805', '1800002', 'ahua2302@gmail.com', 150000, 'Biaya Transport ke Customer', 1, 0, 'kasir'),
('200813220827', '1800015', 'erlin@sawitindo.com', 250000, 'Biaya Bensin Mobil', 1, 0, 'kasir'),
('200813224812', '1101010', '--Pengisian Saldo--', 2100000, '', 0, 0, ''),
('200814091647', '1800002', 'rinny@gmail.com', 650000, 'Biaya Transport Jakarta Bogor', 1, 0, 'kasir'),
('200814091720', '1800022', 'rendyardinata@sawitindo.com', 1000000, 'Biaya Kirim Dokumen ke Samarinda', 1, 0, 'kasir'),
('200814091808', '1800015', 'handraputra@sawitindo.com', 500000, 'Bensin Mobil', 1, 0, 'kasir'),
('200814091855', '1101010', '--Pengisian Saldo--', 2150000, '', 0, 0, ''),
('200814104407', '1800015', 'rinny@gmail.com', 500000, 'Biaya Bensin Mobil', 1, 0, 'kasir'),
('200814104450', '1800002', 'rendyardinata@sawitindo.com', 1500000, 'Biaya Transport Jakarta Bogor', 1, 0, 'kasir'),
('200814104529', '1800143', 'handraputra@sawitindo.com', 200000, 'Biaya RTGS Bank', 1, 0, 'kasir'),
('200814104730', '1101010', '--Pengisian Saldo--', 2200000, '', 0, 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(10) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `password` varchar(40) NOT NULL,
  `saldo` int(15) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `nama`, `password`, `saldo`, `status`) VALUES
('kasir', 'Kasir', '7815696ecbf1c96e6894b779456d330e', 0, 0),
('keuangan', 'Keuangan', '7815696ecbf1c96e6894b779456d330e', 0, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `akun`
--
ALTER TABLE `akun`
  ADD PRIMARY KEY (`kodeakun`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`idkaryawan`);

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `saldo`
--
ALTER TABLE `saldo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`idtransaksi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
