INSERT INTO Cliente (Id_Cliente, Nome, Sobrenome, Data_Nasc, Telefone, Email, CPF) 
VALUES (1, 'João', 'Silva', TO_DATE('1990-05-15', 'YYYY-MM-DD'), '11912345678', 'joao@email.com', '11122233344');
INSERT INTO Cliente (Id_Cliente, Nome, Sobrenome, Data_Nasc, Telefone, Email, CPF) 
VALUES (2, 'Maria', 'Oliveira', TO_DATE('1985-08-22', 'YYYY-MM-DD'), '11987654321', 'maria@email.com', '55566677788');
INSERT INTO Cliente (Id_Cliente, Nome, Sobrenome, Data_Nasc, Telefone, Email, CPF) 
VALUES (3, 'Carlos', 'Santos', TO_DATE('1998-01-10', 'YYYY-MM-DD'), '11999998888', 'carlos@email.com', '99988877766');
INSERT INTO Cliente (Id_Cliente, Nome, Sobrenome, Data_Nasc, Telefone, Email, CPF) 
VALUES (4, 'Fernanda', 'Costa', TO_DATE('1995-11-03', 'YYYY-MM-DD'), '11977776666', 'fernanda@email.com', '44455566677');
INSERT INTO Cliente (Id_Cliente, Nome, Sobrenome, Data_Nasc, Telefone, Email, CPF) 
VALUES (5, 'Roberto', 'Almeida', TO_DATE('1982-02-28', 'YYYY-MM-DD'), '11955554444', 'roberto@email.com', '12312312345');

INSERT INTO Funcionario (Id_Funcionario, Nome_Completo, Email, Salario) 
VALUES (1, 'Ana Clara', 'ana@assistencia.com', 3500.00);
INSERT INTO Funcionario (Id_Funcionario, Nome_Completo, Email, Salario) 
VALUES (2, 'Pedro Henrique', 'pedro@assistencia.com', 2800.00);
INSERT INTO Funcionario (Id_Funcionario, Nome_Completo, Email, Salario) 
VALUES (3, 'Lucas Martins', 'lucas@assistencia.com', 3200.00);

INSERT INTO Produto (Cod_Produto, Nome_Produto, Estoque, Preco) 
VALUES (101, 'Tela iPhone 13', 10, 450.00);
INSERT INTO Produto (Cod_Produto, Nome_Produto, Estoque, Preco) 
VALUES (102, 'Bateria Samsung S21', 15, 150.00);
INSERT INTO Produto (Cod_Produto, Nome_Produto, Estoque, Preco) 
VALUES (103, 'Teclado Mecânico', 20, 200.00);
INSERT INTO Produto (Cod_Produto, Nome_Produto, Estoque, Preco) 
VALUES (104, 'Mouse Gamer', 30, 120.00);
INSERT INTO Produto (Cod_Produto, Nome_Produto, Estoque, Preco) 
VALUES (105, 'SSD 1TB Kingston', 15, 350.00);
INSERT INTO Produto (Cod_Produto, Nome_Produto, Estoque, Preco) 
VALUES (106, 'Memória RAM 16GB', 20, 280.00);
INSERT INTO Produto (Cod_Produto, Nome_Produto, Estoque, Preco) 
VALUES (107, 'Película de Vidro', 50, 50.00);

INSERT INTO Dispositivo (Id_Dispositivo, Tipo, Modelo, Condicao, Id_Cliente) 
VALUES (1, 'Celular', 'iPhone 13', 'Tela trincada', 1);
INSERT INTO Dispositivo (Id_Dispositivo, Tipo, Modelo, Condicao, Id_Cliente) 
VALUES (2, 'Notebook', 'Dell Inspiron', 'Não liga', 2);
INSERT INTO Dispositivo (Id_Dispositivo, Tipo, Modelo, Condicao, Id_Cliente) 
VALUES (3, 'Computador', 'PC Gamer Custom', 'Lento e travando', 4);
INSERT INTO Dispositivo (Id_Dispositivo, Tipo, Modelo, Condicao, Id_Cliente) 
VALUES (4, 'Celular', 'Samsung Galaxy S21', 'Bateria viciada', 5);

INSERT INTO Chamado (Id_Chamado, Id_Cliente, Id_Dispositivo, Tipo_Servico, Descricao, Data_Inicio, Data_Termino, Status) 
VALUES (1, 1, 1, 'Conserto', 'Troca de tela do iPhone', TO_DATE('2026-06-15', 'YYYY-MM-DD'), NULL, 'Iniciado');
INSERT INTO Chamado (Id_Chamado, Id_Cliente, Id_Dispositivo, Tipo_Servico, Descricao, Data_Inicio, Data_Termino, Status) 
VALUES (2, 2, 2, 'Conserto', 'Avaliação de placa mãe', TO_DATE('2026-06-16', 'YYYY-MM-DD'), NULL, 'Não Iniciado');
INSERT INTO Chamado (Id_Chamado, Id_Cliente, Id_Dispositivo, Tipo_Servico, Descricao, Data_Inicio, Data_Termino, Status) 
VALUES (3, 3, NULL, 'Venda', 'Compra de periféricos', TO_DATE('2026-06-17', 'YYYY-MM-DD'), TO_DATE('2026-06-17', 'YYYY-MM-DD'), 'Terminado');
INSERT INTO Chamado (Id_Chamado, Id_Cliente, Id_Dispositivo, Tipo_Servico, Descricao, Data_Inicio, Data_Termino, Status) 
VALUES (4, 4, 3, 'Conserto', 'Upgrade de SSD e RAM', TO_DATE('2026-06-10', 'YYYY-MM-DD'), TO_DATE('2026-06-12', 'YYYY-MM-DD'), 'Terminado');
INSERT INTO Chamado (Id_Chamado, Id_Cliente, Id_Dispositivo, Tipo_Servico, Descricao, Data_Inicio, Data_Termino, Status) 
VALUES (5, 5, 4, 'Conserto', 'Troca de bateria', TO_DATE('2026-06-17', 'YYYY-MM-DD'), NULL, 'Não Iniciado');
INSERT INTO Chamado (Id_Chamado, Id_Cliente, Id_Dispositivo, Tipo_Servico, Descricao, Data_Inicio, Data_Termino, Status) 
VALUES (6, 1, 1, 'Venda', 'Compra e aplicação de película', TO_DATE('2026-06-17', 'YYYY-MM-DD'), TO_DATE('2026-06-17', 'YYYY-MM-DD'), 'Terminado');

INSERT INTO Itens_Chamado (Id_Chamado, Cod_Produto, Qtde_Vendida, Valor_Unitario) VALUES (1, 101, 1, 450.00);
INSERT INTO Itens_Chamado (Id_Chamado, Cod_Produto, Qtde_Vendida, Valor_Unitario) VALUES (3, 103, 1, 200.00);
INSERT INTO Itens_Chamado (Id_Chamado, Cod_Produto, Qtde_Vendida, Valor_Unitario) VALUES (3, 104, 1, 120.00);
INSERT INTO Itens_Chamado (Id_Chamado, Cod_Produto, Qtde_Vendida, Valor_Unitario) VALUES (4, 105, 1, 350.00);
INSERT INTO Itens_Chamado (Id_Chamado, Cod_Produto, Qtde_Vendida, Valor_Unitario) VALUES (4, 106, 1, 280.00);
INSERT INTO Itens_Chamado (Id_Chamado, Cod_Produto, Qtde_Vendida, Valor_Unitario) VALUES (5, 102, 1, 150.00);
INSERT INTO Itens_Chamado (Id_Chamado, Cod_Produto, Qtde_Vendida, Valor_Unitario) VALUES (6, 107, 1, 50.00);

INSERT INTO Funcionario_Chamado (Id_Funcionario, Id_Chamado) VALUES (1, 1);
INSERT INTO Funcionario_Chamado (Id_Funcionario, Id_Chamado) VALUES (1, 2);
INSERT INTO Funcionario_Chamado (Id_Funcionario, Id_Chamado) VALUES (2, 3);
INSERT INTO Funcionario_Chamado (Id_Funcionario, Id_Chamado) VALUES (3, 4);
INSERT INTO Funcionario_Chamado (Id_Funcionario, Id_Chamado) VALUES (1, 5);
INSERT INTO Funcionario_Chamado (Id_Funcionario, Id_Chamado) VALUES (2, 6);

COMMIT; 
