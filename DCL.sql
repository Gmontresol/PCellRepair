-- Cria o papel para os técnicos
CREATE ROLE role_tecnico_laboratorio;

-- Permissão para ver os Chamados e os Dispositivos (para saber o que consertar)
GRANT SELECT ON Chamado TO role_tecnico_laboratorio;
GRANT SELECT ON Dispositivo TO role_tecnico_laboratorio;

-- Permissão para atualizar o Status do chamado e colocar a data de término
GRANT UPDATE (Status, Data_Termino) ON Chamado TO role_tecnico_laboratorio;

-- Permissão para lançar as peças usadas no conserto
GRANT SELECT, INSERT, UPDATE, DELETE ON Itens_Chamado TO role_tecnico_laboratorio;

-- Cria o papel do Gerente
CREATE ROLE role_gerente_loja;

-- Permissão total sobre Funcionários (Salários) e tabela de Produtos (Preços)
GRANT SELECT, INSERT, UPDATE, DELETE ON Funcionario TO role_gerente_loja;
GRANT SELECT, INSERT, UPDATE, DELETE ON Produto TO role_gerente_loja;

-- Permissão de leitura na tabela de auditoria para fiscalizar o sistema
GRANT SELECT ON Log_Auditoria TO role_gerente_loja;
