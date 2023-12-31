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

/* INSERINDO/CADASTRANDO DADOS NA TABELA */

insert into pessoas values -- DML: Data Manipulation Language
(default, 'João', '2000-11-13', 'M', '75.8', '1.60', 'Estados Unidos'), -- Assim é possível inserir
(default, 'Pedro', '2019-12-3', 'M', '20', '1.01', 'Portugal'), -- vários dados/valores na tabela escolhida
(default, 'Jhuly', '2015-1-25', 'F', '20', '1.01', 'França'); -- default: inserir o padrão definido

select * from pessoas; -- Mostrar os dados cadastrados na tabela escolhida

use cadastro; -- Comando para selecionar/usar o banco de dados escolhido
describe cursos; -- Descreva/mostre pessoas ou -> desc pessoas;

/* ALTERANDO A TABELA */
-- Estruturas para modificar colunas

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

alter table endereco
modify rua varchar(50) after cep; -- Modificar apenas o tipo primitivo e as constranges

alter table endereco
change logradoura logradouro varchar(15); -- Serve para renomear a coluna e é necessário inserir novamente o tipo primitivo e as constranges

-- Estrutura para modificar a própria tabela
alter table pessoas rename to clientes; -- Renomear o nome da tabela inteira -> Podemos digitar assim também os comandos

create table if not exists cursos (
nome varchar(100) not null unique, -- O nome do será único, porém não é uma PK
descricao text, -- Textos longos
carga int unsigned, -- Não permite valores negativos
totaulas int unsigned,
ano year default '2016' -- Estrutura para ano
) default charset = utf8mb4;

alter table cursos
add id int first; -- Adicionar id na primeira coluna

alter table cursos
add primary key (id); -- Adicionar no id a constrange PK

drop table endereco; -- Apagar TODA a tabela e seus dados

/* MODIFICAR DADOS DAS LINHAS NA TABELA */

insert into cursos values
('1', 'HTML4', 'Curso de HTML5', '40', '37', '2014'),
 ('2','Algoritimos','Logica de Programação','20','8','2014'),
 ('3','Photoshop','Aulas de Photoshop CC','9','20','2014'),
 ('4','PGP','PHP para Iniciantes','33','40','2010'),
 ('5','Jarva','Intro ao Java','22','10','2000'),
 ('6','MySQL','Curso MySQL','21','15','2016'),
 ('7','World','Word Completo','40','30','2018'),
 ('8','Sapateado','Dança Rítimica','14','30','2018'),
 ('9','Cozinha Árabe','Aprenda a fazer Kibe','40','30','2018'),
 ('10','YouTuber','Gerar Polêmicas e Ganhar Inscritos','5','2','2010');
 
 select * from cursos;
 
 update cursos -- Atualize nomeTabela
 set nome = 'HTML5' -- Configure nomeDadoLinha igual a valorNovo
 where id = '1'; -- Onde a PK é igual numeroDaPK
 
 update cursos
 set nome = 'PHP', ano = '2015' -- Modificar dois registros na mesma linha
 where id = '4';
 
 update cursos
 set nome = 'Java', ano = '2015', carga = '40' -- Modificar dois registros na mesma linha
 where id = '5'
 limit 1; -- Limita a ação dessa estrutura a apenas uma linha, sendo uma medida de precaução caso altere uma linha errada
 
 delete from cursos
 where id = '8'; -- Apagar a linha onde o nome é igual ao valor dado
 
 truncate table endereco; -- Apagar TODOS os dados da tabela, mas mantém a tabela
 
 drop database aunimal; -- Apagar TODO o banco de dados
 












