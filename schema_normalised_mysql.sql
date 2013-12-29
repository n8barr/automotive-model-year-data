DROP TABLE IF EXISTS `year`;
DROP TABLE IF EXISTS `model`;
DROP TABLE IF EXISTS `manufacturer`;

CREATE TABLE `manufacturer` (
        `_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
        `make` VARCHAR(50) NULL,
        PRIMARY KEY (`_id`),
        UNIQUE `U_manufacturer_make` (`make`),
        INDEX `I_manufacturer_make` (`make`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `model` (
        `_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
        `make_id` INT UNSIGNED NOT NULL,
	`model` VARCHAR(50) NOT NULL,
        PRIMARY KEY (`_id`),
        UNIQUE `U_model_make_id_model` (`make_id`,`model`),
	FOREIGN KEY (`make_id`) REFERENCES manufacturer(`_id`), 
        INDEX `I_model_make_id` (`make_id`),
	INDEX `I_model_make_id_model` (`make_id`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `year` (
        `_id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
        `year` SMALLINT UNSIGNED NOT NULL,
        `model_id` INT UNSIGNED NOT NULL,
        PRIMARY KEY (`_id`),
        UNIQUE `U_year_model_id` (`year`,`model_id`),
        FOREIGN KEY (`model_id`) REFERENCES model(`_id`),
        INDEX `I_year` (`year`),
        INDEX `I_year_model_id` (`year`,`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
