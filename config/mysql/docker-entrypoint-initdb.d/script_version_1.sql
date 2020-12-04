-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema agenda_escolar
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema agenda_escolar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `agenda_escolar` DEFAULT CHARACTER SET utf8 ;
USE `agenda_escolar` ;

-- -----------------------------------------------------
-- Table `agenda_escolar`.`aluno`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda_escolar`.`aluno` (
  `id_aluno` INT NOT NULL AUTO_INCREMENT,
  `nome_aluno` VARCHAR(100) NOT NULL,
  `cpf_aluno` VARCHAR(12) NOT NULL,
  `sexo_aluno` ENUM('M', 'F') NOT NULL,
  `dt_nasc_aluno` CHAR(2) NOT NULL,
  `email_aluno` VARCHAR(100) NULL,
  `contato_aluno` VARCHAR(11) NULL,
  `senha_aluno` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id_aluno`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenda_escolar`.`responsavel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda_escolar`.`responsavel` (
  `id_responsavel` INT NOT NULL AUTO_INCREMENT,
  `nome_responsavel` VARCHAR(100) NOT NULL,
  `cpf_responsavel` VARCHAR(11) NOT NULL,
  `sexo_responsavel` CHAR(1) NOT NULL,
  `dt_nasc_responsavel` DATE NOT NULL,
  `email_responsavel` VARCHAR(100) NULL,
  `contato_responsavel` VARCHAR(12) NULL,
  `senha_responsavel` VARCHAR(8) NOT NULL,
  PRIMARY KEY (`id_responsavel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenda_escolar`.`endereco`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda_escolar`.`endereco` (
  `id_endereco` INT NOT NULL AUTO_INCREMENT,
  `cep` VARCHAR(8) NOT NULL,
  `bairro` VARCHAR(45) NOT NULL,
  `cidade` VARCHAR(45) NOT NULL,
  `logradouro` VARCHAR(100) NULL,
  `numero` INT(6) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `uf` CHAR(2) NOT NULL,
  `responsavel_id_responsavel` INT NOT NULL,
  PRIMARY KEY (`id_endereco`, `responsavel_id_responsavel`),
  INDEX `fk_endereco_responsavel_idx` (`responsavel_id_responsavel` ASC),
  CONSTRAINT `fk_endereco_responsavel`
    FOREIGN KEY (`responsavel_id_responsavel`)
    REFERENCES `agenda_escolar`.`responsavel` (`id_responsavel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenda_escolar`.`aluno_responsavel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda_escolar`.`aluno_responsavel` (
  `responsavel_id_responsavel` INT NOT NULL,
  `aluno_id_aluno` INT NOT NULL,
  PRIMARY KEY (`responsavel_id_responsavel`, `aluno_id_aluno`),
  INDEX `fk_aluno_responsavel_aluno1_idx` (`aluno_id_aluno` ASC),
  CONSTRAINT `fk_aluno_responsavel_responsavel1`
    FOREIGN KEY (`responsavel_id_responsavel`)
    REFERENCES `agenda_escolar`.`responsavel` (`id_responsavel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_aluno_responsavel_aluno1`
    FOREIGN KEY (`aluno_id_aluno`)
    REFERENCES `agenda_escolar`.`aluno` (`id_aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenda_escolar`.`tipo_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda_escolar`.`tipo_usuario` (
  `id_tipo_usuario` INT NOT NULL AUTO_INCREMENT,
  `perfil_tipo_usuario` VARCHAR(15) NOT NULL,
  `responsavel_id_responsavel` INT NOT NULL,
  `aluno_id_aluno` INT NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`, `responsavel_id_responsavel`, `aluno_id_aluno`),
  INDEX `fk_tipo_usuario_responsavel1_idx` (`responsavel_id_responsavel` ASC),
  INDEX `fk_tipo_usuario_aluno1_idx` (`aluno_id_aluno` ASC),
  CONSTRAINT `fk_tipo_usuario_responsavel1`
    FOREIGN KEY (`responsavel_id_responsavel`)
    REFERENCES `agenda_escolar`.`responsavel` (`id_responsavel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tipo_usuario_aluno1`
    FOREIGN KEY (`aluno_id_aluno`)
    REFERENCES `agenda_escolar`.`aluno` (`id_aluno`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenda_escolar`.`professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda_escolar`.`professor` (
  `id_professor` INT NOT NULL AUTO_INCREMENT,
  `nome_professor` VARCHAR(45) NOT NULL,
  `sexo_professor` ENUM('M', 'F') NOT NULL,
  `registro_professor` VARCHAR(8) NOT NULL,
  `contato_professor` VARCHAR(12) NOT NULL,
  `email_professor` VARCHAR(100) NOT NULL,
  `senha_professor` VARCHAR(8) NOT NULL,
  `tipo_usuario_id_tipo_usuario` INT NOT NULL,
  PRIMARY KEY (`id_professor`, `tipo_usuario_id_tipo_usuario`),
  INDEX `fk_professor_tipo_usuario1_idx` (`tipo_usuario_id_tipo_usuario` ASC),
  CONSTRAINT `fk_professor_tipo_usuario1`
    FOREIGN KEY (`tipo_usuario_id_tipo_usuario`)
    REFERENCES `agenda_escolar`.`tipo_usuario` (`id_tipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenda_escolar`.`turma`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda_escolar`.`turma` (
  `id_turma` INT NOT NULL AUTO_INCREMENT,
  `descricao_turma` VARCHAR(10) NOT NULL,
  `periodo_turma` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id_turma`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenda_escolar`.`turma_professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda_escolar`.`turma_professor` (
  `turma_id_turma` INT NOT NULL,
  `professor_id_professor` INT NOT NULL,
  `professor_tipo_usuario_id_tipo_usuario` INT NOT NULL,
  INDEX `fk_turma_professor_turma1_idx` (`turma_id_turma` ASC),
  INDEX `fk_turma_professor_professor1_idx` 
  (`professor_id_professor` ASC, `professor_tipo_usuario_id_tipo_usuario` ASC),
  CONSTRAINT `fk_turma_professor_turma1`
    FOREIGN KEY (`turma_id_turma`)
    REFERENCES `agenda_escolar`.`turma` (`id_turma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_professor_professor1`
    FOREIGN KEY (`professor_id_professor` , `professor_tipo_usuario_id_tipo_usuario`)
    REFERENCES `agenda_escolar`.`professor` (`id_professor` , `tipo_usuario_id_tipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenda_escolar`.`disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda_escolar`.`disciplina` (
  `id_disciplina` INT NOT NULL AUTO_INCREMENT,
  `nome_disciplina` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id_disciplina`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenda_escolar`.`turma_disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda_escolar`.`turma_disciplina` (
  `disciplina_id_disciplina` INT NOT NULL,
  `turma_id_turma` INT NOT NULL,
  INDEX `fk_turma_disciplina_disciplina1_idx` (`disciplina_id_disciplina` ASC),
  INDEX `fk_turma_disciplina_turma1_idx` (`turma_id_turma` ASC),
  CONSTRAINT `fk_turma_disciplina_disciplina1`
    FOREIGN KEY (`disciplina_id_disciplina`)
    REFERENCES `agenda_escolar`.`disciplina` (`id_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_turma_disciplina_turma1`
    FOREIGN KEY (`turma_id_turma`)
    REFERENCES `agenda_escolar`.`turma` (`id_turma`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `agenda_escolar`.`professor_disciplina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `agenda_escolar`.`professor_disciplina` (
  `professor_id_professor` INT NOT NULL,
  `professor_tipo_usuario_id_tipo_usuario` INT NOT NULL,
  `disciplina_id_disciplina` INT NOT NULL,
  PRIMARY KEY (`professor_id_professor`, `professor_tipo_usuario_id_tipo_usuario`, `disciplina_id_disciplina`),
  INDEX `fk_professor_disciplina_disciplina1_idx` (`disciplina_id_disciplina` ASC),
  CONSTRAINT `fk_professor_disciplina_professor1`
    FOREIGN KEY (`professor_id_professor` , `professor_tipo_usuario_id_tipo_usuario`)
    REFERENCES `agenda_escolar`.`professor` (`id_professor` , `tipo_usuario_id_tipo_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_professor_disciplina_disciplina1`
    FOREIGN KEY (`disciplina_id_disciplina`)
    REFERENCES `agenda_escolar`.`disciplina` (`id_disciplina`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
