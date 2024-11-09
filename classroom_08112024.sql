-- Criação da tabela 'pedido'
CREATE TABLE pedido (
    idpedido INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
);

-- Criação da tabela 'item_pedido'
CREATE TABLE item_pedido (
    iditem INT PRIMARY KEY AUTO_INCREMENT,
    idpedido INT,
    qnt_pecas INT NOT NULL,
    descricao VARCHAR(255),
    nome VARCHAR(100) NOT NULL,
    FOREIGN KEY (idpedido) REFERENCES pedido(idpedido) ON DELETE CASCADE
);

-- Criação da view 'view_pedidos_com_itens'
CREATE VIEW view_pedidos_com_itens AS
SELECT 
    p.idpedido,
    p.nome AS pedido_nome,
    i.qnt_pecas,
    i.descricao,
    i.nome AS item_nome
FROM 
    pedido p
JOIN 
    item_pedido i ON p.idpedido = i.idpedido;

-- Criação da procedure 'inserir_pedido_com_item'
DELIMITER //

CREATE PROCEDURE inserir_pedido_com_item(
    IN p_nome VARCHAR(100),
    IN i_qnt_pecas INT,
    IN i_descricao VARCHAR(255),
    IN i_nome VARCHAR(100)
)
BEGIN
    DECLARE novo_idpedido INT;

    -- Insere um novo pedido
    INSERT INTO pedido (nome) VALUES (p_nome);
    SET novo_idpedido = LAST_INSERT_ID();

    -- Insere um item associado ao pedido recém-criado
    INSERT INTO item_pedido (idpedido, qnt_pecas, descricao, nome)
    VALUES (novo_idpedido, i_qnt_pecas, i_descricao, i_nome);
END //

DELIMITER ;
