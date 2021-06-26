CREATE TABLE `specialization` (
  `id` int NOT NULL,
  `doctor_id` int DEFAULT NULL,
  `specialization_name` varchar(245) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;