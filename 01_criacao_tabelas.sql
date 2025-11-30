-- =====================
-- Base de dados comercial
-- =====================\

CREATE DATABASE IF NOT EXISTS comercial;
USE comercial;

-- =====================
-- Tabela Cliente
-- =====================
CREATE TABLE Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    CPF_CNPJ VARCHAR(20),
    Telefone VARCHAR(20),
    Email VARCHAR(150),
    Categoria VARCHAR(50),
    Dados_Adicionais JSON
) ENGINE=InnoDB;

-- =====================
-- Tabela Vendedor
-- =====================
CREATE TABLE Vendedor (
    ID_Vendedor INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    Email VARCHAR(150),
    Telefone VARCHAR(20),
    Area_Atuacao VARCHAR(100)
) ENGINE=InnoDB;

-- =====================
-- Tabela Produto
-- =====================
CREATE TABLE Produto (
    ID_Produto INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(150) NOT NULL,
    Descricao TEXT,
    Preco_Base DECIMAL(10,2) NOT NULL
) ENGINE=InnoDB;

-- =====================
-- Tabela Venda
-- =====================
CREATE TABLE Venda (
    ID_Venda INT AUTO_INCREMENT PRIMARY KEY,
    Data_Venda DATE NOT NULL,
    Quantidade INT NOT NULL,
    Preco_Unidade DECIMAL(10,2) NOT NULL,
    Preco_Total DECIMAL(12,2) NOT NULL,
    Observacoes TEXT,
    ID_Cliente INT NOT NULL,
    ID_Vendedor INT NOT NULL,
    ID_Produto INT NOT NULL,

    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente),
    FOREIGN KEY (ID_Vendedor) REFERENCES Vendedor(ID_Vendedor),
    FOREIGN KEY (ID_Produto) REFERENCES Produto(ID_Produto)
) ENGINE=InnoDB;

-- =====================
-- Tabela STAGING (Ingestão externa)
-- =====================
CREATE TABLE Staging_Vendas (
    ID_Staging INT AUTO_INCREMENT PRIMARY KEY,
    Conteudo_Arquivo LONGTEXT,
    Origem VARCHAR(150),
    Data_Ingestao DATETIME DEFAULT CURRENT_TIMESTAMP,
    Status_Carga VARCHAR(50)
) ENGINE=InnoDB;
