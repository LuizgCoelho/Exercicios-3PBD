CREATE DATABASE falls_car;
USE falls_car;

CREATE TABLE Grupo_carro (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    descricao TEXT
);

CREATE TABLE Agencias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(255)
);

CREATE TABLE Horarios (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_agencia INT,
    hora_inicio TIME,
    hora_fim TIME,
    dia_semana VARCHAR(10),
    FOREIGN KEY (id_agencia) REFERENCES Agencias(id)
);

CREATE TABLE Pessoa_juridica (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_cliente INT,
    nome_empresa VARCHAR(150) NOT NULL,
    cnpj VARCHAR(14) UNIQUE NOT NULL,
    telefone_comercial VARCHAR(20),
    registro_estadual VARCHAR(50),
    FOREIGN KEY (id_cliente) REFERENCES Usuario(id)
);

CREATE TABLE Usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    email VARCHAR(100) UNIQUE,
    genero VARCHAR(20),
    nacionalidade VARCHAR(50),
    tem_cnh BOOLEAN DEFAULT FALSE,
    cpf VARCHAR(11) UNIQUE NOT NULL
);

CREATE TABLE Funcionario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(10, 2),
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    funcao VARCHAR(50),
    id_agencia INT,
    FOREIGN KEY (id_agencia) REFERENCES Agencias(id)
);

CREATE TABLE Veiculo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_agencia INT, 
    id_grupo_carro INT NOT NULL,
    placa VARCHAR(7) UNIQUE NOT NULL,
    marca VARCHAR(50),
    modelo VARCHAR(50),
    diaria DECIMAL(10, 2),
    especificacoes TEXT,
    km INT,
    tipo VARCHAR(50),
    status VARCHAR(50), 
    FOREIGN KEY (id_agencia) REFERENCES Agencias(id),
    FOREIGN KEY (id_grupo_carro) REFERENCES Grupo_carro(id)
);

CREATE TABLE Checklist (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_veiculo INT,
    id_funcionario INT,
    tem_seguro BOOLEAN DEFAULT FALSE, 
    data_checklist DATETIME,
    observacoes TEXT,
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id),
    FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id)
);

CREATE TABLE Agendamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_grupo_carro INT NOT NULL,
    id_agencia_retirada INT NOT NULL,
    id_agencia_devolucao INT NOT NULL,
    retirada DATETIME NOT NULL,
    devolucao DATETIME NOT NULL,
    status VARCHAR(50), 
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id),
    FOREIGN KEY (id_grupo_carro) REFERENCES Grupo_carro(id),
    FOREIGN KEY (id_agencia_retirada) REFERENCES Agencias(id),
    FOREIGN KEY (id_agencia_devolucao) REFERENCES Agencias(id),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id)
);

CREATE TABLE Contrato (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_agendamento INT UNIQUE, 
    id_veiculo INT NOT NULL,
    id_func_motorista INT, 
    termos VARCHAR(50),
    status VARCHAR(50),
    periodo INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    FOREIGN KEY (id_agendamento) REFERENCES Agendamento(id),
    FOREIGN KEY (id_veiculo) REFERENCES Veiculo(id),
    FOREIGN KEY (id_func_motorista) REFERENCES Funcionario(id)
);

CREATE TABLE Pagamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    id_contrato INT UNIQUE NOT NULL, 
    forma VARCHAR(50) NOT NULL, 
    data DATETIME,
    status VARCHAR(50), 
    valor DECIMAL(10, 2) NOT NULL,
    nota_fiscal VARCHAR(100),
    FOREIGN KEY (id_contrato) REFERENCES Contrato(id)
);

CREATE TABLE Relatorio (
    id INT PRIMARY KEY AUTO_INCREMENT,
    observacoes TEXT,
    data_criacao DATETIME
);
