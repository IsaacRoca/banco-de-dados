CREATE DATABASE IF NOT EXISTS Lanchonete_da_tia_Cleusa;
USE Lanchonete_da_tia_Cleusa;

create table if not exists Funcionario ( id_funcionario bigint primary key not null auto_increment,
    nome varchar(99) not null,
    senha varchar(99) not null,
    email varchar(99) not null
);
create table if not exists Cardapio (
    id_Cardapio bigint primary key not null auto_increment,
    nome_do_prato varchar(100) not null,
    preco float not null,
    descricao text not null
);
create table if not exists Produtos (id_produto bigint primary key auto_increment,
	nome varchar (100) not null,
    preco decimal (4,2) not null,
    id_Cardapio bigint,
    foreign key (id_Cardapio) references Cardapio (id_Cardapio)
    );
create table if not exists Clientes (id_cliente bigint primary key auto_increment,
	nome varchar(100) not null,
    telefone varchar (18),
    email varchar (100) not null,
    endereco varchar (250)
    );
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

create table if not exists itens_pedido (id_item int primary key auto_increment not null,
	id_pedido bigint not null,
    id_produto bigint not null,
    quantidade int not null,
    preco_unitario decimal(10,2) not null,
    foreign key (id_pedido) references pedidos(id_pedido),
    foreign key (id_produto) references Produtos(id_produto)
    );
 
 

	
