# Aula_BD

Este repositório contém um esquema de banco de dados para gerenciamento de aulas, com tabelas, views, procedimentos armazenados e funções no MySQL.

## Estrutura do Banco de Dados

### Tabelas

- **tb_aula**: Armazena informações sobre as aulas, incluindo conteúdo, data, ano, mês, dia e dia da semana.
  - Campos:
    - `aula_id` (INT, PK, AUTO_INCREMENT): Identificador único da aula.
    - `conteudo` (TEXT): Descrição do conteúdo da aula.
    - `aula_data` (DATE): Data da aula.
    - `ano`, `mes`, `dia` (INT): Ano, mês e dia extraídos da `aula_data`.
    - `dia_da_semana` (VARCHAR(15)): Dia da semana.

- **tb_aula_log**: Registra logs de operações feitas na tabela `tb_aula`.
  - Campos:
    - `aula_log_id` (INT, PK, AUTO_INCREMENT): Identificador único do log.
    - `aula_id` (INT, FK): Identificador da aula correspondente.
    - `procedimento` (VARCHAR(50)): Descrição da operação realizada.
    - `aula_data_insercao` (DATETIME): Data e hora da inserção do log.

### View

- **vw_aula**: View que exibe as informações da tabela `tb_aula` junto com o ano, mês, dia e dia da semana calculados a partir da `aula_data`.

### Procedures

- **inserindo_nova_aula**: Procedure que insere uma nova aula na tabela `tb_aula` e registra o log da operação na tabela `tb_aula_log`.
  - Parâmetros:
    - `nova_aula_data` (DATE): Data da nova aula.
    - `novo_conteudo` (VARCHAR(30)): Conteúdo da nova aula.

### Funções

- **dia_da_semana**: Função que recebe um número (de 1 a 7) e retorna o nome correspondente do dia da semana.
  - Exemplo:
    - `Select dia_da_semana(7)` retorna "SAB" (sábado).

## Observações

- Há pequenos erros no código que precisam ser corrigidos, como o mapeamento de dias da semana no `CASE` e a escrita de `conteudo` corretamente nas procedures e na view.
