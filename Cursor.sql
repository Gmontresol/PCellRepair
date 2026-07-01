DECLARE
    CURSOR c_ranking_produtos IS
        SELECT p.Nome_Produto, SUM(i.Qtde_Vendida) as Total_Vendido
        FROM Produto p
        JOIN Itens_Chamado i ON p.Cod_Produto = i.Cod_Produto
        GROUP BY p.Nome_Produto
        ORDER BY Total_Vendido DESC;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- RANKING DE PRODUTOS MAIS VENDIDOS ---');
    
    FOR reg IN c_ranking_produtos LOOP
        DBMS_OUTPUT.PUT_LINE('Produto: ' || reg.Nome_Produto || ' | Unidades Vendidas: ' || reg.Total_Vendido);
    END LOOP;
END;


DECLARE
    CURSOR c_carga_trabalho IS
        SELECT f.Nome_Completo, COUNT(fc.Id_Chamado) as Total_Chamados
        FROM Funcionario f
        LEFT JOIN Funcionario_Chamado fc ON f.Id_Funcionario = fc.Id_Funcionario
        GROUP BY f.Nome_Completo
        ORDER BY Total_Chamados DESC;
BEGIN
    DBMS_OUTPUT.PUT_LINE('--- CARGA DE TRABALHO DOS TÉCNICOS ---');
    
    FOR reg IN c_carga_trabalho LOOP
        DBMS_OUTPUT.PUT_LINE('Técnico: ' || reg.Nome_Completo || ' | Total de Chamados: ' || reg.Total_Chamados);
    END LOOP;
END;
//
