-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`genes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`genes` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `desctiption` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mutations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mutations` (
  `id` INT NOT NULL,
  `chromosome` VARCHAR(45) NULL,
  `start` INT(10) NULL,
  `end` INT(10) NULL,
  `gene_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_mutations_1_idx` (`gene_id` ASC) VISIBLE,
  CONSTRAINT `fk_mutations_1`
    FOREIGN KEY (`gene_id`)
    REFERENCES `mydb`.`genes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`syndromes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`syndromes` (
  `id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`patients` (
  `id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `syndrome_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_patients_1_idx` (`syndrome_id` ASC) VISIBLE,
  CONSTRAINT `fk_patients_1`
    FOREIGN KEY (`syndrome_id`)
    REFERENCES `mydb`.`syndromes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mutations_patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mutations_patients` (
  `id` INT NOT NULL,
  `mutation_id` INT NULL,
  `patient_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_mutations_patients_1_idx` (`mutation_id` ASC) VISIBLE,
  INDEX `fk_mutations_patients_2_idx` (`patient_id` ASC) VISIBLE,
  CONSTRAINT `fk_mutations_patients_1`
    FOREIGN KEY (`mutation_id`)
    REFERENCES `mydb`.`mutations` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mutations_patients_2`
    FOREIGN KEY (`patient_id`)
    REFERENCES `mydb`.`patients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
