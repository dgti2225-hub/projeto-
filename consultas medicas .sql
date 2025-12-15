/*--- Criando o Banco de Dados ---*/
        CRIAR BANCO DE DADOS clinica_medica;

        USE clinica_medica;

        /*--- Criando as Tabelas ---*/


        /*Criando tabela para os Médicos*/

        CRIAR TABELA MÉDICO(
                crm INT PRIMARY KEY,
                nome VARCHAR(100) NOT NULL,
                email VARCHAR(100) NOT NULL,
                telefone VARCHAR(25) ÚNICO,
                especialidade VARCHAR(50) CHECK (especialidade em ('Cardiologista', 'Nutricionista', 'Odontologista'))
                );


        /*Criando tabela para os pacientes*/

        CRIAR TABELA PACIENTE(
                identidade INT PRIMARY KEY,
                nome VARCHAR(100) NOT NULL,
                endereco VARCHAR(100) NOT NULL,
                telefone VARCHAR(25) ÚNICO
        );


        /*Criando tabela para as Consultas*/

        CRIAR TABELA CONSULTA(
                num_consulta VARCHAR(50) CHAVE PRIMÁRIA,
                nome_paciente VARCHAR(100) NOT NULL,
                ident_paciente INT NOT NULL,
                nome_medico VARCHAR(100) NÃO NULO,
                tipo_exame VARCHAR(50) CHECK (tipo_exame in ('Cardiologia', 'Nutricionista', 'Odontologia', 'Neurologia', 'Fisioterapia')),
                chave estrangeira(ident_paciente)
                        referências PACIENTE(identidade)
                );


        /*Criando tabela para os Exames*/

        CRIAR TABELA EXAME(
                codigo_exame VARCHAR(50) CHAVE PRIMÁRIA,
                nome_exame VARCHAR(50) NÃO NULO,
                nome_paciente VARCHAR(100) NOT NULL,
                crm_medico INT NÃO NULO,
                data_exame VARCHAR(20) NOT NULL,
                chave estrangeira(crm_medico)
                        referências MEDICO(crm)
        );


        /*Criando registros/informações para as tabelas*/


        /*Criando registro para os Médicos*/

        INSERIR NO MEDICO
        (crm, nome, email, telefone, especialidade)
        VALORES
        (111111, 'João', ' joao@gmail.com ', '(83)0000-0000', 'Cardiologista'),
        (222222, 'Matheus', ' matheus@gmail.com ', '(83)1111-1111', 'Odontologista'),
        (333333, 'Marcos', ' marcos@gmail.com ', '(83)2222-2222', 'Nutricionista');


        /*Criando registro para os pacientes*/

        INSERIR NO PACIENTE
        (identidade, nome, endereco, telefone)
        VALORES
        (777777, 'Ruth', 'Rua Rodrigues Alves', '(83)5555-5555'), /*Telefone alterado na linha 105-107*/
        (888888, 'Amós', 'Rua Alfredo Ribeiro', '(83)6666-6666'),
        (999999, 'Ester', 'Rua Dantas Mário', '(83)7777-7777'),
        (101010, 'Habacuque', 'Rua Kleber João', '(83)8888-8888'), /*Paciente removido na linha 101-103*/
        (121212, 'Moisés', 'Rua Brasília Velha', '(83)9999-9999');


        /*Criando registro para as Consultas*/

        INSERIR EM CONSULTA
        (num_consulta, nome_paciente, ident_paciente, nome_médico, tipo_exame)
        VALORES
        ('C-0000', 'Rute', 777777, 'João', 'Cardiologia'),
        ('C-1111', 'Amós', 888888, 'Matheus', 'Odontologia'),
        ('C-2222', 'Ester', 999999, 'Marcos', 'Nutricionista'),
        ('C-3333', 'Habacuque', 101010, 'João','Cardiologia'); /*Paciente removido da consulta na linha 97-99*/

    INSERIR NO EXAME
    (codigo_exame, nome_exame, nome_paciente, crm_medico, dados_exame)
    VALORES
    ('E01', 'Cardiologia', 'Rute', 111111, '28/12/2025');


        /*Remover a Consulta onde a identidade do paciente é 101010*/
        EXCLUIR DA CONSULTA
        ONDE ident_paciente = 101010;

        /*Remover dos Pacientes onde a identidade é 101010*/
        EXCLUIR DO PACIENTE
        ONDE identidade = 101010;

        /*Atualizar Pacientes definindo telefone : "novo_telefone" onde a identidade para 777777*/
        UPDATE PACIENTE SET telefone = '(83)1515-1515'
        ONDE identidade = 777777;

        /*Selecione todas as colunas dos Pacientes*/
        SELECIONE *
        DE PACIENTE;

        /*Selecione nome e especialidade dos Médicos*/
        SELECIONE nome, especialidade
        DO MÉDICO;

        /*Selecione o número das consultas das Consultas*/
        SELECIONE num_consulta
        DA CONSULTA;

        /*Selecione o tipo de exame das Consultas onde o tipo de exame para Cardiologia*/
        SELECT nome_paciente, tipo_exame
        DA CONSULTA
        WHERE tipo_exame = 'Cardiologia';

        /*Selecione nome e especialidade dos Médicos onde especialidade para Cardiologia*/
        SELECIONE nome, especialidade
        DO MÉDICO
        WHERE especialidade = 'Cardiologista';

        /*Selecione contando quantos nomes tem em Pacientes*/
        SELECT COUNT(*) AS nome
        DE PACIENTE;

        /*Selecione a menor data dos exames na tabela de Exames;*/
        SELECIONE MIN(exame_dados) AS exame_dados
        DO EXAME;

        /*Selecione o nome dos Pacientes e ordene em ordem Crescente/Ascendente*/
        SELECIONE o nome
        DO PACIENTE
        ORDENAR POR nome ASC;

        /*Seleciona nome dos médicos e conta todo o total de consultas da tabela CONSULTA
    agrupando pelo nome dos médicos*/
        SELECT nome_medico, COUNT(*) AS total_consulta
        DA CONSULTA
        AGRUPAR POR nome_médico;

    /*Consulta nome e dados dos exames*/
    SELECIONE nome, data_exame
    DO PACIENTE
    EXAME DE JUNÇÃO INTERNA
    ON PACIENTE.nome = EXAME.nome_paciente;


    /*Seleciona nome e especialidade dos médicos, nome dos pacientes e tipo de exame das tabelas
    CONSULTA, PACIENTE E MÉDICO*/
    SELECIONAR
    MEDICO.nome AS nome_medico,
    MÉDICO.especialidade,
    PACIENTE.nome AS nome_paciente,
    CONSULTA.tipo_exame
    DA CONSULTA
        JUNTE-SE AO PACIENTE INTERNO
    ON CONSULTA.ident_paciente = PACIENTE.identidade
        INNER JUIN MEDICO
    ON CONSULTA.nome_medico = MEDICO.nome;


    /*Seleciona o nome, o número total das consultas e os dados da tabela CONSULTA
    incluindo a tabela EXAME mostrando também quem não fez consulta (NULL)*/
    SELECIONAR
        CONSULTA.nome_medico,
    COUNT(CONSULTA.num_consulta) AS total_consulta,
    MIN(EXAME.dados_exame) AS dados_exame
    DA CONSULTA
    EXAME DE JUNÇÃO À ESQUERDA
    ON CONSULTA.nome_paciente = EXAME.nome_paciente
    GRUPO POR CONSULTA.nome_medico;