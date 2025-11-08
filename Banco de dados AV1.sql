CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    data_nascimento DATE,
    cpf VARCHAR(14) UNIQUE,
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20),
    senha VARCHAR(255) NOT NULL,
    credito DECIMAL(10, 2) DEFAULT 0.00
);

CREATE TABLE especialidade (
    id_especialidade INT PRIMARY KEY AUTO_INCREMENT,
    nome_especialidade VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE profissional (
    id_profissional INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    status VARCHAR(50),
    email VARCHAR(255) UNIQUE NOT NULL,
    telefone VARCHAR(20)
);

CREATE TABLE pacote (
    id_pacote INT PRIMARY KEY AUTO_INCREMENT,
    nome_pacote VARCHAR(150) NOT NULL,
    descricao TEXT,
    valor DECIMAL(10, 2) NOT NULL,
    tipo VARCHAR(50)
);

CREATE TABLE servico (
    id_servico INT PRIMARY KEY AUTO_INCREMENT,
    id_especialidade INT,
    nome_servico VARCHAR(150) NOT NULL,
    descricao TEXT,
    duracao TIME,
    preco DECIMAL(10, 2) NOT NULL,
    tipo VARCHAR(50),
    status VARCHAR(50),
    FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade)
);

CREATE TABLE contrato (
    id_contrato INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    valor_total DECIMAL(10, 2) NOT NULL,
    data_inicio DATE NOT NULL,
    status VARCHAR(50),
    credito_utilizado DECIMAL(10, 2) DEFAULT 0.00,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente)
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_contrato INT NOT NULL,
    status VARCHAR(50),
    valor DECIMAL(10, 2) NOT NULL,
    data_pagamento DATE NOT NULL,
    nota_fiscal VARCHAR(255),
    metodo VARCHAR(50),
    FOREIGN KEY (id_contrato) REFERENCES contrato(id_contrato)
);

CREATE TABLE agendamento (
    id_agendamento INT PRIMARY KEY AUTO_INCREMENT,
    id_profissional INT NOT NULL,
    id_cliente INT NOT NULL,
    data DATE NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    id_servico INT NOT NULL,
    status VARCHAR(50),
    valor_servico DECIMAL(10, 2),
    id_contrato INT,
    FOREIGN KEY (id_profissional) REFERENCES profissional(id_profissional),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_servico) REFERENCES servico(id_servico),
    FOREIGN KEY (id_contrato) REFERENCES contrato(id_contrato)
);

CREATE TABLE fila_espera (
    id_fila INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_profissional INT NOT NULL,
    status VARCHAR(50),
    hora_entrada DATETIME NOT NULL,
    id_servico INT NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_profissional) REFERENCES profissional(id_profissional),
    FOREIGN KEY (id_servico) REFERENCES servico(id_servico)
);

CREATE TABLE expediente_profissional (
    id_expediente INT PRIMARY KEY AUTO_INCREMENT,
    id_profissional INT NOT NULL,
    dia INT NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fim TIME NOT NULL,
    FOREIGN KEY (id_profissional) REFERENCES profissional(id_profissional)
);

CREATE TABLE profissional_especialidade (
    id_profissional_especialidade INT PRIMARY KEY AUTO_INCREMENT,
    id_profissional INT NOT NULL,
    id_especialidade INT NOT NULL,
    FOREIGN KEY (id_profissional) REFERENCES profissional(id_profissional),
    FOREIGN KEY (id_especialidade) REFERENCES especialidade(id_especialidade),
    UNIQUE (id_profissional, id_especialidade)
);

CREATE TABLE pacote_servico (
    id_pacote_servico INT PRIMARY KEY AUTO_INCREMENT,
    id_pacote INT NOT NULL,
    id_servico INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (id_pacote) REFERENCES pacote(id_pacote),
    FOREIGN KEY (id_servico) REFERENCES servico(id_servico)
);
