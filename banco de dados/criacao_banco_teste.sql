create table cidades (
 cod_cidade int primary key identity not null,
 cid_nome nvarchar(50) not null,
 cid_estado nvarchar(50) not null,
 cid_cep_inicial nvarchar(10) not null,
 cid_cep_final nvarchar(10) not null
);

create table clientes(
 cod_cliente int primary key identity not null,
 cgc_cpf_cliente nvarchar(15) not null,
 cli_nome nvarchar(50) not null,
 cli_telefone int not null,
 cli_endereco nvarchar(50) not null,
 cli_bairro nvarchar(50) not null,
 cli_complemento nvarchar(10) not null,
 cli_e_mail nvarchar(60) not null
 
);