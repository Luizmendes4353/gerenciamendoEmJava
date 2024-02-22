CREATE DATABASE estoque;

USE estoque;

CREATE TABLE produto (
  id INT PRIMARY KEY,
  descricao VARCHAR(50) NOT NULL,
  categoria VARCHAR(20) NOT NULL,
  preco DECIMAL(10,2) NOT NULL,
  estoque_minimo INT NOT NULL,
  estoque_maximo INT NOT NULL
);

CREATE TABLE fornecedor (
  id INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL,
  cnpj VARCHAR(14) UNIQUE NOT NULL,
  telefone VARCHAR(15) NOT NULL,
  email VARCHAR(50) NOT NULL
);

CREATE TABLE entrada_produto (
  id INT PRIMARY KEY,
  id_produto INT NOT NULL,
  id_fornecedor INT NOT NULL,
  quantidade INT NOT NULL,
  valor_unitario DECIMAL(10,2) NOT NULL,
  data_entrada DATE NOT NULL,
  FOREIGN KEY (id_produto) REFERENCES produto(id),
  FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id)
);

CREATE TABLE saida_produto (
  id INT PRIMARY KEY,
  id_produto INT NOT NULL,
  quantidade INT NOT NULL,
  valor_unitario DECIMAL(10,2) NOT NULL,
  data_saida DATE NOT NULL,
  FOREIGN KEY (id_produto) REFERENCES produto(id)
);

INSERT INTO produto (id, descricao, categoria, preco, estoque_minimo, estoque_maximo) VALUES
(1, 'Arroz', 'Alimentos', 5.99, 10, 50),
(2, 'Feijão', 'Alimentos', 4.99, 15, 40),
(3, 'Sabão', 'Limpeza', 2.99, 20, 60);

INSERT INTO fornecedor (id, nome, cnpj, telefone, email) VALUES
(1, 'Fornecedor A', '12345678000100', '(31) 99999-9999', 'fornecedorA@email.com'),
(2, 'Fornecedor B', '98765432000100', '(31) 88888-8888', 'fornecedorB@email.com');

INSERT INTO entrada_produto (id, id_produto, id_fornecedor, quantidade, valor_unitario, data_entrada) VALUES
(1, 1, 1, 100, 5.50, '2021-01-01'),
(2, 2, 1, 150, 4.50, '2021-01-02'),
(3, 3, 2, 200, 2.80, '2021-01-03');

INSERT INTO saida_produto (id, id_produto, quantidade, valor_unitario, data_saida) VALUES
(1, 1, 20, 6.00, '2021-01-04'),
(2, 2, 30, 5.00, '2021-01-05'),
(3, 3, 40, 3.00, '2021-01-06');
