-- Criar BCD
create database Pizzaria; 

-- Ativar Banco
use Pizzaria;

-- Criar tabelas 
create table cliente (
Id_cliente int,
Telefone int,
Pagamento int,
Endereco varchar (255),
Nome_Cliente varchar (255)
);

create table atendente (
Id_atendente int,
Receber_Pedido varchar (255), 
Pagamento_Pedido int,
Finalizar_Atendimento int
);

create table administrador (
Id_administrador int,
Cadastrar_Pizza varchar (255),
Administra_Estoque varchar (255),
Gerencia_Funcionarios varchar (255),
Cancelar_Pizza varchar (255)
);

create table pizza (
Id_pizza int,
Nome_Pizza varchar (255),
Ingredientes varchar (255),
Sabores varchar (255)
);
   select * from cliente;