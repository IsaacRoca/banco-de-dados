CREATE DATABASE IF NOT EXISTS Lanchonete_da_tia_Cleusa;
USE Lanchonete_da_tia_Cleusa;

create table if not exists Funcionario ( id_funcionario bigint primary key not null auto_increment,
    nome varchar(99) not null,
    senha varchar(99) not null,
    email varchar(99) not null,
    cargo varchar(50) not null
);
insert into Funcionario (nome, senha, email, cargo) values ('Augusto Joaquim', 'senha1', 'augusto@email.com', 'Caixa');
insert into Funcionario (nome, senha, email, cargo) values ('Fernando Cordeiro', 'senha2', 'fernando@email.com', 'Caixa');
insert into Funcionario (nome, senha, email, cargo) values ('Bruno Henrique', 'senha3', 'bruno@email.com', 'Atendente');
insert into Funcionario (nome, senha, email, cargo) values ('Isaac Emmanuel', 'senha4', 'isaac@email.com', 'Atendente');
insert into Funcionario (nome, senha, email, cargo) values ('Patricia Moura', 'senha5', 'patricia@email.com', 'Atendente');
insert into Funcionario (nome, senha, email, cargo) values ('Natan Amaral', 'senha6', 'natan@email.com', 'Cozinheiro');
insert into Funcionario (nome, senha, email, cargo) values ('Leticia Souza', 'senha7', 'leticia@email.com', 'Cozinheiro');


create table if not exists Cardapio (
    id_Cardapio bigint primary key not null auto_increment,
    nome_do_prato varchar(100) not null,
    preco float not null,
    categoria text not null
);
insert into Cardapio (nome_do_prato, preco, categoria) VALUES ('X-Salada', 7.00, 'Lanches');
insert into Cardapio (nome_do_prato, preco, categoria) VALUES ('X-Tudo', 18.99, 'Lanches');
insert into Cardapio (nome_do_prato, preco, categoria) VALUES ('Batata Frita', 4.99, 'Lanches');
insert into Cardapio (nome_do_prato, preco, categoria) VALUES ('Refrigerante Lata', 5.99, 'Bebidas');
insert into Cardapio (nome_do_prato, preco, categoria) VALUES ('Suco Natural', 6.49, 'Bebidas');

create table if not exists Produtos (id_produto bigint primary key auto_increment,
	nome varchar (100) not null,
    preco decimal (4,2) not null,
    id_Cardapio bigint,
    foreign key (id_Cardapio) references Cardapio (id_Cardapio)
    );
insert into Produtos (nome, preco, id_Cardapio) values ('X-Salada', 7.00, 1);
insert into Produtos (nome, preco, id_Cardapio) values ('X-Tudo', 18.99, 1);
insert into Produtos (nome, preco, id_cardapio) values ('Batata Frita', 4.99, 2);
insert into Produtos (nome, preco, id_cardapio) values ('Refrigerante Lata', 5.99, 2);
insert into Produtos (nome, preco, id_cardapio) values ('Suco Natural', 6.49, 2);
    
create table if not exists Clientes (id_cliente bigint primary key auto_increment,
	nome varchar(100) not null,
    telefone varchar (18),
    email varchar (100) not null,
    endereco varchar (250)
    );
insert into Clientes (nome, telefone, email) values ('Hudson', '(55) 99945-7654', 'hudson@gmail.com');
insert into Clientes (nome, telefone, email) values ('Lucas Santos', '(55) 99923-4752', 'lucas@gmail.com');
insert into Clientes (nome, telefone, email) values ('Carlos Ribeiro', '(55) 99911-6998', 'carlos@gmail.com');
    
create table if not exists pedidos (
    id_pedido bigint primary key auto_increment not null,
    id_cliente bigint not null,
    id_funcionario bigint not null,
    data_pedido datetime default current_timestamp,
    status ENUM ('Em preparo', 'Pronto','Entregue','Cancelado') default 'Em preparo',
    total decimal (10,2),
    foreign key (id_cliente) references Clientes(id_cliente),
    foreign key (id_funcionario) references Funcionario(id_funcionario)
);
insert into pedidos (id_cliente, id_funcionario, total, status) values (1, 3, 25.99, 'Em preparo');
insert into pedidos (id_cliente, id_funcionario, total, status) values (2, 4, 13.49, 'Pronto');
insert into pedidos (id_cliente, id_funcionario, total, status) values (3, 5, 11.48, 'Entregue');

create table if not exists itens_pedido (id_item int primary key auto_increment not null,
	id_pedido bigint not null,
    id_produto bigint not null,
    quantidade int not null,
    preco_unitario decimal(10,2) not null,
    foreign key (id_pedido) references pedidos(id_pedido),
    foreign key (id_produto) references Produtos(id_produto)
    );
insert into itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES (1, 1, 1, 7.00);
insert into itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES (1, 4, 1, 5.99);
insert into itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES (2, 3, 1, 4.99);
insert into itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES (2, 5, 1, 6.49);
insert into itens_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES (3, 2, 1, 18.99);



	
