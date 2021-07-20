/*
SQLyog Community v13.1.3  (64 bit)
MySQL - 5.5.55 : Database - sehatmd
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`sehatmd` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `sehatmd`;

/*Table structure for table `appointment` */

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `appointment_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `appointment_date` datetime DEFAULT NULL,
  `appointment_time` datetime DEFAULT NULL,
  `appointment_location` varchar(145) DEFAULT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `appointment` */

/*Table structure for table `disease_list` */

DROP TABLE IF EXISTS `disease_list`;

CREATE TABLE `disease_list` (
  `disease_id` int(11) NOT NULL,
  `disease_name` varchar(145) DEFAULT NULL,
  `disease_origin` varchar(145) DEFAULT NULL,
  `disease_notes` varchar(345) DEFAULT NULL,
  PRIMARY KEY (`disease_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `disease_list` */

/*Table structure for table `disease_symptoms` */

DROP TABLE IF EXISTS `disease_symptoms`;

CREATE TABLE `disease_symptoms` (
  `disease_symptoms_id` int(11) NOT NULL,
  `disease_id` int(11) DEFAULT NULL,
  `disease_symptom_name` varchar(145) DEFAULT NULL,
  `disease_symptom_side_effects` varchar(45) DEFAULT NULL,
  `disease_symptom_notes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`disease_symptoms_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `disease_symptoms` */

/*Table structure for table `doctor` */

DROP TABLE IF EXISTS `doctor`;

CREATE TABLE `doctor` (
  `doctor_id` int(11) NOT NULL,
  `doctor_first_name` varchar(45) DEFAULT NULL,
  `doctor_last_name` varchar(45) DEFAULT NULL,
  `doctor_contact` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`doctor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `doctor` */

insert  into `doctor`(`doctor_id`,`doctor_first_name`,`doctor_last_name`,`doctor_contact`,`user_id`,`id`) values 
(1,'Rehan','Rana','test',1,1);

/*Table structure for table `doctor_credentials` */

DROP TABLE IF EXISTS `doctor_credentials`;

CREATE TABLE `doctor_credentials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` varchar(45) DEFAULT NULL,
  `credential_name` varchar(145) DEFAULT NULL,
  `credential_expiration_date` datetime DEFAULT NULL,
  `credential_issue_authority` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `doctor_credentials` */

insert  into `doctor_credentials`(`id`,`doctor_id`,`credential_name`,`credential_expiration_date`,`credential_issue_authority`) values 
(1,'1','MBBS',NULL,NULL),
(2,'1','FRCS',NULL,NULL);

/*Table structure for table `doctor_hospital` */

DROP TABLE IF EXISTS `doctor_hospital`;

CREATE TABLE `doctor_hospital` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) NOT NULL,
  `hospital_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpeixygqxi65fuav6w0mxcyr1s` (`doctor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `doctor_hospital` */

insert  into `doctor_hospital`(`id`,`doctor_id`,`hospital_name`) values 
(1,1,'Aga Khan'),
(2,1,'LNH');

/*Table structure for table `hibernate_sequence` */

DROP TABLE IF EXISTS `hibernate_sequence`;

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `hibernate_sequence` */

insert  into `hibernate_sequence`(`next_val`) values 
(1);

/*Table structure for table `invoices` */

DROP TABLE IF EXISTS `invoices`;

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `amount` decimal(4,0) DEFAULT NULL,
  `date_paid` datetime DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `payment_method_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `invoices` */

/*Table structure for table `patient` */

DROP TABLE IF EXISTS `patient`;

CREATE TABLE `patient` (
  `patient_id` int(11) NOT NULL,
  `firstname` varchar(90) DEFAULT NULL,
  `lastname` varchar(90) DEFAULT NULL,
  `middlename` varchar(90) DEFAULT NULL,
  `nic` varchar(20) DEFAULT NULL,
  `phonenumber` varchar(45) DEFAULT NULL,
  `address_1` varchar(45) DEFAULT NULL,
  `address_2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `patient` */

/*Table structure for table `patient_diseases` */

DROP TABLE IF EXISTS `patient_diseases`;

CREATE TABLE `patient_diseases` (
  `patient_diseases_id` int(11) NOT NULL,
  `disease_id` int(11) DEFAULT NULL,
  `patient_diseases_notes` varchar(45) DEFAULT NULL,
  `patienthistory_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`patient_diseases_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `patient_diseases` */

/*Table structure for table `patient_history` */

DROP TABLE IF EXISTS `patient_history`;

CREATE TABLE `patient_history` (
  `patienthistory_id` int(11) NOT NULL,
  `patientid` int(11) DEFAULT NULL,
  `patienthistory_notes` varchar(45) DEFAULT NULL,
  `last_visit_date` datetime DEFAULT NULL,
  PRIMARY KEY (`patienthistory_id`),
  UNIQUE KEY `id_UNIQUE` (`patienthistory_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `patient_history` */

/*Table structure for table `patient_sharing` */

DROP TABLE IF EXISTS `patient_sharing`;

CREATE TABLE `patient_sharing` (
  `patient_sharing_id` int(11) NOT NULL,
  `patient_sharing_doctor` varchar(245) DEFAULT NULL,
  `patient_history_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`patient_sharing_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `patient_sharing` */

/*Table structure for table `permission` */

DROP TABLE IF EXISTS `permission`;

CREATE TABLE `permission` (
  `permission_id` int(11) NOT NULL,
  `permission_description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `permission` */

/*Table structure for table `pharmaceutical` */

DROP TABLE IF EXISTS `pharmaceutical`;

CREATE TABLE `pharmaceutical` (
  `pharmaceutical_id` int(11) NOT NULL,
  `notes` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`pharmaceutical_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `pharmaceutical` */

/*Table structure for table `prescription` */

DROP TABLE IF EXISTS `prescription`;

CREATE TABLE `prescription` (
  `prescription_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `prescription_name` varchar(245) DEFAULT NULL,
  `prescription_notes` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`prescription_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `prescription` */

/*Table structure for table `qsecuser` */

DROP TABLE IF EXISTS `qsecuser`;

CREATE TABLE `qsecuser` (
  `id` bigint(20) NOT NULL,
  `created_date` datetime DEFAULT NULL,
  `credentialsexpired` bit(1) NOT NULL,
  `enabled` bit(1) NOT NULL,
  `expired` bit(1) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `locked` bit(1) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_i5kwab0dnabglrkn6siomqau0` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `qsecuser` */

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) DEFAULT NULL,
  `role_type` varchar(255) DEFAULT NULL,
  `rolename` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `roles` */

insert  into `roles`(`id`,`role_name`,`role_type`,`rolename`) values 
(1,'ADMIN','ROLE_ADMIN',NULL),
(2,'PATIENT','ROLE_PATIENT',NULL);

/*Table structure for table `roles_permission` */

DROP TABLE IF EXISTS `roles_permission`;

CREATE TABLE `roles_permission` (
  `roles_permission_id` int(11) NOT NULL,
  `role_id` int(11) DEFAULT NULL,
  `permission_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`roles_permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `roles_permission` */

/*Table structure for table `royalties` */

DROP TABLE IF EXISTS `royalties`;

CREATE TABLE `royalties` (
  `royalties_id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `royalties_amount` decimal(4,0) DEFAULT NULL,
  `royalties_paid_date` datetime DEFAULT NULL,
  `royalties_paid_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`royalties_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

/*Data for the table `royalties` */

/*Table structure for table `specialization` */

DROP TABLE IF EXISTS `specialization`;

CREATE TABLE `specialization` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doctor_id` bigint(20) NOT NULL,
  `specialization_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKpeixygqxi65fuav6w0mxcyr1v` (`doctor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `specialization` */

insert  into `specialization`(`id`,`doctor_id`,`specialization_name`) values 
(1,1,'Child specialist'),
(2,1,'Heart specialist');

/*Table structure for table `text_alert1` */

DROP TABLE IF EXISTS `text_alert1`;

CREATE TABLE `text_alert1` (
  `text_alert_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `text_alert_sent` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`text_alert_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `text_alert1` */

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) DEFAULT NULL,
  `gender` varchar(6) DEFAULT NULL,
  `email` varchar(145) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`fullname`,`gender`,`email`,`username`,`password`,`contact_no`,`date_of_birth`) values 
(1,'Admin',NULL,'admin','admin','$2a$10$V0Xaj5dXCXc8kJ2Al4CVc./QiHAAMaTuE7oFRP2sG35nI0HdUInSe',NULL,NULL),
(2,NULL,NULL,NULL,'rehan@lms.com','test1234',NULL,NULL),
(3,NULL,NULL,NULL,'rehan2@lms.com','admin',NULL,NULL),
(4,NULL,NULL,NULL,'rehan3@lms.com','$2a$10$NOblxdiJ/oL1fgL90vhfzO41ZB0kJnNEIDAclUe/r3BSJ07marsIy',NULL,NULL),
(5,'rehan rana','male',NULL,'rehan5@lms.com','$2a$10$vv.zDj5hqq5HRpaqKVU3Ae6d.cdTG/vPIqETG7R1Sl3JROaz4eX5W',NULL,NULL),
(6,'rehan rana','male',NULL,'rehan5@lms.com','$2a$10$yQWpq88/iazrZUNwq48Agu9Pqf5zDGbN9L574meL07tI2/9NijQR2',NULL,NULL),
(7,'rehan rana','male',NULL,'rehan5@lms.com','$2a$10$1eTkceU/S/Rs4Lic82VPG.8LH/dGwAjcCJ5LNgqsGwq3me.zVT/Hy',NULL,NULL),
(8,'rehan rana','male',NULL,'rehan5@lms.com','$2a$10$7pEnAhcb7EfohTABvr2OTeDuqLLdP.002BAosxyFnfRWDix2eNF2e',NULL,NULL),
(9,'rehan rana','male',NULL,'rehan5@lms.com','$2a$10$O2fmxFowbZjb6IgXBZ5.XOXra1uSaBQJHljFr3LNgziTWSRIk28Dq',NULL,NULL),
(10,'rehan rana','male',NULL,'rehan5@lms.com','$2a$10$U9NJKLiK77RI54/LzW1hh.LkbK4AkwQJxKQMWHgVDuejZHMFoI7eq',NULL,NULL),
(11,'rehan rana','male',NULL,'rehan5@lms.com','$2a$10$2zsin9qfBjJOVPCJNlHnBOwB1JIdOwdVO3l3rpyVLjr7Sd08habgK','221133','2179-08-12 00:00:00'),
(12,'rehan rana','male',NULL,'rehan5@lms.com','$2a$10$6l1eaT1d0yPZBBv6mMlGluQjG34uPHwhBPLB5FokxYHBhbOOHoEDm','221133','2179-08-12 00:00:00');

/*Table structure for table `user_role` */

DROP TABLE IF EXISTS `user_role`;

CREATE TABLE `user_role` (
  `USER_ID` bigint(20) NOT NULL,
  `ROLE_ID` bigint(20) NOT NULL,
  KEY `FK859n2jvi8ivhui0rl0esws6o` (`USER_ID`),
  CONSTRAINT `FK859n2jvi8ivhui0rl0esws6o` FOREIGN KEY (`USER_ID`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `user_role` */

insert  into `user_role`(`USER_ID`,`ROLE_ID`) values 
(12,2);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
