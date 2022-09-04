/* 
	Lista avaliativa - Questão 01 #a
    @autor: Vinicius Costa
*/

create schema dogao_da_praca_db;

use dogao_da_praca_db;

create table clientes (
	id_cliente int not null auto_increment primary key,
    nome varchar(100) not null,
    nascimento date not null
);

create table estados (
	id_estado int not null auto_increment primary key,
    descricao varchar(50) not null
);

create table tipos_pagamentos (
	id_tipo_pagamento int not null auto_increment primary key,
    tipo varchar(50) not null
);

create table pedidos (
	numero_pedido int not null auto_increment primary key,
	cliente_id int not null,
	estado_id int not null,
	tipo_pagamento_id int,
    data_hora datetime,
    foreign key (cliente_id) references clientes(id_cliente),
    foreign key (estado_id) references estados(id_estado),
    foreign key (tipo_pagamento_id) references tipos_pagamentos(id_tipo_pagamento)
);

create table produtos (
	cod_produto int not null auto_increment primary key,
    nome varchar(100) not null,
    valor float not null
);

create table pedido_produto (
	id_pedido_produto int not null auto_increment primary key,
    pedido_numero int not null,
    produto_cod int not null,
    quantidade int not null,
    foreign key (pedido_numero) references pedidos(numero_pedido),
    foreign key (produto_cod) references produtos(cod_produto)
);

create table ingredientes (
	cod_ingrediente int not null auto_increment primary key,
    nome varchar(100) not null,
    valor float not null
);

create table cachorros_quentes (
	id_cachorro_quente int not null auto_increment primary key,
    pedido_numero int not null,
    foreign key (pedido_numero) references pedidos(numero_pedido)
);

create table cachorro_quente_ingrediente (
	id_cachorro_quente_ingrediente int not null auto_increment primary key,
	cachorro_quente_id int not null,
	ingrediente_cod int not null,
    foreign key (cachorro_quente_id) references cachorros_quentes(id_cachorro_quente),
	foreign key (ingrediente_cod) references ingredientes(cod_ingrediente)
);