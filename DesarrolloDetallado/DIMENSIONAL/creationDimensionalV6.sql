-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema grad_dimensional
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `grad_dimensional` ;

-- -----------------------------------------------------
-- Schema grad_dimensional
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `grad_dimensional` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `grad_dimensional` ;

-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_administrativedependency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_dimensional`.`dim_administrativedependency` ;

CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_administrativedependency` (
  `id_administrativedependency` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `faculty_name` VARCHAR(150) NULL DEFAULT NULL,
  `university_name` VARCHAR(150) NULL DEFAULT NULL,
  PRIMARY KEY (`id_administrativedependency`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_date`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_dimensional`.`dim_date` ;

CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_date` (
  `idDate` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL,
  `dayOfYear` INT NOT NULL,
  `dayOfMonth` INT NOT NULL,
  `numberMonth` INT NOT NULL,
  `nameMonth` VARCHAR(15) NOT NULL,
  `year` INT NOT NULL,
  `numberDayOfWeek` INT NOT NULL,
  `nameDayOfWeek` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idDate`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_dimensional`.`dim_company` ;

CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_company` (
  `id_company` INT NOT NULL,
  `name` VARCHAR(100) NULL,
  `areaOfWork` VARCHAR(45) NULL,
  PRIMARY KEY (`id_company`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_graduate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_dimensional`.`dim_graduate` ;

CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_graduate` (
  `idGraduate` INT NOT NULL,
  `docTipe` ENUM('CC', 'Passport', 'CE', 'Other') NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `gender` ENUM('M', 'F', 'Other') NOT NULL,
  `ethnics` VARCHAR(45) NULL DEFAULT NULL,
  `pbm` INT,
  `stratum` VARCHAR(45) NULL DEFAULT NULL,
  `birthday` DATE NULL DEFAULT NULL,
  `address` VARCHAR(200) NULL DEFAULT NULL,
  `personal_EmailAddress` VARCHAR(45) NULL DEFAULT NULL,
  `edu_EmailAddress` VARCHAR(45) NULL DEFAULT NULL,
  `first_Phone` VARCHAR(50) NULL DEFAULT NULL,
  `second_Phone` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`idGraduate`),
  INDEX `idGraduate` (`idGraduate` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_employmentOffer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_dimensional`.`dim_employmentOffer` ;

CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_employmentOffer` (
  `id_employmentOffer` INT NOT NULL,
  `companyName` VARCHAR(100) NULL,
  `availableUntil` DATE NULL,
  `contactEmail` VARCHAR(150) NULL,
  `seekingKnowledgeArea` VARCHAR(45) NULL,
  `seekingAcademic_lvl` ENUM('Undergraduate', 'Graduate', 'Doctorate') NULL,
  PRIMARY KEY (`id_employmentOffer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`fact_job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_dimensional`.`fact_job` ;

CREATE TABLE IF NOT EXISTS `grad_dimensional`.`fact_job` (
  `idJob` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('Entrepeneur', 'Contractort', 'Employeed', 'Unemployeed') NULL DEFAULT NULL,
  `salary` INT NULL DEFAULT NULL,
  `work_area` VARCHAR(45) NULL DEFAULT NULL,
  `position` VARCHAR(100) NULL DEFAULT NULL,
  `location` VARCHAR(45) NULL DEFAULT NULL,
  `idDate_start` INT NOT NULL,
  `idDate_end` INT NULL,
  `idCompany` INT NULL,
  `idGraduate` INT NOT NULL,
  `idEmploymentOffer` INT NULL,
  PRIMARY KEY (`idJob`),
  INDEX `fk_fact_job_dim_date1_idx` (`idDate_start` ASC) VISIBLE,
  INDEX `fk_fact_job_dim_date2_idx` (`idDate_end` ASC) VISIBLE,
  INDEX `fk_fact_job_dim_company1_idx` (`idCompany` ASC) VISIBLE,
  INDEX `fk_fact_job_dim_graduate1_idx` (`idGraduate` ASC) VISIBLE,
  INDEX `fk_fact_job_dim_employmentOffer1_idx` (`idEmploymentOffer` ASC) VISIBLE,
  CONSTRAINT `fk_fact_job_dim_date1`
    FOREIGN KEY (`idDate_start`)
    REFERENCES `grad_dimensional`.`dim_date` (`idDate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_job_dim_date2`
    FOREIGN KEY (`idDate_end`)
    REFERENCES `grad_dimensional`.`dim_date` (`idDate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_job_dim_company1`
    FOREIGN KEY (`idCompany`)
    REFERENCES `grad_dimensional`.`dim_company` (`id_company`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_job_dim_graduate1`
    FOREIGN KEY (`idGraduate`)
    REFERENCES `grad_dimensional`.`dim_graduate` (`idGraduate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_job_dim_employmentOffer1`
    FOREIGN KEY (`idEmploymentOffer`)
    REFERENCES `grad_dimensional`.`dim_employmentOffer` (`id_employmentOffer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_program`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_dimensional`.`dim_program` ;

CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_program` (
  `idProgram` INT NOT NULL AUTO_INCREMENT,
  `academic_lvl` ENUM('Undergraduate', 'Graduate', 'Doctorate') NOT NULL,
  `program_name` VARCHAR(145) NOT NULL,
  `programDuration` VARCHAR(45) NULL DEFAULT NULL,
  `university_name` VARCHAR(150) NULL DEFAULT NULL,
  `faculty_name` VARCHAR(150) NULL DEFAULT NULL,
  `department_name` VARCHAR(150) NULL DEFAULT NULL,
  `campus_name` VARCHAR(45) NULL DEFAULT NULL,
  `country` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idProgram`),
  INDEX `idProgram` (`idProgram` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_dimensional`.`dim_department` ;

CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_department` (
  `id_department` INT NOT NULL,
  `name` VARCHAR(150) NOT NULL,
  `faculty` VARCHAR(145) NOT NULL,
  PRIMARY KEY (`id_department`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`fact_studentsupport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_dimensional`.`fact_studentsupport` ;

CREATE TABLE IF NOT EXISTS `grad_dimensional`.`fact_studentsupport` (
  `idStudentSupport` INT NOT NULL AUTO_INCREMENT,
  `isExternal` TINYINT NOT NULL,
  `isRetributed` TINYINT NOT NULL,
  `type` ENUM('SocioEconómico vivienda', 'SocioEconómico transporte', 'SocioEconómico alimentación', 'Beca promedio', 'Auxiliar docente', 'Movilidad saliente internacional', 'Publicación de artículos académicos', 'Estudiante auxiliar', 'Monitor') NOT NULL,
  `idGraduate` INT NOT NULL,
  `idAdministrativedependency` INT NULL,
  `idDepartment` INT NULL,
  PRIMARY KEY (`idStudentSupport`),
  INDEX `fk_fact_studentsupport_dim_graduate1_idx` (`idGraduate` ASC) VISIBLE,
  INDEX `fk_fact_studentsupport_dim_administrativedependency1_idx` (`idAdministrativedependency` ASC) VISIBLE,
  INDEX `fk_fact_studentsupport_dim_department1_idx` (`idDepartment` ASC) VISIBLE,
  CONSTRAINT `fk_fact_studentsupport_dim_graduate1`
    FOREIGN KEY (`idGraduate`)
    REFERENCES `grad_dimensional`.`dim_graduate` (`idGraduate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_studentsupport_dim_administrativedependency1`
    FOREIGN KEY (`idAdministrativedependency`)
    REFERENCES `grad_dimensional`.`dim_administrativedependency` (`id_administrativedependency`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_studentsupport_dim_department1`
    FOREIGN KEY (`idDepartment`)
    REFERENCES `grad_dimensional`.`dim_department` (`id_department`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_groupAssociation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_dimensional`.`dim_groupAssociation` ;

CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_groupAssociation` (
  `idGroupAssociation` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('Seminary', 'Student Group', 'Research Group', 'Other') NOT NULL,
  `name` VARCHAR(80) NOT NULL,
  `knowledgeArea` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGroupAssociation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`fact_academicWork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_dimensional`.`fact_academicWork` ;

CREATE TABLE IF NOT EXISTS `grad_dimensional`.`fact_academicWork` (
  `idResPubDeg` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('ResearchWork', 'Publication', 'DegreeWork') NOT NULL,
  `title` VARCHAR(200) NOT NULL,
  `knowledge_area` VARCHAR(45) NULL,
  `description` VARCHAR(1000) NOT NULL,
  `professor` VARCHAR(45) NULL DEFAULT NULL,
  `idGroupAssociation` INT NULL,
  `idDate_defense` INT NULL,
  `idDate_publication` INT NULL,
  `idProgram` INT NULL,
  `avgAcademicHistory` DECIMAL(2,1),
  `idDegreeWork` INT NULL,
  `idResearchWork` INT NULL,
  `idPublication` INT NULL,
  PRIMARY KEY (`idResPubDeg`),
  INDEX `fk_fact_res_pub_deg_dim_groupAssociation_idx` (`idGroupAssociation` ASC) VISIBLE,
  INDEX `fk_fact_res_pub_deg_dim_date1_idx` (`idDate_defense` ASC) VISIBLE,
  INDEX `fk_fact_res_pub_deg_dim_date2_idx` (`idDate_publication` ASC) VISIBLE,
  INDEX `fk_academicWork_dim_program1_idx` (`idProgram` ASC) VISIBLE,
  CONSTRAINT `fk_fact_res_pub_deg_dim_groupAssociation`
    FOREIGN KEY (`idGroupAssociation`)
    REFERENCES `grad_dimensional`.`dim_groupAssociation` (`idGroupAssociation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_res_pub_deg_dim_date1`
    FOREIGN KEY (`idDate_defense`)
    REFERENCES `grad_dimensional`.`dim_date` (`idDate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_res_pub_deg_dim_date2`
    FOREIGN KEY (`idDate_publication`)
    REFERENCES `grad_dimensional`.`dim_date` (`idDate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_academicWork_dim_program1`
    FOREIGN KEY (`idProgram`)
    REFERENCES `grad_dimensional`.`dim_program` (`idProgram`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`fact_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_dimensional`.`fact_service` ;

CREATE TABLE IF NOT EXISTS `grad_dimensional`.`fact_service` (
  `idService` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('Curso', 'Charla', 'Préstamo de material bibliográfico', 'Bases de datos', 'Oferta de empleo') NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `knowledge_area` VARCHAR(45) NULL DEFAULT NULL,
  `location` VARCHAR(145) NULL DEFAULT NULL,
  `valueService` INT NULL DEFAULT NULL,
  `idAdministrativedependency` INT NULL,
  `idGroupAssociation` INT NULL,
  `idDepartment` INT NULL,
  `idEmploymentOffer` INT NULL,
  `idStartDate` INT NULL,
  `idEndDate` INT NULL,
  PRIMARY KEY (`idService`),
  INDEX `fk_fact_service_dim_administrativedependency1_idx` (`idAdministrativedependency` ASC) VISIBLE,
  INDEX `fk_fact_service_dim_groupAssociation1_idx` (`idGroupAssociation` ASC) VISIBLE,
  INDEX `fk_fact_service_dim_department1_idx` (`idDepartment` ASC) VISIBLE,
  INDEX `fk_fact_service_dim_employmentOffer1_idx` (`idEmploymentOffer` ASC) VISIBLE,
  INDEX `fk_fact_service_dim_date1_idx` (`idStartDate` ASC) VISIBLE,
  INDEX `fk_fact_service_dim_date2_idx` (`idEndDate` ASC) VISIBLE,
  CONSTRAINT `fk_fact_service_dim_administrativedependency1`
    FOREIGN KEY (`idAdministrativedependency`)
    REFERENCES `grad_dimensional`.`dim_administrativedependency` (`id_administrativedependency`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_service_dim_groupAssociation1`
    FOREIGN KEY (`idGroupAssociation`)
    REFERENCES `grad_dimensional`.`dim_groupAssociation` (`idGroupAssociation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_service_dim_department1`
    FOREIGN KEY (`idDepartment`)
    REFERENCES `grad_dimensional`.`dim_department` (`id_department`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_service_dim_employmentOffer1`
    FOREIGN KEY (`idEmploymentOffer`)
    REFERENCES `grad_dimensional`.`dim_employmentOffer` (`id_employmentOffer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_service_dim_date1`
    FOREIGN KEY (`idStartDate`)
    REFERENCES `grad_dimensional`.`dim_date` (`idDate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_service_dim_date2`
    FOREIGN KEY (`idEndDate`)
    REFERENCES `grad_dimensional`.`dim_date` (`idDate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_graduate_has_academicWork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_dimensional`.`dim_graduate_has_academicWork` ;

CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_graduate_has_academicWork` (
  `dim_graduate_idGraduate` INT NOT NULL,
  `academicWork_idResPubDeg` INT NOT NULL,
  PRIMARY KEY (`dim_graduate_idGraduate`, `academicWork_idResPubDeg`),
  INDEX `fk_dim_graduate_has_academicWork_academicWork1_idx` (`academicWork_idResPubDeg` ASC) VISIBLE,
  INDEX `fk_dim_graduate_has_academicWork_dim_graduate1_idx` (`dim_graduate_idGraduate` ASC) VISIBLE,
  CONSTRAINT `fk_dim_graduate_has_academicWork_dim_graduate1`
    FOREIGN KEY (`dim_graduate_idGraduate`)
    REFERENCES `grad_dimensional`.`dim_graduate` (`idGraduate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dim_graduate_has_academicWork_academicWork1`
    FOREIGN KEY (`academicWork_idResPubDeg`)
    REFERENCES `grad_dimensional`.`fact_academicWork` (`idResPubDeg`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_graduate_has_fact_service`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_dimensional`.`dim_graduate_has_fact_service` ;

CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_graduate_has_fact_service` (
  `dim_graduate_idGraduate` INT NOT NULL,
  `fact_service_idService` INT NOT NULL,
  PRIMARY KEY (`dim_graduate_idGraduate`, `fact_service_idService`),
  INDEX `fk_dim_graduate_has_fact_service_fact_service1_idx` (`fact_service_idService` ASC) VISIBLE,
  INDEX `fk_dim_graduate_has_fact_service_dim_graduate1_idx` (`dim_graduate_idGraduate` ASC) VISIBLE,
  CONSTRAINT `fk_dim_graduate_has_fact_service_dim_graduate1`
    FOREIGN KEY (`dim_graduate_idGraduate`)
    REFERENCES `grad_dimensional`.`dim_graduate` (`idGraduate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dim_graduate_has_fact_service_fact_service1`
    FOREIGN KEY (`fact_service_idService`)
    REFERENCES `grad_dimensional`.`fact_service` (`idService`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
