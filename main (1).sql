/---Criando Banco de Dados Sistema de Gestao Escolar---/
CREATE DATABASE sys_escolar;

USE sys_escolar;

/Criando tabela para curso

CREATE TABLE CURSO(
id_curso int auto_increment primary key,
    nome_curso VARCHAR(50),
    valor_curso FLOAT/
    ADD na linha 55-57
    );

/Ciando tabela para os alunos/

ATLER TABLE ALUNOS 
ADD CONSTRAINT FK_alunos_curso
foreing key (id_curso) references curso (id_curso);

/*criando a segunda tabela*/
creat tabela cursos (
    id_curso int auto_increment primary key,
    nome_curso varchar(75),
    carga_horaria int,
    disciplina varchar(75),
    horarios datetime
    ); 

/*Adicionando coluna na segunda tabela*/
alter table Cursos 
ADD column preco DECIMAL(10,2);

/*INSERINDO VALORES NAS TABELAS*/
