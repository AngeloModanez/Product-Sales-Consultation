--2
use vendas
select ID_NF,ID_ITEM,COD_PROD,VALOR_UNIT
from PRODUTOS
where [DESCONTO(%)] = 0
go

--3
use vendas
select ID_NF,ID_ITEM,COD_PROD,VALOR_UNIT, 
VALOR_UNIT - (VALOR_UNIT*([DESCONTO(%)]/100)) as VALOR_VENDIDO
from PRODUTOS
where [DESCONTO(%)] > 0
go

--4
use vendas
select ID_NF,ID_ITEM,COD_PROD,VALOR_UNIT,[DESCONTO(%)], 
QUANTIDADE*VALOR_UNIT as VALOR_TOTAL,
VALOR_UNIT - (VALOR_UNIT*([DESCONTO(%)]/100)) as VALOR_VENDIDO
from PRODUTOS
go

--5
use vendas
select ID_NF, sum(QUANTIDADE*VALOR_UNIT) as VALOR_TOTAL
from PRODUTOS
group by ID_NF
order by VALOR_TOTAL desc
go

--6/7
use vendas
select ID_NF, sum(VALOR_UNIT-(VALOR_UNIT*([DESCONTO(%)]/100))) as VALOR_VENDIDO
from PRODUTOS
order by VALOR_VENDIDO desc
go

--8
use vendas
select COD_PROD, sum(QUANTIDADE) as QUANTIDADE 
from PRODUTOS
group by COD_PROD
go

--9
use vendas
select ID_NF,COD_PROD, sum(QUANTIDADE) as QUANTIDADE
from PRODUTOS
where QUANTIDADE > 10
group by ID_NF,COD_PROD
go

--10
use vendas
select ID_NF,COD_PROD, sum(QUANTIDADE) as QUANTIDADE
from PRODUTOS
where QUANTIDADE > 10
group by ID_NF,COD_PROD
go

--11
use vendas
select ID_NF, sum(VALOR_UNIT*QUANTIDADE) as VALOR_TOTAL
from PRODUTOS
group by ID_NF
having sum(VALOR_UNIT*QUANTIDADE) > 500
order by VALOR_TOTAL desc
go

--12
use vendas
select COD_PROD, avg([DESCONTO(%)]) as MEDIA
from PRODUTOS
group by COD_PROD
go

--13
use vendas
select COD_PROD, avg([DESCONTO(%)]) as MEDIA, max([DESCONTO(%)]) as MAIOR, min([DESCONTO(%)]) as MENOR
from PRODUTOS
group by COD_PROD
go

--14
use vendas
select ID_NF, count(ID_NF) as QTD_ITENS
from PRODUTOS
group by ID_NF
having count(ID_NF) > 3
go

