-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema grad_dimensional
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema grad_dimensional
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `grad_dimensional` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `grad_dimensional` ;

-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_administrativedependency`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_administrativedependency` (
  `id_administrativedependency` INT NOT NULL,
  `name` VARCHAR(100) NOT NULL,
  `faculty_name` VARCHAR(150) NULL DEFAULT NULL,
  `university_name` VARCHAR(150) NOT NULL,
  `campus_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_administrativedependency`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_company` (
  `id_company` INT NOT NULL,
  `name` VARCHAR(100) NULL DEFAULT NULL,
  `areaOfWork` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id_company`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_date`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_date` (
  `idDate` INT NOT NULL AUTO_INCREMENT,
  `date` DATE NULL DEFAULT NULL,
  `dayOfYear` INT NOT NULL,
  `dayOfMonth` INT NOT NULL,
  `numberMonth` INT NOT NULL,
  `nameMonth` VARCHAR(15) NOT NULL,
  `year` INT NOT NULL,
  `numberDayOfWeek` INT NOT NULL,
  `nameDayOfWeek` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idDate`))
ENGINE = InnoDB
AUTO_INCREMENT = 4096
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_department` (
  `id_department` INT NOT NULL,
  `department_name` VARCHAR(150) NOT NULL,
  `faculty_name` VARCHAR(150) NOT NULL,
  `campus_name` VARCHAR(45) NULL,
  `university_name` VARCHAR(150) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_department`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_employmentoffer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_employmentoffer` (
  `id_employmentOffer` INT NOT NULL,
  `companyName` VARCHAR(100) NULL DEFAULT NULL,
  `availableUntil` DATE NULL DEFAULT NULL,
  `contactEmail` VARCHAR(150) NULL DEFAULT NULL,
  `seekingKnowledgeArea` VARCHAR(45) NULL DEFAULT NULL,
  `seekingAcademic_lvl` ENUM('Undergraduate', 'Graduate', 'Doctorate') NULL DEFAULT NULL,
  PRIMARY KEY (`id_employmentOffer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_graduate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_graduate` (
  `idGraduate` INT NOT NULL,
  `docTipe` ENUM('CC', 'Passport', 'CE', 'Other') NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `gender` ENUM('M', 'F', 'Other') NOT NULL,
  `ethnics` VARCHAR(45) NULL DEFAULT NULL,
  `pbm` INT NULL DEFAULT NULL,
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
-- Table `grad_dimensional`.`dim_program`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_program` (
  `idProgram` INT NOT NULL AUTO_INCREMENT,
  `academic_lvl` ENUM('Undergraduate', 'Graduate', 'Doctorate') NOT NULL,
  `program_name` VARCHAR(145) NOT NULL,
  `programDuration` VARCHAR(45) NOT NULL,
  `department_name` VARCHAR(150) NOT NULL,
  `faculty_name` VARCHAR(150) NOT NULL,
  `campus_name` VARCHAR(45) NULL,
  `university_name` VARCHAR(150) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProgram`),
  INDEX `idProgram` (`idProgram` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 64
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_groupassociation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_groupassociation` (
  `idGroupAssociation` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('Seminary', 'Student Group', 'Research Group', 'Other') NOT NULL,
  `name` VARCHAR(80) NOT NULL,
  `knowledgeArea` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGroupAssociation`))
ENGINE = InnoDB
AUTO_INCREMENT = 21
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_professor` (
  `idprofessor` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `LastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idprofessor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`fact_academicwork`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`fact_academicwork` (
  `idResPubDeg` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('ResearchWork', 'Publication', 'DegreeWork') NOT NULL,
  `title` VARCHAR(200) NOT NULL,
  `knowledge_area` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(1000) NOT NULL,
  `idGroupAssociation` INT NULL DEFAULT NULL,
  `idDate_publication` INT NULL DEFAULT NULL,
  `idProgram` INT NULL DEFAULT NULL,
  `idProfessor` INT NULL,
  PRIMARY KEY (`idResPubDeg`),
  INDEX `fk_fact_res_pub_deg_dim_groupAssociation_idx` (`idGroupAssociation` ASC) VISIBLE,
  INDEX `fk_fact_res_pub_deg_dim_date2_idx` (`idDate_publication` ASC) VISIBLE,
  INDEX `fk_academicWork_dim_program1_idx` (`idProgram` ASC) VISIBLE,
  INDEX `fk_fact_academicwork_dim_professor1_idx` (`idProfessor` ASC) VISIBLE,
  CONSTRAINT `fk_academicWork_dim_program1`
    FOREIGN KEY (`idProgram`)
    REFERENCES `grad_dimensional`.`dim_program` (`idProgram`),
  CONSTRAINT `fk_fact_res_pub_deg_dim_date2`
    FOREIGN KEY (`idDate_publication`)
    REFERENCES `grad_dimensional`.`dim_date` (`idDate`),
  CONSTRAINT `fk_fact_res_pub_deg_dim_groupAssociation`
    FOREIGN KEY (`idGroupAssociation`)
    REFERENCES `grad_dimensional`.`dim_groupassociation` (`idGroupAssociation`),
  CONSTRAINT `fk_fact_academicwork_dim_professor1`
    FOREIGN KEY (`idProfessor`)
    REFERENCES `grad_dimensional`.`dim_professor` (`idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 64
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_graduate_has_academicwork`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_graduate_has_academicwork` (
  `dim_graduate_idGraduate` INT NOT NULL,
  `academicWork_idResPubDeg` INT NOT NULL,
  PRIMARY KEY (`dim_graduate_idGraduate`, `academicWork_idResPubDeg`),
  INDEX `fk_dim_graduate_has_academicWork_academicWork1_idx` (`academicWork_idResPubDeg` ASC) VISIBLE,
  INDEX `fk_dim_graduate_has_academicWork_dim_graduate1_idx` (`dim_graduate_idGraduate` ASC) VISIBLE,
  CONSTRAINT `fk_dim_graduate_has_academicWork_academicWork1`
    FOREIGN KEY (`academicWork_idResPubDeg`)
    REFERENCES `grad_dimensional`.`fact_academicwork` (`idResPubDeg`),
  CONSTRAINT `fk_dim_graduate_has_academicWork_dim_graduate1`
    FOREIGN KEY (`dim_graduate_idGraduate`)
    REFERENCES `grad_dimensional`.`dim_graduate` (`idGraduate`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`fact_service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`fact_service` (
  `idService` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('Curso', 'Charla', 'Préstamo de material bibliográfico', 'Bases de datos', 'Oferta de empleo') NOT NULL,
  `location` VARCHAR(250) NULL DEFAULT NULL,
  `valueService_USD` INT NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `knowledge_area` VARCHAR(45) NULL DEFAULT NULL,
  `duration_days` INT NULL,
  `idAdministrativedependency` INT NULL DEFAULT NULL,
  `idGroupAssociation` INT NULL DEFAULT NULL,
  `idDepartment` INT NULL DEFAULT NULL,
  `idEmploymentOffer` INT NULL DEFAULT NULL,
  `idStartDate` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idService`),
  INDEX `fk_fact_service_dim_administrativedependency1_idx` (`idAdministrativedependency` ASC) VISIBLE,
  INDEX `fk_fact_service_dim_groupAssociation1_idx` (`idGroupAssociation` ASC) VISIBLE,
  INDEX `fk_fact_service_dim_department1_idx` (`idDepartment` ASC) VISIBLE,
  INDEX `fk_fact_service_dim_employmentOffer1_idx` (`idEmploymentOffer` ASC) VISIBLE,
  INDEX `fk_fact_service_dim_date1_idx` (`idStartDate` ASC) VISIBLE,
  CONSTRAINT `fk_fact_service_dim_administrativedependency1`
    FOREIGN KEY (`idAdministrativedependency`)
    REFERENCES `grad_dimensional`.`dim_administrativedependency` (`id_administrativedependency`),
  CONSTRAINT `fk_fact_service_dim_date1`
    FOREIGN KEY (`idStartDate`)
    REFERENCES `grad_dimensional`.`dim_date` (`idDate`),
  CONSTRAINT `fk_fact_service_dim_department1`
    FOREIGN KEY (`idDepartment`)
    REFERENCES `grad_dimensional`.`dim_department` (`id_department`),
  CONSTRAINT `fk_fact_service_dim_employmentOffer1`
    FOREIGN KEY (`idEmploymentOffer`)
    REFERENCES `grad_dimensional`.`dim_employmentoffer` (`id_employmentOffer`),
  CONSTRAINT `fk_fact_service_dim_groupAssociation1`
    FOREIGN KEY (`idGroupAssociation`)
    REFERENCES `grad_dimensional`.`dim_groupassociation` (`idGroupAssociation`))
ENGINE = InnoDB
AUTO_INCREMENT = 32
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`dim_graduate_has_fact_service`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`dim_graduate_has_fact_service` (
  `dim_graduate_idGraduate` INT NOT NULL,
  `fact_service_idService` INT NOT NULL,
  PRIMARY KEY (`dim_graduate_idGraduate`, `fact_service_idService`),
  INDEX `fk_dim_graduate_has_fact_service_fact_service1_idx` (`fact_service_idService` ASC) VISIBLE,
  INDEX `fk_dim_graduate_has_fact_service_dim_graduate1_idx` (`dim_graduate_idGraduate` ASC) VISIBLE,
  CONSTRAINT `fk_dim_graduate_has_fact_service_dim_graduate1`
    FOREIGN KEY (`dim_graduate_idGraduate`)
    REFERENCES `grad_dimensional`.`dim_graduate` (`idGraduate`),
  CONSTRAINT `fk_dim_graduate_has_fact_service_fact_service1`
    FOREIGN KEY (`fact_service_idService`)
    REFERENCES `grad_dimensional`.`fact_service` (`idService`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`fact_job`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`fact_job` (
  `idJob` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('Entrepeneur', 'Contractor', 'Employeed', 'Unemployeed') NOT NULL,
  `salary` INT NOT NULL,
  `work_area` VARCHAR(45) NOT NULL,
  `position` VARCHAR(100) NOT NULL,
  `location` VARCHAR(45) NOT NULL,
  `tenure_months` INT NOT NULL,
  `idDate_start` INT NOT NULL,
  `idGraduate` INT NOT NULL,
  `idCompany` INT NOT NULL,
  `idEmploymentOffer` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idJob`),
  INDEX `fk_fact_job_dim_date1_idx` (`idDate_start` ASC) VISIBLE,
  INDEX `fk_fact_job_dim_company1_idx` (`idCompany` ASC) VISIBLE,
  INDEX `fk_fact_job_dim_graduate1_idx` (`idGraduate` ASC) VISIBLE,
  INDEX `fk_fact_job_dim_employmentOffer1_idx` (`idEmploymentOffer` ASC) VISIBLE,
  CONSTRAINT `fk_fact_job_dim_company1`
    FOREIGN KEY (`idCompany`)
    REFERENCES `grad_dimensional`.`dim_company` (`id_company`),
  CONSTRAINT `fk_fact_job_dim_date1`
    FOREIGN KEY (`idDate_start`)
    REFERENCES `grad_dimensional`.`dim_date` (`idDate`),
  CONSTRAINT `fk_fact_job_dim_employmentOffer1`
    FOREIGN KEY (`idEmploymentOffer`)
    REFERENCES `grad_dimensional`.`dim_employmentoffer` (`id_employmentOffer`),
  CONSTRAINT `fk_fact_job_dim_graduate1`
    FOREIGN KEY (`idGraduate`)
    REFERENCES `grad_dimensional`.`dim_graduate` (`idGraduate`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`fact_studentsupport`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`fact_studentsupport` (
  `idStudentSupport` INT NOT NULL AUTO_INCREMENT,
  `Founding Source` ENUM('Internal', 'External') NOT NULL,
  `Payment class` ENUM('Monetary', 'Services') NOT NULL,
  `type` ENUM('SocioEconómico vivienda', 'SocioEconómico transporte', 'SocioEconómico alimentación', 'Beca promedio', 'Auxiliar docente', 'Movilidad saliente internacional', 'Publicación de artículos académicos', 'Estudiante auxiliar', 'Monitor') NOT NULL,
  `idGraduate` INT NOT NULL,
  `idAdministrativedependency` INT NOT NULL,
  `idDepartment` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idStudentSupport`),
  INDEX `fk_fact_studentsupport_dim_graduate1_idx` (`idGraduate` ASC) VISIBLE,
  INDEX `fk_fact_studentsupport_dim_administrativedependency1_idx` (`idAdministrativedependency` ASC) VISIBLE,
  INDEX `fk_fact_studentsupport_dim_department1_idx` (`idDepartment` ASC) VISIBLE,
  CONSTRAINT `fk_fact_studentsupport_dim_administrativedependency1`
    FOREIGN KEY (`idAdministrativedependency`)
    REFERENCES `grad_dimensional`.`dim_administrativedependency` (`id_administrativedependency`),
  CONSTRAINT `fk_fact_studentsupport_dim_department1`
    FOREIGN KEY (`idDepartment`)
    REFERENCES `grad_dimensional`.`dim_department` (`id_department`),
  CONSTRAINT `fk_fact_studentsupport_dim_graduate1`
    FOREIGN KEY (`idGraduate`)
    REFERENCES `grad_dimensional`.`dim_graduate` (`idGraduate`))
ENGINE = InnoDB
AUTO_INCREMENT = 16
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`fact_DegreeWork`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`fact_DegreeWork` (
  `idDegreeWork` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('BAPI', 'Thesis', 'Degree Work', 'Other') NOT NULL,
  `title` VARCHAR(200) NOT NULL,
  `knowledge_area` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(1000) NOT NULL,
  `avgAcademicHistory` DECIMAL(2,1) NULL DEFAULT NULL,
  `UniqueIdentifier` VARCHAR(300) NULL DEFAULT NULL,
  `idGroupAssociation` INT NULL DEFAULT NULL,
  `idDate_publication` INT NULL DEFAULT NULL,
  `idProgram` INT NULL DEFAULT NULL,
  `idProfessor` INT NULL,
  PRIMARY KEY (`idDegreeWork`),
  INDEX `fk_fact_res_pub_deg_dim_groupAssociation_idx` (`idGroupAssociation` ASC) VISIBLE,
  INDEX `fk_fact_res_pub_deg_dim_date2_idx` (`idDate_publication` ASC) VISIBLE,
  INDEX `fk_academicWork_dim_program1_idx` (`idProgram` ASC) VISIBLE,
  INDEX `fk_fact_DegreeWork_dim_professor1_idx` (`idProfessor` ASC) VISIBLE,
  UNIQUE INDEX `UniqueIdentifier_UNIQUE` (`UniqueIdentifier` ASC) VISIBLE,
  CONSTRAINT `fk_academicWork_dim_program10`
    FOREIGN KEY (`idProgram`)
    REFERENCES `grad_dimensional`.`dim_program` (`idProgram`),
  CONSTRAINT `fk_fact_res_pub_deg_dim_date20`
    FOREIGN KEY (`idDate_publication`)
    REFERENCES `grad_dimensional`.`dim_date` (`idDate`),
  CONSTRAINT `fk_fact_res_pub_deg_dim_groupAssociation0`
    FOREIGN KEY (`idGroupAssociation`)
    REFERENCES `grad_dimensional`.`dim_groupassociation` (`idGroupAssociation`),
  CONSTRAINT `fk_fact_DegreeWork_dim_professor1`
    FOREIGN KEY (`idProfessor`)
    REFERENCES `grad_dimensional`.`dim_professor` (`idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 64
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`fact_ResearchWork`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`fact_ResearchWork` (
  `idResearch` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('Article', 'Proceeding', 'Other') NOT NULL,
  `title` VARCHAR(200) NOT NULL,
  `description` VARCHAR(1000) NOT NULL,
  `knowledge_area` VARCHAR(45) NULL DEFAULT NULL,
  `UniqueIdentifier` VARCHAR(300) NULL,
  `idGroupAssociation` INT NULL DEFAULT NULL,
  `idDate_publication` INT NULL DEFAULT NULL,
  `idProgram` INT NULL DEFAULT NULL,
  `idProfessor` INT NULL,
  PRIMARY KEY (`idResearch`),
  INDEX `fk_fact_res_pub_deg_dim_groupAssociation_idx` (`idGroupAssociation` ASC) VISIBLE,
  INDEX `fk_fact_res_pub_deg_dim_date2_idx` (`idDate_publication` ASC) VISIBLE,
  INDEX `fk_academicWork_dim_program1_idx` (`idProgram` ASC) VISIBLE,
  INDEX `fk_fact_ResearchWork_dim_professor1_idx` (`idProfessor` ASC) VISIBLE,
  UNIQUE INDEX `UniqueIdentifier_UNIQUE` (`UniqueIdentifier` ASC) VISIBLE,
  CONSTRAINT `fk_academicWork_dim_program100`
    FOREIGN KEY (`idProgram`)
    REFERENCES `grad_dimensional`.`dim_program` (`idProgram`),
  CONSTRAINT `fk_fact_res_pub_deg_dim_date200`
    FOREIGN KEY (`idDate_publication`)
    REFERENCES `grad_dimensional`.`dim_date` (`idDate`),
  CONSTRAINT `fk_fact_res_pub_deg_dim_groupAssociation00`
    FOREIGN KEY (`idGroupAssociation`)
    REFERENCES `grad_dimensional`.`dim_groupassociation` (`idGroupAssociation`),
  CONSTRAINT `fk_fact_ResearchWork_dim_professor1`
    FOREIGN KEY (`idProfessor`)
    REFERENCES `grad_dimensional`.`dim_professor` (`idprofessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 64
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`fact_Publication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`fact_Publication` (
  `idPublication` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(200) NOT NULL,
  `knowledge_area` VARCHAR(45) NULL DEFAULT NULL,
  `description` VARCHAR(1000) NOT NULL,
  `idGroupAssociation` INT NULL DEFAULT NULL,
  `idDate_publication` INT NULL DEFAULT NULL,
  PRIMARY KEY (`idPublication`),
  INDEX `fk_fact_res_pub_deg_dim_groupAssociation_idx` (`idGroupAssociation` ASC) VISIBLE,
  INDEX `fk_fact_res_pub_deg_dim_date2_idx` (`idDate_publication` ASC) VISIBLE,
  CONSTRAINT `fk_fact_res_pub_deg_dim_date2000`
    FOREIGN KEY (`idDate_publication`)
    REFERENCES `grad_dimensional`.`dim_date` (`idDate`),
  CONSTRAINT `fk_fact_res_pub_deg_dim_groupAssociation000`
    FOREIGN KEY (`idGroupAssociation`)
    REFERENCES `grad_dimensional`.`dim_groupassociation` (`idGroupAssociation`))
ENGINE = InnoDB
AUTO_INCREMENT = 64
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`fact_Publication_has_dim_graduate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`fact_Publication_has_dim_graduate` (
  `fact_Publication_idPublication` INT NOT NULL,
  `dim_graduate_idGraduate` INT NOT NULL,
  PRIMARY KEY (`fact_Publication_idPublication`, `dim_graduate_idGraduate`),
  INDEX `fk_fact_Publication_has_dim_graduate_dim_graduate1_idx` (`dim_graduate_idGraduate` ASC) VISIBLE,
  INDEX `fk_fact_Publication_has_dim_graduate_fact_Publication1_idx` (`fact_Publication_idPublication` ASC) VISIBLE,
  CONSTRAINT `fk_fact_Publication_has_dim_graduate_fact_Publication1`
    FOREIGN KEY (`fact_Publication_idPublication`)
    REFERENCES `grad_dimensional`.`fact_Publication` (`idPublication`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_Publication_has_dim_graduate_dim_graduate1`
    FOREIGN KEY (`dim_graduate_idGraduate`)
    REFERENCES `grad_dimensional`.`dim_graduate` (`idGraduate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`fact_DegreeWork_has_dim_graduate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`fact_DegreeWork_has_dim_graduate` (
  `fact_DegreeWork_idDegreeWork` INT NOT NULL,
  `dim_graduate_idGraduate` INT NOT NULL,
  PRIMARY KEY (`fact_DegreeWork_idDegreeWork`, `dim_graduate_idGraduate`),
  INDEX `fk_fact_DegreeWork_has_dim_graduate_dim_graduate1_idx` (`dim_graduate_idGraduate` ASC) VISIBLE,
  INDEX `fk_fact_DegreeWork_has_dim_graduate_fact_DegreeWork1_idx` (`fact_DegreeWork_idDegreeWork` ASC) VISIBLE,
  CONSTRAINT `fk_fact_DegreeWork_has_dim_graduate_fact_DegreeWork1`
    FOREIGN KEY (`fact_DegreeWork_idDegreeWork`)
    REFERENCES `grad_dimensional`.`fact_DegreeWork` (`idDegreeWork`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_DegreeWork_has_dim_graduate_dim_graduate1`
    FOREIGN KEY (`dim_graduate_idGraduate`)
    REFERENCES `grad_dimensional`.`dim_graduate` (`idGraduate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `grad_dimensional`.`fact_ResearchWork_has_dim_graduate`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `grad_dimensional`.`fact_ResearchWork_has_dim_graduate` (
  `fact_ResearchWork_idResearch` INT NOT NULL,
  `dim_graduate_idGraduate` INT NOT NULL,
  PRIMARY KEY (`fact_ResearchWork_idResearch`, `dim_graduate_idGraduate`),
  INDEX `fk_fact_ResearchWork_has_dim_graduate_dim_graduate1_idx` (`dim_graduate_idGraduate` ASC) VISIBLE,
  INDEX `fk_fact_ResearchWork_has_dim_graduate_fact_ResearchWork1_idx` (`fact_ResearchWork_idResearch` ASC) VISIBLE,
  CONSTRAINT `fk_fact_ResearchWork_has_dim_graduate_fact_ResearchWork1`
    FOREIGN KEY (`fact_ResearchWork_idResearch`)
    REFERENCES `grad_dimensional`.`fact_ResearchWork` (`idResearch`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fact_ResearchWork_has_dim_graduate_dim_graduate1`
    FOREIGN KEY (`dim_graduate_idGraduate`)
    REFERENCES `grad_dimensional`.`dim_graduate` (`idGraduate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
