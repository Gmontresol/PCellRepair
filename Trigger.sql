/*Verifica de quando realizar uma venda, ou alterar ela ou deletar, arrume automaticamente o estoque*/
CREATE OR REPLACE TRIGGER tr_atualizacao_estoque
AFTER INSERT OR UPDATE OR DELETE ON ITENS_CHAMADO
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        UPDATE PRODUTO
        SET ESTOQUE = ESTOQUE - :NEW.QTDE_VENDIDA
        WHERE COD_PRODUTO = :NEW.COD_PRODUTO;
    ELSIF UPDATING THEN
        UPDATE PRODUTO
        SET ESTOQUE = ESTOQUE + :OLD.QTDE_VENDIDA - :NEW.QTDE_VENDIDA
        WHERE COD_PRODUTO = :NEW.COD_PRODUTO;
    ELSIF DELETING THEN
        UPDATE PRODUTO
        SET ESTOQUE = ESTOQUE + :OLD.QTDE_VENDIDA
        WHERE COD_PRODUTO = :OLD.COD_PRODUTO;
    END IF;
    
END;
/

/*Ao criar itens do chamado verifica se tem o suficiente no estoque para a venda*/
CREATE OR REPLACE TRIGGER tr_verifica_estoque
BEFORE INSERT ON ITENS_CHAMADO
FOR EACH ROW
DECLARE
    v_estoque_atual NUMBER;
BEGIN
    SELECT ESTOQUE into v_estoque_atual
    FROM PRODUTO
    WHERE COD_PRODUTO =:NEW.COD_PRODUTO;
    
    IF (v_estoque_atual < :NEW.QTDE_VENDIDA) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Erro: Estoque insuficiente para o produto informado.');
    END IF;      
END;
/

commit;

CREATE OR REPLACE TRIGGER trg_auditoria_status_chamado
AFTER UPDATE OF Status ON Chamado
FOR EACH ROW
BEGIN
    IF :OLD.Status <> :NEW.Status THEN
        INSERT INTO Log_Auditoria (Acao, Data_Hora)
        VALUES (
            'Chamado ' || :NEW.Id_Chamado || ' alterado de "' || :OLD.Status || '" para "' || :NEW.Status || '"',
            SYSDATE
        );
    END IF;
END;
/
