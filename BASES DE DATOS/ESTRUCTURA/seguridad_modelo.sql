-- MySQL Script generated by MySQL Workbench
-- 05/03/18 21:24:38
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema nombredelabase
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema nombredelabase
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nombredelabase` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `nombredelabase` ;

-- -----------------------------------------------------
-- Table `nombredelabase`.`usuario_s`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nombredelabase`.`usuario_s` (
  `usuId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `usuLogin` VARCHAR(50) NOT NULL COMMENT '',
  `usuPassword` VARCHAR(100) NOT NULL COMMENT '',
  `usuUsuSesion` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `usuEstado` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '',
  `usuRemember_token` VARCHAR(100) NOT NULL COMMENT '',
  `usu_created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `usu_updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  PRIMARY KEY (`usuId`)  COMMENT '',
  UNIQUE INDEX `uniq_login` (`usuLogin` ASC)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 19
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `nombredelabase`.`persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nombredelabase`.`persona` (
  `perId` INT(11) NOT NULL COMMENT 'Nos muetsra el Id de la tabla persona',
  `perDocumento` VARCHAR(20) NOT NULL COMMENT 'Nos muestra el documento de la persona',
  `perNombre` VARCHAR(100) NOT NULL COMMENT 'Nos muestra el nombre de la persona',
  `perApellido` VARCHAR(255) NOT NULL COMMENT 'Nos muestra el apellido de la persona',
  `perEstado` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '',
  `perUsuSesion` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `per_created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `per_updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `usuario_s_usuId` INT(11) NULL COMMENT '',
  PRIMARY KEY (`perId`, `usuario_s_usuId`)  COMMENT '',
  UNIQUE INDEX `uniq_documento` (`perDocumento` ASC)  COMMENT '',
  INDEX `fk_persona_usuario_s1_idx` (`usuario_s_usuId` ASC)  COMMENT '',
  CONSTRAINT `fk_persona_usuario_s1`
    FOREIGN KEY (`usuario_s_usuId`)
    REFERENCES `nombredelabase`.`usuario_s` (`usuId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Esta tabla nos muestra los datos de la persona ';


-- -----------------------------------------------------
-- Table `nombredelabase`.`rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nombredelabase`.`rol` (
  `rolId` INT(11) NOT NULL AUTO_INCREMENT COMMENT '',
  `rolNombre` VARCHAR(32) NOT NULL COMMENT '',
  `rolDescripcion` VARCHAR(255) NOT NULL COMMENT '',
  `rolEstado` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '',
  `rolUsuSesion` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `rol_created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `rol_updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  PRIMARY KEY (`rolId`)  COMMENT '',
  UNIQUE INDEX `uniq_nombrerol` (`rolNombre` ASC)  COMMENT '')
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `nombredelabase`.`usuario_s_roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nombredelabase`.`usuario_s_roles` (
  `id_usuario_s` INT(11) NOT NULL COMMENT '',
  `id_rol` INT(11) NOT NULL COMMENT '',
  `estado` TINYINT(1) NOT NULL DEFAULT '1' COMMENT '',
  `fechaUserRol` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  `obsFechaUserRol` TEXT NULL DEFAULT NULL COMMENT '',
  `usuRolUsuSesion` VARCHAR(20) NULL DEFAULT NULL COMMENT '',
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '',
  `updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '',
  PRIMARY KEY (`id_usuario_s`, `id_rol`)  COMMENT '',
  INDEX `usuario_s_roles_fk_rolidrol` (`id_rol` ASC)  COMMENT '',
  CONSTRAINT `usuario_s_roles_fk_rolidrol`
    FOREIGN KEY (`id_rol`)
    REFERENCES `nombredelabase`.`rol` (`rolId`),
  CONSTRAINT `usuario_s_roles_fk_usuario_sid`
    FOREIGN KEY (`id_usuario_s`)
    REFERENCES `nombredelabase`.`usuario_s` (`usuId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
