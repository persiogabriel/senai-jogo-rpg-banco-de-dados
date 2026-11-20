-- Atividade de entrega - Banco de Dados (T01 RN 2026/2)
-- Projeto: Jogo de RPG online
-- Script de criacao do banco de dados e das tabelas (DDL - SQL Server)
-- Estrutura conforme o diagrama fornecido na atividade (diagrama_jogo_RPG)
-- Autor: Persio G. R. G. Costa

-- 1. Criacao do banco de dados do projeto
CREATE DATABASE JogoRPG;
GO

-- 2. Selecao do banco de dados criado
USE JogoRPG;
GO

-- 3. Criacao das tabelas
-- Primeiro as tabelas sem chave estrangeira (menos dependentes)

-- Tabela USUARIOS: jogadores cadastrados no jogo
CREATE TABLE USUARIOS
(
    UsuarioId INT PRIMARY KEY IDENTITY
    ,Email VARCHAR(120) NOT NULL UNIQUE
    ,Senha VARCHAR(120) NOT NULL
);
GO

-- Tabela CLASSES: classes disponiveis para os personagens
CREATE TABLE CLASSES
(
    ClasseId INT PRIMARY KEY IDENTITY
    ,Nome VARCHAR(120) NOT NULL
    ,Descricao VARCHAR(255)
);
GO

-- Tabela HABILIDADES: habilidades que as classes podem ter
CREATE TABLE HABILIDADES
(
    HabilidadeId INT PRIMARY KEY IDENTITY
    ,Nome VARCHAR(120) NOT NULL
);
GO

-- Tabela PERSONAGENS: cada personagem pertence a um usuario e a uma classe
-- Relacionamentos: USUARIOS 1:N PERSONAGENS e CLASSES 1:N PERSONAGENS
CREATE TABLE PERSONAGENS
(
    PersonagemId INT PRIMARY KEY IDENTITY
    ,NomePersonagem VARCHAR(120) NOT NULL
    ,UsuarioId INT NOT NULL FOREIGN KEY REFERENCES USUARIOS(UsuarioId)
    ,ClasseId INT NOT NULL FOREIGN KEY REFERENCES CLASSES(ClasseId)
);
GO

-- Tabela CLASSES_HABILIDADES: resolve o relacionamento N:N entre
-- CLASSES e HABILIDADES; a chave primaria e composta pelas duas chaves
CREATE TABLE CLASSES_HABILIDADES
(
    ClasseId INT NOT NULL FOREIGN KEY REFERENCES CLASSES(ClasseId)
    ,HabilidadeId INT NOT NULL FOREIGN KEY REFERENCES HABILIDADES(HabilidadeId)
    ,PRIMARY KEY (ClasseId, HabilidadeId)
);
GO
