-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema zoo1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema zoo1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zoo1` DEFAULT CHARACTER SET utf8 ;
USE `zoo1` ;

-- -----------------------------------------------------
-- Table `zoo1`.`zam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo1`.`zam` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `prijmeni` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zoo1`.`druh`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo1`.`druh` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nazev` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nazev_UNIQUE` (`nazev` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zoo1`.`zvire`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo1`.`zvire` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `jmeno` VARCHAR(45) NULL,
  `vaha` INT NULL,
  `druh_id` INT NOT NULL,
  PRIMARY KEY (`id`, `druh_id`),
  INDEX `fk_zvire_Druh1_idx` (`druh_id` ASC) VISIBLE,
  CONSTRAINT `fk_zvire_Druh1`
    FOREIGN KEY (`druh_id`)
    REFERENCES `zoo1`.`druh` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zoo1`.`krmeni`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zoo1`.`krmeni` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `zam_id` INT NOT NULL,
  `zvire_id` INT NOT NULL,
  `krmeni` INT NULL,
  `datum` DATE NULL,
  PRIMARY KEY (`id`, `zvire_id`, `zam_id`),
  INDEX `fk_zam_has_zvire_zvire1_idx` (`zvire_id` ASC) VISIBLE,
  INDEX `fk_zam_has_zvire_zam_idx` (`zam_id` ASC) VISIBLE,
  CONSTRAINT `fk_zam_has_zvire_zam`
    FOREIGN KEY (`zam_id`)
    REFERENCES `zoo1`.`zam` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_zam_has_zvire_zvire1`
    FOREIGN KEY (`zvire_id`)
    REFERENCES `zoo1`.`zvire` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
