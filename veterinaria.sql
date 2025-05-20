CREATE DATABASE IF NOT EXISTS clinica_veterinaria;
USE clinica_veterinaria;

CREATE TABLE Veterinario (
    CRV CHAR(6) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(200) NOT NULL,
    Celular VARCHAR(9),
    CPF CHAR(11) NOT NULL UNIQUE
);

CREATE TABLE Cliente (
    CPF CHAR(11) PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Endereco VARCHAR(200) NOT NULL,
    Telefone VARCHAR(15) NOT NULL,
    Celular VARCHAR(10) NOT NULL
);

CREATE TABLE Animal (
    Animal_ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(50),
    Tipo VARCHAR(50) NOT NULL,
    Raca VARCHAR(50),
    Idade INT,
    Alergico BOOLEAN NOT NULL,
    CPF_Cliente CHAR(11) NOT NULL,
    FOREIGN KEY (CPF_Cliente) REFERENCES Cliente(CPF)
);

CREATE TABLE Animal_Herbivoro (
    ID_Animal INT PRIMARY KEY,
    Peso DECIMAL(6,2) NOT NULL,
    Altura DECIMAL(4,2) NOT NULL,
    FOREIGN KEY (Animal_ID) REFERENCES Animal(Animal_ID) ON DELETE CASCADE
);

CREATE TABLE Consulta (
    ID_Consulta INT AUTO_INCREMENT PRIMARY KEY,
    DataHora DATETIME NOT NULL,
    Valor DECIMAL(7,2) NOT NULL,
    Diagnostico TEXT NOT NULL,
    CRV_Veterinario CHAR(6) NOT NULL,
    Animal_ID INT NOT NULL,
    FOREIGN KEY (CRV_Veterinario) REFERENCES Veterinario(CRV),
    FOREIGN KEY (Animal_ID) REFERENCES Animal(Animal_ID)
);
