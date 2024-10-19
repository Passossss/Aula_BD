create database db_aula_2024_10_18;

use db_aula_2024_10_18;


CREATE TABLE tb_aula (
    aula_id int primary key auto_increment,
    conteudo TEXT,
    aula_data DATE,
    ano INT,
    mes INT,
    dia INT,
    dia_da_semana VARCHAR(15)
);

##criar view
CREATE OR REPLACE VIEW vw_aula AS 
SELECT * FROM tb_aula; ##aula_data

YEAR(aula_data) as ano,
MONTH(aula_data) as mes,
DAY(aula_data) as dia,
CASE DAYOFWEEK(aula_data)
	WHEN 1 THEN 'DOM'
    WHEN 1 THEN 'SEG'
    WHEN 1 THEN 'TER'
    WHEN 1 THEN 'QUA'
    WHEN 1 THEN 'QUI'
    WHEN 1 THEN 'SEX'
    WHEN 1 THEN 'SAB'
    
SELECT * FROM vw_aula;

create table tb_aula_log(
aula_log_id INT PRIMARY key auto_increment,
aula_id INT,
procedimento VARCHAR(50),
aula_data_insercao DATETIME,
foreign key(aula_id) references tb_aula(aula_id)
);

SELECT * FROM  tb_aula_log;

DELIMITER $$
create procedure if not exists inserindo_nova_aula(
	in nova_aula_data DATE,
    in novo_conteudo VARCHAR(30)
)
BEGIN
	DECLARE nova_aula_id INT DEFAULT NULL;
    if nova_aula_data is not null and novo_counteudo is not null then
 		-- Populando TB_Aula
        insert into tb_aula (counteudo, aula_data) values (novo_counteudo,nova_aula_data);
        -- Populando TB_Aula_log
        set nova_aula_id := (SELECT LAST_INSERT_ID());
        -- Populando TB_Aula_log
         insert into tb_aula_log (aula_id, procedimento, aula_data_insercao)
        values (nova_aula_id, 'INSERT VIA PROCEDURE', NOW());
    END IF;
    SELECT nova_aula_id;
end $$
DELIMITER ;
DROP function dia_da_samana;
CREATE FUNCTION dia_da_semana (dia INT)
RETURNS VARCHAR (10) determistic
begin
	DECLARE novo_dia_da_semana VARCHAR(10);
    SET novo_dia_da_semana := (
    CASE dia
	WHEN 1 THEN 'DOM'
    WHEN 1 THEN 'SEG'
    WHEN 1 THEN 'TER'
    WHEN 1 THEN 'QUA'
    WHEN 1 THEN 'QUI'
    WHEN 1 THEN 'SEX'
    WHEN 1 THEN 'SAB' END
    );
	return novo_dia_da_semana;
	END $$
    
Select dia_da_semana (7);