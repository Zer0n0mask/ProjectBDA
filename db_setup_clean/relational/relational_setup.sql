-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema grad_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `grad_db` ;

-- -----------------------------------------------------
-- Schema grad_db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `grad_db` DEFAULT CHARACTER SET utf8 ;
USE `grad_db` ;

-- -----------------------------------------------------
-- Table `grad_db`.`Graduate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`Graduate` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`Graduate` (
  `idGraduate` INT NOT NULL,
  `docTipe` ENUM('CC', 'Passport', 'CE', 'Other') NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `lastname` VARCHAR(45) NOT NULL,
  `gender` ENUM('M', 'F', 'Other') NOT NULL,
  `ethnics` VARCHAR(45) NULL,
  `pbm` INT NULL,
  `stratum` VARCHAR(45) NULL,
  `birthday` DATE NULL,
  PRIMARY KEY (`idGraduate`),
  UNIQUE INDEX `id_UNIQUE` (`idGraduate` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`ContactInfo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`ContactInfo` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`ContactInfo` (
  `idContactInfo` INT NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(200) NULL,
  `personal_EmailAddress` VARCHAR(45) NULL,
  `edu_EmailAddress` VARCHAR(45) NULL,
  `first_Phone` VARCHAR(50) NULL,
  `second_Phone` VARCHAR(50) NULL,
  `idGraduate` INT NOT NULL,
  PRIMARY KEY (`idContactInfo`),
  UNIQUE INDEX `personal_EmailAddress_UNIQUE` (`personal_EmailAddress` ASC) VISIBLE,
  UNIQUE INDEX `edu_EmailAddress_UNIQUE` (`edu_EmailAddress` ASC) VISIBLE,
  INDEX `fk_ContactInfo_Graduate1_idx` (`idGraduate` ASC) VISIBLE,
  CONSTRAINT `fk_ContactInfo_Graduate1`
    FOREIGN KEY (`idGraduate`)
    REFERENCES `grad_db`.`Graduate` (`idGraduate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`University`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`University` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`University` (
  `idUniversity` INT NOT NULL AUTO_INCREMENT,
  `university_name` VARCHAR(150) NULL,
  `campus_name` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  PRIMARY KEY (`idUniversity`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`Faculty`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`Faculty` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`Faculty` (
  `idFaculty` INT NOT NULL AUTO_INCREMENT,
  `faculty_name` VARCHAR(150) NULL,
  `idUniversity` INT NOT NULL,
  PRIMARY KEY (`idFaculty`),
  INDEX `fk_Faculty_University1_idx` (`idUniversity` ASC) VISIBLE,
  CONSTRAINT `fk_Faculty_University1`
    FOREIGN KEY (`idUniversity`)
    REFERENCES `grad_db`.`University` (`idUniversity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`Department`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`Department` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`Department` (
  `idDepartment` INT NOT NULL AUTO_INCREMENT,
  `department_name` VARCHAR(150) NULL,
  `idFaculty` INT NOT NULL,
  PRIMARY KEY (`idDepartment`),
  INDEX `fk_Department_Faculty1_idx` (`idFaculty` ASC) VISIBLE,
  CONSTRAINT `fk_Department_Faculty1`
    FOREIGN KEY (`idFaculty`)
    REFERENCES `grad_db`.`Faculty` (`idFaculty`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`Program`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`Program` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`Program` (
  `idProgram` INT NOT NULL AUTO_INCREMENT,
  `academic_lvl` ENUM('Undergraduate', 'Graduate', 'Doctorate') NOT NULL,
  `program_name` VARCHAR(145) NOT NULL,
  `duration` VARCHAR(45) NULL,
  `idDepartment` INT NOT NULL,
  PRIMARY KEY (`idProgram`),
  INDEX `fk_Program_Department1_idx` (`idDepartment` ASC) VISIBLE,
  CONSTRAINT `fk_Program_Department1`
    FOREIGN KEY (`idDepartment`)
    REFERENCES `grad_db`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`Graduate_has_Program`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`Graduate_has_Program` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`Graduate_has_Program` (
  `idGraduateHasProgram` INT NOT NULL AUTO_INCREMENT,
  `idGraduate` INT NOT NULL,
  `idProgram` INT NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NULL,
  `academic_avg` DECIMAL(2,1) NULL,
  INDEX `fk_Graduate_has_Program_Program1_idx` (`idProgram` ASC) VISIBLE,
  INDEX `fk_Graduate_has_Program_Graduate1_idx` (`idGraduate` ASC) VISIBLE,
  PRIMARY KEY (`idGraduateHasProgram`),
  CONSTRAINT `fk_Graduate_has_Program_Graduate1`
    FOREIGN KEY (`idGraduate`)
    REFERENCES `grad_db`.`Graduate` (`idGraduate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Graduate_has_Program_Program1`
    FOREIGN KEY (`idProgram`)
    REFERENCES `grad_db`.`Program` (`idProgram`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`DegreeWork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`DegreeWork` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`DegreeWork` (
  `idDegreeWork` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('BAPI', 'Thesis', 'Degree Work', 'Other') NOT NULL,
  `title` VARCHAR(200) NOT NULL,
  `knwolegde_area` VARCHAR(45) NOT NULL,
  `description` VARCHAR(1000) NULL,
  `defense_date` DATE NOT NULL,
  `idGraduateHasProgram` INT NOT NULL,
  PRIMARY KEY (`idDegreeWork`),
  INDEX `fk_DegreeWork_Graduate_has_Program1_idx` (`idGraduateHasProgram` ASC) VISIBLE,
  CONSTRAINT `fk_DegreeWork_Graduate_has_Program1`
    FOREIGN KEY (`idGraduateHasProgram`)
    REFERENCES `grad_db`.`Graduate_has_Program` (`idGraduateHasProgram`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`GroupAssociation`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`GroupAssociation` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`GroupAssociation` (
  `idGroupAssociation` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('Seminary', 'Student Group', 'Research Group', 'Other') NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `knowledge_area` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGroupAssociation`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`Professor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`Professor` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`Professor` (
  `idProfessor` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(150) NOT NULL,
  `lastname` VARCHAR(150) NOT NULL,
  PRIMARY KEY (`idProfessor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`ResearchWork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`ResearchWork` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`ResearchWork` (
  `idResearchWork` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('Article', 'Presentation', 'Other') NOT NULL,
  `title` VARCHAR(200) NOT NULL,
  `defense_date` DATE NULL,
  `idGroupAssociation` INT NULL,
  `idDegreeWork` INT NULL,
  `idProfessor` INT NULL,
  PRIMARY KEY (`idResearchWork`),
  INDEX `fk_ResearchWork_GroupAssociation1_idx` (`idGroupAssociation` ASC) VISIBLE,
  INDEX `fk_ResearchWork_DegreeWork1_idx` (`idDegreeWork` ASC) VISIBLE,
  INDEX `fk_ResearchWork_Professor1_idx` (`idProfessor` ASC) VISIBLE,
  CONSTRAINT `fk_ResearchWork_GroupAssociation1`
    FOREIGN KEY (`idGroupAssociation`)
    REFERENCES `grad_db`.`GroupAssociation` (`idGroupAssociation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResearchWork_DegreeWork1`
    FOREIGN KEY (`idDegreeWork`)
    REFERENCES `grad_db`.`DegreeWork` (`idDegreeWork`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResearchWork_Professor1`
    FOREIGN KEY (`idProfessor`)
    REFERENCES `grad_db`.`Professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`Publication`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`Publication` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`Publication` (
  `idPublication` INT NOT NULL AUTO_INCREMENT,
  `journal` VARCHAR(45) NULL,
  `dateOfPublication` DATE NULL,
  `Knowledge_area` VARCHAR(45) NULL,
  `idResearchWork` INT NULL,
  PRIMARY KEY (`idPublication`),
  INDEX `fk_Publication_ResearchWork1_idx` (`idResearchWork` ASC) VISIBLE,
  CONSTRAINT `fk_Publication_ResearchWork1`
    FOREIGN KEY (`idResearchWork`)
    REFERENCES `grad_db`.`ResearchWork` (`idResearchWork`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`Company`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`Company` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`Company` (
  `idCompany` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NULL,
  `area` VARCHAR(45) NULL,
  PRIMARY KEY (`idCompany`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`AdministrativeDependency`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`AdministrativeDependency` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`AdministrativeDependency` (
  `idAdministrativeDependency` INT NOT NULL AUTO_INCREMENT,
  `AdministrativeDependency_name` VARCHAR(150) NULL,
  `idUniversity` INT NOT NULL,
  `idFaculty` INT NULL,
  PRIMARY KEY (`idAdministrativeDependency`),
  INDEX `fk_AdministrativeDependencie_University1_idx` (`idUniversity` ASC) VISIBLE,
  INDEX `fk_AdministrativeDependencie_Faculty1_idx` (`idFaculty` ASC) VISIBLE,
  CONSTRAINT `fk_AdministrativeDependencie_University1`
    FOREIGN KEY (`idUniversity`)
    REFERENCES `grad_db`.`University` (`idUniversity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AdministrativeDependencie_Faculty1`
    FOREIGN KEY (`idFaculty`)
    REFERENCES `grad_db`.`Faculty` (`idFaculty`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`ServicesToGraduates`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`ServicesToGraduates` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`ServicesToGraduates` (
  `idServicesToGraduates` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('Curso', 'Charla', 'Préstamo de material bibliográfico', 'Bases de datos', 'Oferta de empleo') NOT NULL,
  `description` VARCHAR(500) NOT NULL,
  `knowledge_area` VARCHAR(45) NULL,
  `location` VARCHAR(145) NULL,
  `value` INT NULL,
  `start_date` DATE NULL,
  `final_date` DATE NULL,
  `idAdministrativeDependency` INT NULL,
  `idDepartment` INT NULL,
  `idGroupAssociation` INT NULL,
  PRIMARY KEY (`idServicesToGraduates`),
  INDEX `fk_ServicesToGraduates_AdministrativeDependency1_idx` (`idAdministrativeDependency` ASC) VISIBLE,
  INDEX `fk_ServicesToGraduates_Department1_idx` (`idDepartment` ASC) VISIBLE,
  INDEX `fk_ServicesToGraduates_GroupAssociation1_idx` (`idGroupAssociation` ASC) VISIBLE,
  CONSTRAINT `fk_ServicesToGraduates_AdministrativeDependency1`
    FOREIGN KEY (`idAdministrativeDependency`)
    REFERENCES `grad_db`.`AdministrativeDependency` (`idAdministrativeDependency`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServicesToGraduates_Department1`
    FOREIGN KEY (`idDepartment`)
    REFERENCES `grad_db`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ServicesToGraduates_GroupAssociation1`
    FOREIGN KEY (`idGroupAssociation`)
    REFERENCES `grad_db`.`GroupAssociation` (`idGroupAssociation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`EmploymentOffer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`EmploymentOffer` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`EmploymentOffer` (
  `idEmploymentOffer` INT NOT NULL AUTO_INCREMENT,
  `idServicesToGraduates` INT NULL,
  `company_name` VARCHAR(45) NOT NULL,
  `available_until_date` DATE NOT NULL,
  `contact_email` VARCHAR(150) NOT NULL,
  `seeking_knowledge_area` VARCHAR(45) NULL,
  `seeking_academic_lvl` ENUM('Undergraduate', 'Graduate', 'Doctorate') NULL,
  PRIMARY KEY (`idEmploymentOffer`),
  INDEX `fk_EmploymentOffer_GraduateSupport1_idx` (`idServicesToGraduates` ASC) VISIBLE,
  CONSTRAINT `fk_EmploymentOffer_GraduateSupport1`
    FOREIGN KEY (`idServicesToGraduates`)
    REFERENCES `grad_db`.`ServicesToGraduates` (`idServicesToGraduates`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`Job`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`Job` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`Job` (
  `idJob` INT NOT NULL AUTO_INCREMENT,
  `type` ENUM('Entrepeneur', 'Contractort', 'Employeed', 'Unemployeed') NULL,
  `salary` INT NULL,
  `start_date` DATE NOT NULL,
  `final_date` DATE NULL,
  `work_area` VARCHAR(45) NULL,
  `position` VARCHAR(100) NULL,
  `location` VARCHAR(45) NULL,
  `idCompany` INT NOT NULL,
  `idGraduate` INT NOT NULL,
  `idEmploymentOffer` INT NULL,
  PRIMARY KEY (`idJob`),
  INDEX `fk_Job_Company1_idx` (`idCompany` ASC) VISIBLE,
  INDEX `fk_Job_Graduate1_idx` (`idGraduate` ASC) VISIBLE,
  INDEX `fk_Job_EmploymentOffer1_idx` (`idEmploymentOffer` ASC) VISIBLE,
  CONSTRAINT `fk_Job_Company1`
    FOREIGN KEY (`idCompany`)
    REFERENCES `grad_db`.`Company` (`idCompany`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Job_Graduate1`
    FOREIGN KEY (`idGraduate`)
    REFERENCES `grad_db`.`Graduate` (`idGraduate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Job_EmploymentOffer1`
    FOREIGN KEY (`idEmploymentOffer`)
    REFERENCES `grad_db`.`EmploymentOffer` (`idEmploymentOffer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`StudentSupport`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`StudentSupport` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`StudentSupport` (
  `idStudentSupport` INT NOT NULL AUTO_INCREMENT,
  `isExternal` TINYINT NULL,
  `isMonetaryRetributed` TINYINT NULL,
  `type` ENUM('SocioEconómico vivienda', 'SocioEconómico transporte', 'SocioEconómico alimentación', 'Beca promedio', 'Auxiliar docente', 'Movilidad saliente internacional', 'Publicación de artículos académicos', 'Estudiante auxiliar', 'Monitor') NULL,
  `Graduate_idGraduate` INT NULL,
  `idAdministrativeDependency` INT NOT NULL,
  `idDepartment` INT NULL,
  PRIMARY KEY (`idStudentSupport`),
  INDEX `fk_StudentSupport_Graduate1_idx` (`Graduate_idGraduate` ASC) VISIBLE,
  INDEX `fk_StudentSupport_AdministrativeDependency1_idx` (`idAdministrativeDependency` ASC) VISIBLE,
  INDEX `fk_StudentSupport_Department1_idx` (`idDepartment` ASC) VISIBLE,
  CONSTRAINT `fk_StudentSupport_Graduate1`
    FOREIGN KEY (`Graduate_idGraduate`)
    REFERENCES `grad_db`.`Graduate` (`idGraduate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StudentSupport_AdministrativeDependency1`
    FOREIGN KEY (`idAdministrativeDependency`)
    REFERENCES `grad_db`.`AdministrativeDependency` (`idAdministrativeDependency`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_StudentSupport_Department1`
    FOREIGN KEY (`idDepartment`)
    REFERENCES `grad_db`.`Department` (`idDepartment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`Graduate_takes_ServicesToGraduates`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`Graduate_takes_ServicesToGraduates` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`Graduate_takes_ServicesToGraduates` (
  `idGraduate` INT NOT NULL,
  `idServicesToGraduates` INT NOT NULL,
  `taken_service_date` DATE NOT NULL,
  INDEX `fk_Graduate_has_ServicesToGraduates_ServicesToGraduates1_idx` (`idServicesToGraduates` ASC) VISIBLE,
  INDEX `fk_Graduate_has_ServicesToGraduates_Graduate1_idx` (`idGraduate` ASC) VISIBLE,
  CONSTRAINT `fk_Graduate_has_ServicesToGraduates_Graduate1`
    FOREIGN KEY (`idGraduate`)
    REFERENCES `grad_db`.`Graduate` (`idGraduate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Graduate_has_ServicesToGraduates_ServicesToGraduates1`
    FOREIGN KEY (`idServicesToGraduates`)
    REFERENCES `grad_db`.`ServicesToGraduates` (`idServicesToGraduates`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `grad_db`.`ResearchWork_has_Graduate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `grad_db`.`ResearchWork_has_Graduate` ;

CREATE TABLE IF NOT EXISTS `grad_db`.`ResearchWork_has_Graduate` (
  `idResearchWork` INT NOT NULL,
  `idGraduate` INT NOT NULL,
  PRIMARY KEY (`idResearchWork`, `idGraduate`),
  INDEX `fk_ResearchWork_has_Graduate_Graduate1_idx` (`idGraduate` ASC) VISIBLE,
  INDEX `fk_ResearchWork_has_Graduate_ResearchWork1_idx` (`idResearchWork` ASC) VISIBLE,
  CONSTRAINT `fk_ResearchWork_has_Graduate_ResearchWork1`
    FOREIGN KEY (`idResearchWork`)
    REFERENCES `grad_db`.`ResearchWork` (`idResearchWork`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ResearchWork_has_Graduate_Graduate1`
    FOREIGN KEY (`idGraduate`)
    REFERENCES `grad_db`.`Graduate` (`idGraduate`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
