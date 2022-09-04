/* 
	Lista avaliativa - Questão 01 #b
    @autor: Vinicius Costa
*/

use dogao_da_praca_db;

/*************** #B SUBITEM II ***************/

insert into produtos (nome, valor) values
("Refrigerante Lata", 5.00), ("Água Mineral", 2.00),
("Refrigerante Lata", 5.00), ("Suco Natural", 3.00),
("Suco Natural (com Leite)", 3.50), ("Doce de Leite", 2.50),
("Mousse de Maracujá", 3.00), ("Serenata do Amor", 0.75);

/*************** #B SUBITEM II ***************/

insert into ingredientes (nome, valor) values
("Salsicha", 0.30), ("Carne Moída", 0.25),
("Frango Desfiado", 0.40), ("Filé Trinchado", 0.75),
("Queijo Ralado", 0.15), ("Queijo Derretido (Prato)", 0.20),
("Cream Cheese", 0.45), ("Vinagrete", 0.20), ("Ervilha e Milho Verde", 0.15);

/*************** #B SUBITEM III ***************/

insert into tipos_pagamentos (tipo) values
("Débito"), ("Crédito"), ("Dinheiro");

/*************** #B SUBITEM IV ***************/

insert into estados (descricao) values
("Pedido Realizado"), ("Prato em Execução"), ("Pronto");

/*************** #B SUBITEM V ***************/

insert into clientes (nome, nascimento) values
("Ana Maria Braga", "1949-04-01");

insert into pedidos (data_hora, cliente_id, estado_id)
values (now(), 1, 2);

insert into cachorros_quentes (pedido_numero) values (1), (1);

insert into cachorro_quente_ingrediente (cachorro_quente_id, ingrediente_cod)
values (1, 1), (1, 2), (1, 6), (1, 8), (2, 3), (2, 7), (2, 9);

INSERT INTO pedido_produto (pedido_numero, produto_cod, quantidade)
VALUES (1, 1, 2), (1, 2, 1);

/*************** #B SUBITEM VI ***************/

insert into clientes (nome, nascimento) values
("Raul Seixas", "1945-06-28");

insert into pedidos (data_hora, cliente_id, estado_id)
values (now(), 2, 1);

insert into cachorros_quentes (pedido_numero) values (2);

insert into cachorro_quente_ingrediente (cachorro_quente_id, ingrediente_cod)
values (3, 4), (3, 3), (3, 5), (3, 8);

INSERT INTO pedido_produto (pedido_numero, produto_cod, quantidade)
VALUES (2, 5, 1), (2, 7, 1);

/*************** #B SUBITEM VII ***************/

update pedidos set estado_id = 3
where numero_pedido = 1;

update pedidos set estado_id = 2
where numero_pedido = 2;

/*************** #B SUBITEM VIII ***************/

insert into clientes (nome, nascimento) values
("Fausto Silva", "1950-05-02");

insert into pedidos (data_hora, cliente_id, estado_id)
values (now(), 3, 1);

insert into cachorros_quentes (pedido_numero)
values (3), (3);

insert into cachorro_quente_ingrediente (cachorro_quente_id, ingrediente_cod)
values (4, 1), (4, 2), (4, 3), (4, 4), (4, 5), (4, 6), (4, 7), (4, 8), (4, 9),
(5, 1), (5, 3), (5, 5), (5, 6), (5, 9);

insert into pedido_produto (pedido_numero, produto_cod, quantidade)
values (3, 2 ,1), (3, 6 ,2);

/*************** #B SUBITEM IX ***************/

update pedidos set estado_id = 3 where numero_pedido = 2;
update pedidos set estado_id = 2 where numero_pedido = 3;

/*************** #B SUBITEM X ***************/

/* Ana Maria */

select SUM( ROUND( subtotal, 2 ) ) as total_pedidos_Ana from (
	select SUM( quantidade * valor ) as subtotal from pedidos
		inner join pedido_produto
			on pedidos.numero_pedido = pedido_produto.pedido_numero
		inner join produtos
			on pedido_produto.produto_cod = produtos.cod_produto
	where pedidos.numero_pedido = 1

	union all

	select SUM( valor ) as subtotal from pedidos
		inner join cachorros_quentes
			on pedidos.numero_pedido = cachorros_quentes.pedido_numero
		inner join cachorro_quente_ingrediente
			on cachorros_quentes.id_cachorro_quente= cachorro_quente_ingrediente.cachorro_quente_id
		inner join ingredientes
			on cachorro_quente_ingrediente.ingrediente_cod = ingredientes.cod_ingrediente
	where pedidos.numero_pedido = 1
) as totais_pedidos;

/* Raul Seixas */

select SUM( ROUND( subtotal, 2 ) ) as total_pedidos_raul from (
	select SUM( quantidade * valor ) as subtotal from pedidos
		inner join pedido_produto
			on pedidos.numero_pedido = pedido_produto.pedido_numero
		inner join produtos
			on pedido_produto.produto_cod = produtos.cod_produto
	where pedidos.numero_pedido = 2

	union all

	select SUM( valor ) as subtotal from pedidos
		inner join cachorros_quentes
			on pedidos.numero_pedido = cachorros_quentes.pedido_numero
		inner join cachorro_quente_ingrediente
			on cachorros_quentes.id_cachorro_quente= cachorro_quente_ingrediente.cachorro_quente_id
		inner join ingredientes
			on cachorro_quente_ingrediente.ingrediente_cod = ingredientes.cod_ingrediente
	where pedidos.numero_pedido = 2
) as totais_pedidos;

update pedidos set tipo_pagamento_id = 3 where numero_pedido = 1;

update pedidos set tipo_pagamento_id = 2 where numero_pedido = 2;


/*************** #B SUBITEM XI ***************/

select SUM( ROUND( subtotal, 2 ) ) as total_pedidos_fausto from (
	select SUM( quantidade * valor ) as subtotal from pedidos
		inner join pedido_produto
			on pedidos.numero_pedido = pedido_produto.pedido_numero
		inner join produtos
			on pedido_produto.produto_cod = produtos.cod_produto
	where pedidos.numero_pedido = 3

	union all

	select SUM( valor ) as subtotal from pedidos
		inner join cachorros_quentes
			on pedidos.numero_pedido = cachorros_quentes.pedido_numero
		inner join cachorro_quente_ingrediente
			on cachorros_quentes.id_cachorro_quente= cachorro_quente_ingrediente.cachorro_quente_id
		inner join ingredientes
			on cachorro_quente_ingrediente.ingrediente_cod = ingredientes.cod_ingrediente
	where pedidos.numero_pedido = 3
) as totais_pedidos;

update pedidos set tipo_pagamento_id = 1 where numero_pedido = 3;
