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