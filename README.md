# O Hospital Fundamental

Um pequeno hospital local busca desenvolver um novo sistema que atenda melhor às suas necessidades. Atualmente, parte da operação ainda se apoia em planilhas e arquivos antigos, mas espera-se que esses dados sejam transferidos para o novo sistema assim que ele estiver funcional. Neste momento, é necessário analisar com cuidado as necessidades desse cliente e sugerir uma estrutura de banco de dados adequada por meio de um Diagrama Entidade-Relacionamento.

## Parte 1:
![Diagrama](https://github.com/DiogoJP202/O-Hospital-Fundamental/assets/102389309/be8a5a71-f18a-4e0b-8880-335c61836c2f)
![HospitalSQL](https://github.com/DiogoJP202/O-Hospital-Fundamental/assets/102389309/3258adcb-966e-4dc2-b827-dfef222c536e)

## Parte 2:

![Diagrama logico](https://github.com/DiogoJP202/O-Hospital-Fundamental/assets/102389309/c585e1f3-d01d-442c-a958-f15299b07c02)

Script MySQL:
```mysql
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`enfermeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`enfermeiro` (
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `cre` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`dados_pessoais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dados_pessoais` (
  `id` INT NOT NULL,
  `nascimento` DATE NOT NULL,
  `endereco` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `cpf` VARCHAR(255) NOT NULL,
  `rg` VARCHAR(255) NOT NULL,
  `enfermeiro_id` INT NOT NULL,
  PRIMARY KEY (`id`, `enfermeiro_id`),
  UNIQUE INDEX `cpf_UNIQUE` (`cpf`),
  UNIQUE INDEX `rg_UNIQUE` (`rg`),
  INDEX `fk_dados_pessoais_enfermeiro1_idx` (`enfermeiro_id`),
  CONSTRAINT `fk_dados_pessoais_enfermeiro1`
    FOREIGN KEY (`enfermeiro_id`)
    REFERENCES `mydb`.`enfermeiro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medicos` (
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `tipo_profissional` VARCHAR(255) NOT NULL,
  `dados_pessoais_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_medicos_dados_pessoais1_idx` (`dados_pessoais_id`),
  CONSTRAINT `fk_medicos_dados_pessoais1`
    FOREIGN KEY (`dados_pessoais_id`)
    REFERENCES `mydb`.`dados_pessoais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`tipo_quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tipo_quarto` (
  `id` INT NOT NULL,
  `descricao` VARCHAR(255) NOT NULL,
  `valor_diaria` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`quartos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`quartos` (
  `id` INT NOT NULL,
  `numero` INT NOT NULL,
  `tipo_quarto_id` INT NOT NULL,
  PRIMARY KEY (`id`, `tipo_quarto_id`),
  INDEX `fk_quartos_tipo_quarto1_idx` (`tipo_quarto_id`),
  CONSTRAINT `fk_quartos_tipo_quarto1`
    FOREIGN KEY (`tipo_quarto_id`)
    REFERENCES `mydb`.`tipo_quarto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`internacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`internacao` (
  `id` INT NOT NULL,
  `data_entrada` DATE NOT NULL,
  `data_prev_alta` DATE NOT NULL,
  `data_alta` DATE NOT NULL,
  `procedimento` TEXT NOT NULL,
  `quartos_id` INT NOT NULL,
  `quartos_tipo_quarto_id` INT NOT NULL,
  PRIMARY KEY (`id`, `quartos_id`, `quartos_tipo_quarto_id`),
  INDEX `fk_internacao_quartos1_idx` (`quartos_id`, `quartos_tipo_quarto_id`),
  CONSTRAINT `fk_internacao_quartos1`
    FOREIGN KEY (`quartos_id`, `quartos_tipo_quarto_id`)
    REFERENCES `mydb`.`quartos` (`id`, `tipo_quarto_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pacientes` (
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `dados_pessoais_id` INT NOT NULL,
  `internacao_id` INT NOT NULL,
  `internacao_quartos_id` INT NOT NULL,
  `internacao_quartos_tipo_quarto_id` INT NOT NULL,
  PRIMARY KEY (`id`, `internacao_id`, `internacao_quartos_id`, `internacao_quartos_tipo_quarto_id`),
  INDEX `fk_pacientes_dados_pessoais1_idx` (`dados_pessoais_id`),
  INDEX `fk_pacientes_internacao1_idx` (`internacao_id`, `internacao_quartos_id`, `internacao_quartos_tipo_quarto_id`),
  CONSTRAINT `fk_pacientes_dados_pessoais1`
    FOREIGN KEY (`dados_pessoais_id`)
    REFERENCES `mydb`.`dados_pessoais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pacientes_internacao1`
    FOREIGN KEY (`internacao_id`, `internacao_quartos_id`, `internacao_quartos_tipo_quarto_id`)
    REFERENCES `mydb`.`internacao` (`id`, `quartos_id`, `quartos_tipo_quarto_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`especialidades`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`especialidades` (
  `id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `nome_UNIQUE` (`nome`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`convenios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`convenios` (
  `id` INT NOT NULL,
  `cnpj` VARCHAR(255) NOT NULL,
  `tempo_carencia` INT NOT NULL,
  `numero_carteira` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`consulta` (
  `id` INT NOT NULL,
  `data` DATETIME NOT NULL,
  `valor` INT NULL,
  `convenios_id` INT NULL,
  `pacientes_id` INT NOT NULL,
  `medicos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_consulta_convenios1_idx` (`convenios_id`),
  INDEX `fk_consulta_pacientes1_idx` (`pacientes_id`),
  INDEX `fk_consulta_medicos1_idx` (`medicos_id`),
  CONSTRAINT `fk_consulta_convenios1`
    FOREIGN KEY (`convenios_id`)
    REFERENCES `mydb`.`convenios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_pacientes1`
    FOREIGN KEY (`pacientes_id`)
    REFERENCES `mydb`.`pacientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_consulta_medicos1`
    FOREIGN KEY (`medicos_id`)
    REFERENCES `mydb`.`medicos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`receita` (
  `id` INT NOT NULL,
  `nome_medicamento` VARCHAR(255) NOT NULL,
  `quantidade` VARCHAR(255) NOT NULL,
  `instrucoes` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`medico_especialidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medico_especialidade` (
  `medicos_id` INT NOT NULL,
  `especialidades_id` INT NOT NULL,
  PRIMARY KEY (`medicos_id`, `especialidades_id`),
  INDEX `fk_Especialidades_has_Médicos_Médicos1_idx` (`medicos_id`),
  INDEX `fk_Especialidades_has_Médicos_Especialidades_idx` (`especialidades_id`),
  CONSTRAINT `fk_Especialidades_has_Médicos_Especialidades`
    FOREIGN KEY (`especialidades_id`)
    REFERENCES `mydb`.`especialidades` (`id`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Especialidades_has_Médicos_Médicos1`
    FOREIGN KEY (`medicos_id`)
    REFERENCES `mydb`.`medicos` (`id`)
    ON DELETE RESTRICT
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`paciente_receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`paciente_receita` (
  `receita_id` INT NOT NULL,
  `pacientes_id` INT NOT NULL,
  PRIMARY KEY (`receita_id`, `pacientes_id`),
  INDEX `fk_receita_has_pacientes_pacientes1_idx` (`pacientes_id`),
  INDEX `fk_receita_has_pacientes_receita1_idx` (`receita_id`),
  CONSTRAINT `fk_receita_has_pacientes_receita1`
    FOREIGN KEY (`receita_id`)
    REFERENCES `mydb`.`receita` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_receita_has_pacientes_pacientes1`
    FOREIGN KEY (`pacientes_id`)
    REFERENCES `mydb`.`pacientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`medico_receita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medico_receita` (
  `receita_id` INT NOT NULL,
  `medicos_id` INT NOT NULL,
  PRIMARY KEY (`receita_id`, `medicos_id`),
  INDEX `fk_receita_has_medicos_medicos1_idx` (`medicos_id`),
  INDEX `fk_receita_has_medicos_receita1_idx` (`receita_id`),
  CONSTRAINT `fk_receita_has_medicos_receita1`
    FOREIGN KEY (`receita_id`)
    REFERENCES `mydb`.`receita` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_receita_has_medicos_medicos1`
    FOREIGN KEY (`medicos_id`)
    REFERENCES `mydb`.`medicos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `mydb`.`internacao_enfermeiro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`internacao_enfermeiro` (
  `internacao_id` INT NOT NULL,
  `internacao_quartos_id` INT NOT NULL,
  `internacao_quartos_tipo_quarto_id` INT NOT NULL,
  `enfermeiro_id` INT NOT NULL,
  PRIMARY KEY (`internacao_id`, `internacao_quartos_id`, `internacao_quartos_tipo_quarto_id`, `enfermeiro_id`),
  INDEX `fk_internacao_has_enfermeiro_enfermeiro1_idx` (`enfermeiro_id`),
  INDEX `fk_internacao_has_enfermeiro_internacao1_idx` (`internacao_id`, `internacao_quartos_id`, `internacao_quartos_tipo_quarto_id`),
  CONSTRAINT `fk_internacao_has_enfermeiro_internacao1`
    FOREIGN KEY (`internacao_id`, `internacao_quartos_id`, `internacao_quartos_tipo_quarto_id`)
    REFERENCES `mydb`.`internacao` (`id`, `quartos_id`, `quartos_tipo_quarto_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_internacao_has_enfermeiro_enfermeiro1`
    FOREIGN KEY (`enfermeiro_id`)
    REFERENCES `mydb`.`enfermeiro` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
```
