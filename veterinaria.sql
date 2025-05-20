CREATE DATABASE IF NOT EXISTS clinica_veterinaria;
USE clinica_veterinaria;

-- Tabela: Veterinario
CREATE TABLE Veterinario (
    Veterinario_CRV CHAR(6) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(200) NOT NULL,
    Celular VARCHAR(9),
    CPF CHAR(11) NOT NULL UNIQUE
);

-- Tabela: Cliente
CREATE TABLE Cliente (
    Cliente_CPF CHAR(11) PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Endereco VARCHAR(200) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    Celular VARCHAR(10) NOT NULL
);

-- Tabela: Animal (com especialização embutida)
CREATE TABLE Animal (
    Animal_ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50),
    Tipo VARCHAR(50) NOT NULL,
    Raca VARCHAR(50),
    Idade INT,
    Alergico BOOLEAN NOT NULL,
    Dieta ENUM('HERBIVORO', 'CARNIVORO', 'ONIVORO') NOT NULL,
    Peso DECIMAL(6,2) NOT NULL,
    Altura DECIMAL(4,2) NOT NULL,
    Cliente_CPF CHAR(11) NOT NULL,
    FOREIGN KEY (Cliente_CPF) REFERENCES Cliente(Cliente_CPF)
);

-- Tabela: Consulta
CREATE TABLE Consulta (
    Consulta_ID INT AUTO_INCREMENT PRIMARY KEY,
    DataHora DATETIME NOT NULL,
    Valor DECIMAL(7,2) NOT NULL,
    Diagnostico TEXT NOT NULL,
    Veterinario_CRV CHAR(6) NOT NULL,
    Animal_ID INT NOT NULL,
    FOREIGN KEY (Veterinario_CRV) REFERENCES Veterinario(Veterinario_CRV),
    FOREIGN KEY (Animal_ID) REFERENCES Animal(Animal_ID)
);
