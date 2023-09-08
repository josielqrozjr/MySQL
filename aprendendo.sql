create database cadastro
default character set utf8mb4  /* Permitir o uso de carcacteres especiais, como acentos e etc. */
default collate utf8mb4_general_ci; /* Definir região de caracteres. */

create table pessoas (
id int not null auto_increment, /* Chave primária
								-> not null - define que é obrigatório
								-> auto_increment adiciona uma numeração única para cada pessoa */
nome varchar(30) not null, /* Nome com 30 caracteres e é obrigatório */
nascimento date, /* Data de nascimento -> AAAA-MM-DD */
sexo enum('M', 'F'), /* Permite apenas a escolha de M ou F */
peso decimal(5, 2), /* São usados até 5 números, sendo os três primeiros antes da vírgula
					e os dois últimos depois da vírgula -> 000.00 */
altura decimal(3, 2), /* Mesmo modelo do anterior -> 0.00  */
nacionalidade varchar(30) default 'Brasil', /* Com o default 'Brasil' será cadastrada a informação
											dentro do default caso não seja preenchido no cadastro */
primary key (id) /* Chave primária do id */
) default charset = utf8mb4; /* Permite os caracteres especiais nessa tabela */

/* insert into pessoas -> Esse comando insere dados na tabela escolhida
(nome, nascimento, sexo, peso, altura, nacionalidade) -> Não preciso inserir se ordem dos dados
da linha abaixo são a mesma e então da forma abaixo: */

insert into pessoas values -- DML: Data Manipulation Language
(default, 'João', '2000-11-13', 'M', '75.8', '1.60', 'Estados Unidos'), -- Assim é possível inserir
(default, 'Pedro', '2019-12-3', 'M', '20', '1.01', 'Portugal'), -- vários dados/valores na tabela escolhida
(default, 'Jhuly', '2015-1-25', 'F', '20', '1.01', 'França'); -- default: inserir o padrão definido

select * from pessoas; -- Mostrar os dados cadastrados na tabela escolhida

use cadastro; -- Comando para selecionar/usar o banco de dados escolhido
describe pessoas; -- Descreva/mostre pessoas ou -> desc pessoas;

/* ALTERANDO A TABELA */

alter table pessoas -- alterar a tabela escolhida
add column profissao varchar(10); -- adicionar uma coluna com o nome e tipos escolhidos
/* Pode omitir o column -> add nomeColuna tipo;
-> É adicionado ao final da tabela
-> Para as pessoas já cadastradas os novos campos são colocados como nulos, pois foram cadastradas
antes da criação das novas colunas -> CUIDADO AO ADICIONAR! */

alter table pessoas
drop profissao; -- Excluir a coluna escolhida, o column está implícito

alter table pessoas
add profissao varchar(10) after sexo; -- Adicionar depois da coluna definida

alter table pessoas
add profissao varchar(10) not null default'' first; -- Adicionar como primeira coluna











