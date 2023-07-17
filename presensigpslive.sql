/*
 Navicat Premium Data Transfer

 Source Server         : Localhost
 Source Server Type    : MySQL
 Source Server Version : 50739
 Source Host           : localhost:3306
 Source Schema         : presensigps

 Target Server Type    : MySQL
 Target Server Version : 50739
 File Encoding         : 65001

 Date: 03/07/2023 19:50:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cabang
-- ----------------------------
DROP TABLE IF EXISTS `cabang`;
CREATE TABLE `cabang`  (
  `kode_cabang` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_cabang` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi_cabang` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `radius_cabang` smallint(6) NOT NULL,
  PRIMARY KEY (`kode_cabang`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cabang
-- ----------------------------
INSERT INTO `cabang` VALUES ('BDG', 'BANDUNG', '-7.3017453427514525,108.2401495272123', 20);
INSERT INTO `cabang` VALUES ('TSM', 'Tasikmalaya', '-7.289672611537798,108.232765111253', 30);

-- ----------------------------
-- Table structure for departemen
-- ----------------------------
DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen`  (
  `kode_dept` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_dept` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`kode_dept`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of departemen
-- ----------------------------
INSERT INTO `departemen` VALUES ('HRD', 'Human Resource Development ');
INSERT INTO `departemen` VALUES ('IT', 'Information Technology');
INSERT INTO `departemen` VALUES ('KEU', 'Keuangan');
INSERT INTO `departemen` VALUES ('MKT', 'Marketing');

-- ----------------------------
-- Table structure for jam_kerja
-- ----------------------------
DROP TABLE IF EXISTS `jam_kerja`;
CREATE TABLE `jam_kerja`  (
  `kode_jam_kerja` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_jam_kerja` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `awal_jam_masuk` time NOT NULL,
  `jam_masuk` time NOT NULL,
  `akhir_jam_masuk` time NOT NULL,
  `jam_pulang` time NOT NULL,
  PRIMARY KEY (`kode_jam_kerja`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jam_kerja
-- ----------------------------
INSERT INTO `jam_kerja` VALUES ('JK01', 'NON SHIFT', '05:00:00', '08:00:00', '09:00:00', '16:00:00');
INSERT INTO `jam_kerja` VALUES ('JK02', 'NON SHIFT SABTU', '05:00:00', '07:00:00', '23:59:00', '12:00:00');
INSERT INTO `jam_kerja` VALUES ('SH01', 'SHIFT 1', '06:00:00', '07:00:00', '08:00:00', '12:00:00');

-- ----------------------------
-- Table structure for karyawan
-- ----------------------------
DROP TABLE IF EXISTS `karyawan`;
CREATE TABLE `karyawan`  (
  `nik` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nama_lengkap` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `jabatan` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `no_hp` varchar(13) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `foto` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_dept` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `kode_cabang` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `remember_token` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`nik`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of karyawan
-- ----------------------------
INSERT INTO `karyawan` VALUES ('12345', 'Adam Abdi Al Ala S.Kom', 'Head of IT', '089670444322', '12345.jpg', 'IT', 'TSM', '$2y$10$u.Cpy.8nxTlHUJFMB2lHTeSyQpOw2Zx7MRu2fuT/nndxMigccZWFW', NULL);
INSERT INTO `karyawan` VALUES ('12346', 'Fitriani Nur', 'Manager HRD', '0', NULL, 'HRD', 'TSM', '$2y$10$u.Cpy.8nxTlHUJFMB2lHTeSyQpOw2Zx7MRu2fuT/nndxMigccZWFW', NULL);
INSERT INTO `karyawan` VALUES ('12347', 'Qiana', 'Accounting', '0', NULL, 'KEU', 'BDG', '$2y$10$u.Cpy.8nxTlHUJFMB2lHTeSyQpOw2Zx7MRu2fuT/nndxMigccZWFW', NULL);
INSERT INTO `karyawan` VALUES ('12349', 'Daffa', 'Staff IT', '0899999', '12349.jpg', 'IT', 'BDG', '$2y$10$u.Cpy.8nxTlHUJFMB2lHTeSyQpOw2Zx7MRu2fuT/nndxMigccZWFW', NULL);
INSERT INTO `karyawan` VALUES ('8888', 'Hilman Firdaus', 'IT Staff', '098787657567', '8888.jpg', 'IT', 'TSM', '$2y$10$u.Cpy.8nxTlHUJFMB2lHTeSyQpOw2Zx7MRu2fuT/nndxMigccZWFW', NULL);
INSERT INTO `karyawan` VALUES ('9999', 'Dadang', 'Staff IT', '0898888', NULL, 'IT', 'BDG', '$2y$10$u.Cpy.8nxTlHUJFMB2lHTeSyQpOw2Zx7MRu2fuT/nndxMigccZWFW', NULL);

-- ----------------------------
-- Table structure for konfigurasi_jamkerja
-- ----------------------------
DROP TABLE IF EXISTS `konfigurasi_jamkerja`;
CREATE TABLE `konfigurasi_jamkerja`  (
  `nik` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hari` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `kode_jam_kerja` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of konfigurasi_jamkerja
-- ----------------------------
INSERT INTO `konfigurasi_jamkerja` VALUES ('9999', 'Senin', 'JK01');
INSERT INTO `konfigurasi_jamkerja` VALUES ('9999', 'Selasa', 'JK01');
INSERT INTO `konfigurasi_jamkerja` VALUES ('9999', 'Rabu', 'JK01');
INSERT INTO `konfigurasi_jamkerja` VALUES ('9999', 'Kamis', 'JK01');
INSERT INTO `konfigurasi_jamkerja` VALUES ('9999', 'Jumat', 'JK01');
INSERT INTO `konfigurasi_jamkerja` VALUES ('9999', 'Sabtu', 'JK02');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12345', 'Senin', 'JK01');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12345', 'Selasa', 'JK01');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12345', 'Rabu', 'JK01');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12345', 'Kamis', 'JK01');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12345', 'Jumat', 'JK01');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12345', 'Sabtu', 'JK02');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12346', 'Senin', 'JK01');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12346', 'Selasa', 'JK01');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12346', 'Rabu', 'JK02');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12346', 'Kamis', 'JK01');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12346', 'Jumat', 'JK01');
INSERT INTO `konfigurasi_jamkerja` VALUES ('12346', 'Sabtu', 'JK02');

-- ----------------------------
-- Table structure for konfigurasi_lokasi
-- ----------------------------
DROP TABLE IF EXISTS `konfigurasi_lokasi`;
CREATE TABLE `konfigurasi_lokasi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `lokasi_kantor` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `radius` smallint(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of konfigurasi_lokasi
-- ----------------------------
INSERT INTO `konfigurasi_lokasi` VALUES (1, '-7.287594341097271,108.23708536116848', 40);

-- ----------------------------
-- Table structure for pengajuan_izin
-- ----------------------------
DROP TABLE IF EXISTS `pengajuan_izin`;
CREATE TABLE `pengajuan_izin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tgl_izin` date NULL DEFAULT NULL,
  `status` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT 'i : izin s : sakit',
  `keterangan` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status_approved` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0' COMMENT '0 : Pending 1: Disetuji 2: Ditolak',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pengajuan_izin
-- ----------------------------
INSERT INTO `pengajuan_izin` VALUES (2, '12345', '2023-02-23', 'i', 'Jenguk Saudara yang Sakit', '2');
INSERT INTO `pengajuan_izin` VALUES (3, '12345', '2023-02-23', 's', 'Mag', '0');
INSERT INTO `pengajuan_izin` VALUES (4, '12345', '2023-02-23', 'i', 'Mau Ke Rumah Saudara', '0');
INSERT INTO `pengajuan_izin` VALUES (5, '12346', '2023-03-14', 'i', 'Harus Datang Ke Acara Pernikahan Saudara', '2');
INSERT INTO `pengajuan_izin` VALUES (6, '8888', '2023-03-21', 'i', 'Ada Acara Keluarga', '1');

-- ----------------------------
-- Table structure for presensi
-- ----------------------------
DROP TABLE IF EXISTS `presensi`;
CREATE TABLE `presensi`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nik` char(5) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tgl_presensi` date NOT NULL,
  `jam_in` time NOT NULL,
  `jam_out` time NULL DEFAULT NULL,
  `foto_in` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `foto_out` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `lokasi_in` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `lokasi_out` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `kode_jam_kerja` char(4) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status_presensi_in` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status_presensi_out` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 39 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of presensi
-- ----------------------------
INSERT INTO `presensi` VALUES (34, '12345', '2023-06-21', '07:24:08', NULL, '12345-2023-06-21-in.png', NULL, '-7.2912792500000005,108.231705', NULL, 'JK01', NULL, NULL);
INSERT INTO `presensi` VALUES (35, '12346', '2023-06-21', '07:24:59', NULL, '12346-2023-06-21-in.png', NULL, '-7.2912792500000005,108.231705', NULL, 'JK02', NULL, NULL);
INSERT INTO `presensi` VALUES (36, '12346', '2023-06-24', '23:18:23', '23:18:40', '12346-2023-06-24-in.png', '12346-2023-06-24-out.png', '-7.2912792500000005,108.231705', '-7.2912792500000005,108.231705', 'JK02', NULL, NULL);
INSERT INTO `presensi` VALUES (38, '12346', '2023-07-01', '22:21:17', NULL, '12346-2023-07-01-in.png', NULL, '-7.291343656579396,108.23141258245495', NULL, 'JK02', '1', NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Adam Adifa', 'adam@gmail.com', NULL, '$2y$10$u.Cpy.8nxTlHUJFMB2lHTeSyQpOw2Zx7MRu2fuT/nndxMigccZWFW', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
