SET SERVEROUT ON;

CREATE OR REPLACE PROCEDURE prc_adicionar_item(
    p_id_chamado  IN NUMBER,
    p_cod_produto IN NUMBER,
    p_quantidade  IN NUMBER
) IS
    v_preco_unitario NUMBER(10,2);
    v_status         VARCHAR2(20);
BEGIN
    SELECT Status INTO v_status
    FROM Chamado
    WHERE Id_Chamado = p_id_chamado;


    IF v_status = 'Terminado' THEN
        RAISE_APPLICATION_ERROR(-20005, 'Erro crítico: Não é permitido adicionar peças em um chamado já finalizado.');
    END IF;

    SELECT Preco INTO v_preco_unitario
    FROM Produto
    WHERE Cod_Produto = p_cod_produto;

    INSERT INTO Itens_Chamado (Id_Chamado, Cod_Produto, Qtde_Vendida, Valor_Unitario)
    VALUES (p_id_chamado, p_cod_produto, p_quantidade, v_preco_unitario);

    COMMIT;
END;
/


CREATE OR REPLACE PROCEDURE prc_encerrar_chamado (
    p_id_chamado IN NUMBER
) IS
    v_status_atual  VARCHAR2(20);
    v_total_chamado NUMBER(10,2) := 0;

    CURSOR c_itens_faturamento IS
        SELECT Qtde_Vendida, Valor_Unitario
        FROM Itens_Chamado
        WHERE Id_Chamado = p_id_chamado;
BEGIN
    SELECT Status INTO v_status_atual 
    FROM Chamado 
    WHERE Id_Chamado = p_id_chamado;

    IF v_status_atual = 'Terminado' THEN
        RAISE_APPLICATION_ERROR(-20010, 'Erro: Este chamado já foi encerrado.');
    END IF;

    FOR reg IN c_itens_faturamento LOOP
        v_total_chamado := v_total_chamado + (reg.Qtde_Vendida * reg.Valor_Unitario);
    END LOOP;

    UPDATE Chamado
    SET Status = 'Terminado', 
        Data_Termino = SYSDATE
    WHERE Id_Chamado = p_id_chamado;

    DBMS_OUTPUT.PUT_LINE('Chamado ' || p_id_chamado || ' encerrado com sucesso.');
    DBMS_OUTPUT.PUT_LINE('Valor total dos serviços/produtos: R$ ' || v_total_chamado);

    COMMIT;

EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE('Erro crítico ao tentar encerrar o chamado. Alterações desfeitas.');
        RAISE; 
END;
/


