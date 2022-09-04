/* 
	Lista avaliativa - Questão 01 #c
    @autor: Vinicius Costa
*/

use dogao_da_praca_db;

/*************** #C SUBITEM I ***************/

select tipo, count(pedidos.tipo_pagamento_id)
as compras from pedidos inner join tipos_pagamentos
on pedidos.tipo_pagamento_id = tipos_pagamentos.id_tipo_pagamento
GROUP BY tipo;

/*************** #C SUBITEM II ***************/

select * from clientes
where month(nascimento) between 3 and 5;

/*************** #C SUBITEM III ***************/

select nome, numero_pedido, ROUND( SUM( subtotal ), 2 ) as total_pedido from (
	select clientes.nome, pedidos.numero_pedido, round( sum( quantidade * valor ), 2 ) as subtotal from clientes
		inner join pedidos
			on clientes.id_cliente = pedidos.cliente_id
		inner join pedido_produto
			on pedidos.numero_pedido = pedido_produto.pedido_numero
		inner join produtos
			on pedido_produto.produto_cod = produtos.cod_produto
	group by clientes.nome

	union all
    
	select clientes.nome, pedidos.numero_pedido, round( sum( valor ), 2 ) as subtotal from clientes
		inner join pedidos
			on clientes.id_cliente = pedidos.cliente_id
		inner join cachorros_quentes
			on pedidos.numero_pedido = cachorros_quentes.pedido_numero
		inner join cachorro_quente_ingrediente
			on cachorros_quentes.id_cachorro_quente = cachorro_quente_ingrediente.cachorro_quente_id
		inner join ingredientes
			on cachorro_quente_ingrediente.ingrediente_cod = ingredientes.cod_ingrediente
	group by clientes.nome
) as total
group by nome;

/*************** #C SUBITEM IV ***************/

select concat( "R$ ", sum(round(subtotal, 2) ) ) as lucro_do_dia from (
	select sum(quantidade * valor) as subtotal from pedidos
		inner join pedido_produto
			on pedidos.numero_pedido = pedido_produto.pedido_numero
		inner join produtos
			on pedido_produto.produto_cod = produtos.cod_produto
            
union all

select sum(valor) as subtotal from pedidos
	inner join cachorros_quentes
		on pedidos.numero_pedido - cachorros_quentes.pedido_numero
	inner join cachorro_quente_ingrediente
		on cachorros_quentes.id_cachorro_quente = cachorro_quente_ingrediente.cachorro_quente_id
	inner join ingredientes
		on cachorro_quente_ingrediente.ingrediente_cod = ingredientes.cod_ingrediente

) as totais_diarios;
