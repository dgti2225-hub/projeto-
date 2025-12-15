/*--- Criando Banco de Dados Sistema de Gestão Escolar ---*/
CREATE DATABASE sys_escolar;

USE sys_escolar;

/*Criando tabela para os Cursos*/

CREATE TABLE CURSO(
id_curso INT PRIMARY KEY,
nome_curso VARCHAR(50),
valor_curso FLOAT /*Adicionado na linha 55-57*/
);


/*Criando tabela para os Alunos*/

CREATE TABLE ALUNO(
id_aluno INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100),
data_nascimento DATE,
id_curso INT, /*Adicionado na linha 27-29*/
FOREIGN KEY (id_curso)
        references CURSO(id_curso)
);


/*Altere a tabela Aluno adicionando uma coluna id_curso como INTEIRO*/
ALTER TABLE ALUNO
ADD COLUMN id_curso INT;


/*Insira informações na tabela Aluno
(Informações a serem preenchidas)
Valores
(Informações preenchidas)*/

INSERT INTO ALUNO
(nome, data_nascimento, id_curso)
VALUES
('Carlos Souza', '2000-10-12', 1), /*Deletado na linha 65-67*/
('Mario Alves', '1997-07-02', 2),
('Bianca Flores', '1998-06-05', 1),
('Val_Gonçalvez', '2002-05-28', 2);


/*Insira informações na tabela Curso*/

INSERT INTO CURSO
(id_curso, nome_curso, valor_curso)
VALUES
(1,'TECNICO EM INFORMATICA', 1200),
(2, 'DESENVOLVIMENTO WEB', 1500); /*Valor do curso alterado na linha 60-62*/


/*Altera a tabela Curso adicionando uma coluna valor_curso como FLOAT*/
ALTER TABLE CURSO
ADD COLUMN valor_curso FLOAT;


/*Atualiza o Curso definindo valor_curso 2000 onde id do curso for 2*/
UPDATE CURSO SET valor_curso = 2000
WHERE id_curso = 2;


/*Remova um Aluno onde id do aluno for 01*/
DELETE FROM ALUNO
WHERE id_aluno = 01;

/*Seleciona nome do aluno e nome do curso através das tabelas ALUNO e CURSO*/
SELECT
ALUNO.nome,
CURSO.nome_curso
FROM ALUNO
INNER JOIN CURSO
ON ALUNO.id_curso = CURSO.id_curso;