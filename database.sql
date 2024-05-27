create database vendas
go

use vendas
create table PRODUTOS(
ID_NF tinyint,
ID_Item tinyint,
Cod_Prod tinyint,
Valor_Unit money,
Quantidade tinyint,
[Desconto(%)] tinyint)