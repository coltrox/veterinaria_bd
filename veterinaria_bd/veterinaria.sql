CREATE DATABASE IF NOT EXISTS clinica_veterinaria;
USE clinica_veterinaria;

CREATE TABLE Veterinario (
    Veterinario_CRV CHAR(6) PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(200) NOT NULL,
    Celular VARCHAR(9),
    CPF CHAR(11) NOT NULL UNIQUE
);

CREATE TABLE Cliente (
    Cliente_CPF CHAR(11) PRIMARY KEY,
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
    Dieta ENUM('HERBIVORO', 'CARNIVORO', 'ONIVORO') NOT NULL,
    Peso DECIMAL(6,2) NOT NULL,
    Altura DECIMAL(4,2) NOT NULL,
    Cliente_CPF CHAR(11) NOT NULL,
    FOREIGN KEY (Cliente_CPF) REFERENCES Cliente(Cliente_CPF)
);

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

INSERT INTO Veterinario (Veterinario_CRV, Nome, Endereco, Celular, CPF) VALUES
('CRV001', 'Dr. Carlos Silva', 'Rua das Flores, 123, Centro', '991234567', '39053344705'),
('CRV002', 'Dra. Ana Paula Souza', 'Av. Brasil, 456, Jardim America', '992345678', '85463433020'),
('CRV003', 'Dr. Roberto Lima', 'Rua Bela Vista, 789, Centro', '993456789', '28613054030');

INSERT INTO Cliente (Cliente_CPF, Nome, Endereco, Telefone, Celular) VALUES
('53689145002', 'Joao Pereira', 'Rua A, 50, Centro', '1935151234', '991112345'),
('04474421052', 'Maria Oliveira', 'Av. B, 120, Jardim das Rosas', '1935262345', '992223456'),
('40113815030', 'Carlos Souza', 'Rua C, 33, Centro', '1935373456', '993334567'),
('58021257030', 'Fernanda Lima', 'Rua D, 77, Bairro Alto', '1935484567', '994445678'),
('05222839002', 'Roberto Alves', 'Rua E, 88, Bairro Novo', '1935595678', '995556789'),
('04621167001', 'Patricia Mendes', 'Av. F, 99, Vila Verde', '1935706789', '996667890'),
('46827018009', 'Ricardo Ramos', 'Rua G, 11, Centro', '1935817890', '997778901'),
('01886054001', 'Luciana Silva', 'Rua H, 22, Bairro Sul', '1935928901', '998889012'),
('24164282080', 'Bruno Castro', 'Rua I, 33, Jardim Norte', '1935039012', '999990123'),
('05663443003', 'Isabela Martins', 'Av. J, 44, Bairro Oeste', '1935140123', '991001234'),
('21710054003', 'Daniela Costa', 'Rua K, 55, Centro', '1935251234', '992112345'),
('19610760009', 'Gustavo Araujo', 'Rua L, 66, Bairro Central', '1935362345', '993223456'),
('00736036088', 'Mariana Lopes', 'Rua M, 77, Jardim Leste', '1935473456', '994334567'),
('41702941006', 'Eduardo Pires', 'Av. N, 88, Vila Sul', '1935584567', '995445678'),
('08078554002', 'Camila Rocha', 'Rua O, 99, Bairro Norte', '1935695678', '996556789');

INSERT INTO Animal (Nome, Tipo, Raca, Idade, Alergico, Dieta, Peso, Altura, Cliente_CPF) VALUES
('Rex', 'Cachorro', 'Pastor Alemao', 5, FALSE, 'CARNIVORO', 35.50, 0.65, '53689145002'),
('Mimi', 'Gato', 'Persa', 3, TRUE, 'CARNIVORO', 4.20, 0.25, '04474421052'),
('Thor', 'Cachorro', 'Rottweiler', 4, FALSE, 'CARNIVORO', 45.00, 0.70, '40113815030'),
('Luna', 'Gato', 'Siames', 2, FALSE, 'CARNIVORO', 3.80, 0.24, '58021257030'),
('Max', 'Cachorro', 'Husky Siberiano', 6, TRUE, 'CARNIVORO', 28.40, 0.60, '05222839002');

INSERT INTO Animal (Nome, Tipo, Raca, Idade, Alergico, Dieta, Peso, Altura, Cliente_CPF) VALUES
('Lola', 'Coelho', 'Angora', 2, FALSE, 'HERBIVORO', 2.50, 0.30, '04621167001'),
('Bella', 'Cavalo', 'Mangalarga', 7, FALSE, 'HERBIVORO', 450.00, 1.60, '46827018009'),
('Nino', 'Porquinho-da-india', 'Abyssinian', 1, FALSE, 'HERBIVORO', 1.20, 0.15, '01886054001'),
('Tobias', 'Coelho', 'Gigante de Flandres', 3, TRUE, 'HERBIVORO', 6.50, 0.50, '24164282080'),
('Perola', 'Cavalo', 'Quarto de Milha', 8, FALSE, 'HERBIVORO', 500.00, 1.65, '05663443003');

INSERT INTO Animal (Nome, Tipo, Raca, Idade, Alergico, Dieta, Peso, Altura, Cliente_CPF) VALUES
('Tico', 'Papagaio', 'Amazona', 4, FALSE, 'ONIVORO', 0.90, 0.40, '21710054003'),
('Kiko', 'Porco', 'Mini Pig', 3, TRUE, 'ONIVORO', 50.00, 0.50, '19610760009'),
('Zazu', 'Ave', 'Maina', 2, FALSE, 'ONIVORO', 0.35, 0.30, '00736036088'),
('Lili', 'Urso', 'Urso Pardo', 5, FALSE, 'ONIVORO', 90.00, 0.90, '41702941006'),
('Pingo', 'Porco', 'Mini Pig', 2, FALSE, 'ONIVORO', 45.00, 0.48, '08078554002');

INSERT INTO Consulta (DataHora, Valor, Diagnostico, Veterinario_CRV, Animal_ID) VALUES
('2025-05-10 09:00:00', 150.00, 'Vacinacao e check-up.', 'CRV001', 1),
('2025-05-10 10:00:00', 180.00, 'Tratamento de alergia.', 'CRV002', 2),
('2025-05-10 11:00:00', 200.00, 'Raio-X para avaliar dor.', 'CRV003', 3),
('2025-05-11 09:00:00', 120.00, 'Consulta de rotina.', 'CRV001', 4),
('2025-05-11 10:00:00', 190.00, 'Check-up geral.', 'CRV002', 5),
('2025-05-12 09:00:00', 150.00, 'Avaliacao dentaria.', 'CRV003', 6),
('2025-05-12 10:00:00', 500.00, 'Exame fisico completo.', 'CRV001', 7),
('2025-05-12 11:00:00', 100.00, 'Consulta simples.', 'CRV002', 8),
('2025-05-13 09:00:00', 200.00, 'Check-up geral.', 'CRV003', 9),
('2025-05-13 10:00:00', 500.00, 'Exames laboratoriais.', 'CRV001', 10),
('2025-05-14 09:00:00', 120.00, 'Avaliacao respiratoria.', 'CRV002', 11),
('2025-05-14 10:00:00', 300.00, 'Cirurgia de pequeno porte.', 'CRV003', 12),
('2025-05-14 11:00:00', 250.00, 'Avaliacao comportamental.', 'CRV001', 13),
('2025-05-15 09:00:00', 100.00, 'Consulta geral.', 'CRV002', 14),
('2025-05-15 10:00:00', 150.00, 'Acompanhamento pos-cirurgico.', 'CRV003', 15);

ALTER TABLE Animal MODIFY COLUMN Alergico ENUM('Sim', 'Nao') NOT NULL;

UPDATE Animal SET Alergico = 'Sim' WHERE Alergico = TRUE;
UPDATE Animal SET Alergico = 'Nao' WHERE Alergico = FALSE;
