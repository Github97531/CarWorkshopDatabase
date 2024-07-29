create database trabalho_oficina

use trabalho_oficina

create table cidade (id_cidade int primary key, 
					 nome char(30))

create table rua (id_rua int primary key, 
				  nome char(30), 
				  cidade int, 
				  foreign key (cidade) references cidade(id_cidade))

create table cliente (id_cliente int primary key,
					  nome char(30),
					  telemovel int, 
					  email char(30),
					  nif int,
					  nib char(30), 
					  rua int,
					  foreign key (rua) references rua(id_rua))

create table marca (id_marca int primary key,
					nome char(30))

create table modelo (id_modelo int primary key,
					nome char(30),
					marca int, 
					foreign key (marca) references marca(id_marca))

create table viatura (id_viatura int primary key,
					  cor char(30),
					  matricula char(30),
					  cliente int, 
					  modelo int,
					  foreign key (cliente) references cliente(id_cliente),
					  foreign key (modelo) references modelo(id_modelo))

create table funcionario (id_funcionario int primary key,
						  nome char(30),
						  telemovel int, 
						  email char(30))

create table rececionista (id_rececionista int primary key,
						   foreign key (id_rececionista) references funcionario(id_funcionario))

create table mecanico (id_mecanico int primary key,
					   foreign key (id_mecanico) references funcionario(id_funcionario))

create table reparacao (id_reparacao int primary key,
						descricao char(60),
						data_inicio date, 
						data_entrega date,
						marcacao int,
						viatura int,
						foreign key (viatura) references viatura(id_viatura),
						foreign key (marcacao) references marcacao(id_marcacao))

create table marcacao (id_marcacao int primary key,
					   descricao char(60),
					   data_marcacao date,
					   viatura int,
					   rececionista int,
					   foreign key (viatura) references viatura(id_viatura),
					   foreign key (rececionista) references rececionista(id_rececionista))

create table mecanico_reparacao (mecanico int,
								 reparacao int,
								 n_horas int,
								 primary key (mecanico, reparacao),
								 foreign key (mecanico) references mecanico(id_mecanico),
								 foreign key (reparacao) references reparacao(id_reparacao))

create table fornecedor (id_fornecedor int primary key, 
						 nome char(30), 
						 contacto int,
						 email char(30))


create table encomenda (id_encomenda int primary key,
						mecanico int,
						fornecedor int,
						foreign key (mecanico) references mecanico(id_mecanico),
						foreign key (fornecedor) references fornecedor(id_fornecedor))

create table peca (id_peca int primary key,
				   marca char(30),
				   tipo char(30),
				   stock int,
				   fornecedor int,
				   foreign key (fornecedor) references fornecedor(id_fornecedor))

create table reparacao_peca (reparacao int,
							 peca int,
							 preco_peca money, 
							 quantidade_peca int, 
							 primary key (reparacao, peca),
							 foreign key (reparacao) references reparacao(id_reparacao),
							 foreign key (peca) references peca(id_peca))

create table encomenda_peca (encomenda int,
							 peca int,
							 preco_peca money, 
							 quantidade_peca int, 
							 primary key (encomenda, peca),
							 foreign key (encomenda) references encomenda(id_encomenda),
							 foreign key (peca) references peca(id_peca))



insert into funcionario(id_funcionario, nome, telemovel, email) values 
(1, 'Manuel Mendes', 912345678, 'manuelmendes@gmail.com'),
(2, 'Ana Lopes', 916789012, 'analopes@gmail.com'),
(3, 'Goncalo Silva', 923987431, 'gsilva@gmail.com'),
(4, 'Helder Guedes', 967865456, 'helderg@hotmail.com'),
(5, 'Hugo Pereira', 919578543, 'hugopereira@hotmail.com'),
(6, 'Paula Gomes', 967498012, 'paulag@gmail.com');



insert into rececionista(id_rececionista) values 
(2), 
(6);



insert into mecanico(id_mecanico) values 
(1), 
(3), 
(4), 
(5);



insert into cidade(id_cidade, nome) values 
(001, 'Porto'),
(002, 'Vila Nova de Gaia'),
(003, 'Matosinhos'),
(004, 'Braga'),
(005, 'Coimbra'),
(006, 'Lisboa');



insert into rua(id_rua, nome, cidade) values 
(0001, 'Avenida da Boavista', 001),
(0002, 'Rua Cónego Ferreira Pinto', 001),
(0003, 'Rua de São Paulo', 001),
(0004, 'Rua Goncalo Cabral', 002),
(0005, 'Rua Tristao Vaz', 002),
(0006, 'Rua Pinto Aguiar', 002),
(0007, 'Rua Garcia Resende', 002),
(0008, 'Rua de Vilar', 001),
(0009, 'Rua Franca Junior', 003),
(0010, 'Rua Alvaro Casteloes', 003),
(0011, 'Rua Nova de Santa Cruz', 004),
(0012, 'Rua Conselheiro Lobato', 004),
(0013, 'Avenida Central', 004),
(0014, 'Rua das Flores', 005),
(0015, 'Avenida Fernao Magalhaes', 005),
(0016, 'Rua da Sofia', 005),
(0017, 'Rua Augusta', 006),
(0018, 'Avenida da Liberdade', 006),
(0019, 'Rua dos Douradores', 006);



insert into cliente(id_cliente, nome, telemovel, email, nif, nib, rua) values 
(01, 'António Ferreira', 912345679, 'antonioferreira@gmail.com', 123456789, 'PT500035067890123456789123', 0008),
(02, 'Manuel Pereira', 923456780, 'manuelpereira@gmail.com', 234567890, 'PT500035123456789012345678', 0006),
(03, 'José Costa', 914567891, 'josecosta@gmail.com', 345678901, 'PT500035789012345678901234', 0009),
(04, 'João Rodrigues', 915678902, 'joaorodrigues@gmail.com', 456789012, 'PT500035345678901234567890', 0002),
(05, 'Pedro Lopes', 966789013, 'pedrolopes@gmail.com', 567890123, 'PT500035556789012345678901', 0001),
(06, 'Rui Silva', 937890124, 'ruisilva@gmail.com', 678901234, 'PT500035234567890123456780', 0010),
(07, 'Luís Almeida', 928901235, 'luisalmeida@gmail.com', 789012345, 'PT500035345678901234567890', 0003),
(08, 'Miguel Carvalho', 919012346, 'miguelcarvalho@gmail.com', 890123456, 'PT500035556789012345678901', 0007),
(09, 'Ricardo Santos', 910123457, 'ricardosantos@gmail.com', 901234567, 'PT500035678901234567890123', 0005),
(10, 'Paulo Moreira', 911234568, 'paulomoreira@gmail.com', 112345678, 'PT500035789012345678901234', 0004),
(11, 'Carlos Martins', 911223344, 'carlosmartins@gmail.com', 123456780, 'PT500035567890123456789123', 0011),
(12, 'Ana Paula', 912334455, 'anapaula@gmail.com', 234567891, 'PT500035123456789012345679', 0012),
(13, 'Bruno Silva', 913445566, 'brunosilva@gmail.com', 345678912, 'PT500035789012345678901235', 0013),
(14, 'Diana Costa', 914556677, 'dianacosta@gmail.com', 456789023, 'PT500035345678901234567891', 0014),
(15, 'Eduardo Lopes', 915667788, 'eduardolopes@gmail.com', 567890134, 'PT500035556789012345678902', 0015),
(16, 'Fátima Nunes', 916778899, 'fatimanunes@gmail.com', 678901245, 'PT500035234567890123456781', 0016),
(17, 'Gabriel Santos', 917889900, 'gabrielsantos@gmail.com', 789012356, 'PT500035345678901234567891', 0017),
(18, 'Helena Almeida', 918990011, 'helenaalmeida@gmail.com', 890123467, 'PT500035556789012345678902', 0018),
(19, 'Igor Carvalho', 919001122, 'igorcarvalho@gmail.com', 901234578, 'PT500035678901234567890124', 0019),
(20, 'Juliana Moreira', 920112233, 'julianamoreira@gmail.com', 112345679, 'PT500035789012345678901235', 0010);



insert into marca(id_marca, nome) values 
(10, 'Toyota'),
(20, 'Ford'),
(30, 'Honda'),
(40, 'BMW'),
(50, 'Mercedes-Benz'),
(60, 'Audi'),
(70, 'Volkswagen'),
(80, 'Chevrolet');



insert into modelo(id_modelo, nome, marca) values 
(100, 'Serie 1', 40),	
(200, 'X3', 40),
(300, 'M2', 40),
(400, 'Classe A', 50),
(500, 'Classe E', 50),
(600, 'Prius', 10),
(700, 'Mustang', 20),
(800, 'Civic', 30),
(900, 'A3', 60),	
(1000, 'Golf', 70),
(1100, 'Passat', 70),
(1200, 'Cruze', 80),
(1300, 'Malibu', 80),
(1400, 'Q5', 60);



insert into viatura (id_viatura, cor, matricula, cliente, modelo) values 
(1, 'Preto', 'AB-13-CD', 01, 200), 
(2, 'Branco', 'EF-46-GH', 02, 400),
(3, 'Azul', 'IJ-79-KL', 03, 300), 
(4, 'Cinza', 'MN-02-OP', 04, 700), 
(5, 'Azul', 'QR-35-ST', 05, 600),
(6, 'Preto', '00-AB-01', 06, 800),
(7, 'Branco', '56-OP-78', 07, 600),
(8, 'Azul', '78-KL-90', 08, 100), 
(9, 'Preto', '34-ST-56', 09, 400), 
(10, 'Preto', '90-QR-12', 10, 500),
(11, 'Vermelho', 'XY-01-ZW', 11, 900), 
(12, 'Preto', 'AB-23-CD', 12, 1000),
(13, 'Branco', 'EF-45-GH', 13, 1100), 
(14, 'Azul', 'IJ-67-KL', 14, 1200), 
(15, 'Cinza', 'MN-89-OP', 15, 1300),
(16, 'Verde', 'QR-01-ST', 16, 1400),
(17, 'Cinza', 'UV-23-WX', 17, 900),
(18, 'Preto', 'YZ-45-12', 18, 1000),
(19, 'Branco', '34-AB-56', 19, 1100), 
(20, 'Azul', '78-CD-90', 20, 1200);



insert into marcacao (id_marcacao, descricao, data_marcacao, viatura, rececionista) values 
(1, 'Sobreaquecimento do motor', '2024-04-20', 1, 2),
(2, 'Mau funcionamento do painel eletronico', '2024-04-18', 2, 2),
(3, 'Problema na caixa de velocidades', '2024-04-22', 3, 2),
(4, 'Carro nao liga', '2024-04-23', 4, 2),
(5, 'Direcao desalinhada', '2024-04-24', 5, 2),
(6, 'Farois frontais bacos', '2024-04-25', 6, 6),
(7, 'Lampadas traseiras fundidas', '2024-04-26', 7, 6),
(8, 'Consumo excessivo de combustivel', '2024-04-27', 8, 2),
(9, 'Ruido na travagem', '2024-04-28', 9, 6),
(10, 'Pneus em mau estado', '2024-05-01', 10, 2),
(11, 'Verificacao do sistema de travagem', '2024-05-05', 11, 2),
(12, 'Substituicao de oleo', '2024-05-06', 12, 2),
(13, 'Reparacao de sistema de ar condicionado', '2024-05-07', 13, 6),
(14, 'Troca de correia dentada', '2024-05-08', 14, 6),
(15, 'Reparacao de embraiagem', '2024-05-09', 15, 6),
(16, 'Verificacao do sistema eletrico', '2024-05-10', 16, 2),
(17, 'Reparacao da suspenção', '2024-05-11', 17, 2),
(18, 'Troca de bateria', '2024-05-12', 18, 6),
(19, 'Reparacao de sistema de exaustao', '2024-05-13', 19, 2),
(20, 'Troca de filtro de ar', '2024-05-14', 20, 6);



insert into reparacao (id_reparacao, descricao, data_inicio, data_entrega, marcacao, viatura) values
(1, 'Radiador substituido', '2024-04-23', '2024-04-24', 1, 1),
(2, 'Painel eletronico reprogramado e sensores substituidos', '2024-04-20', '2024-04-22', 2, 2),
(3, 'Caixa de velocidades substituida', '2024-04-23', '2024-04-26', 3, 3),
(4, 'Bateria substituida', '2024-04-24', '2024-04-27', 4, 4),
(5, 'Alinhamento da direcao realizado', '2024-04-26', '2024-04-26', 5, 5),
(6, 'Farois substituidos', '2024-04-27', '2024-04-27', 6, 6),
(7, 'Lampadas traseiras substituidas', '2024-04-28', '2024-04-29', 7, 7),
(8, 'Verificacao do sistema de injecao de combustível', '2024-04-28', '2024-04-29', 8, 8),
(9, 'Pastilhas dos travoes substituidos', '2024-04-30', '2024-05-01', 9, 9),
(10, 'Pneus substituidos', '2024-05-02', '2024-05-03', 10, 10),
(11, 'Pastilhas e discos dos travões substituídos', '2024-05-06', '2024-05-07', 11, 11),
(12, 'Óleo e filtro de óleo substituídos', '2024-05-07', '2024-05-07', 12, 12),
(13, 'Sistema de ar condicionado reparado', '2024-05-08', '2024-05-09', 13, 13),
(14, 'Correia dentada substituída', '2024-05-09', '2024-05-10', 14, 14),
(15, 'Embraiagem reparada', '2024-05-10', '2024-05-12', 15, 15),
(16, 'Verificação e reparação do sistema elétrico', '2024-05-11', '2024-05-11', 16, 16),
(17, 'Suspensão reparada', '2024-05-12', '2024-05-13', 17, 17),
(18, 'Bateria substituída', '2024-05-13', '2024-05-13', 18, 18),
(19, 'Sistema de exaustão reparado', '2024-05-14', '2024-05-15', 19, 19),
(20, 'Filtro de ar substituído', '2024-05-15', '2024-05-15', 20, 20);



insert into mecanico_reparacao (mecanico, reparacao, n_horas) values
(1, 1, 2),
(1, 2, 3),
(4, 3, 4),
(1, 4, 1),
(5, 5, 1),
(3, 6, 2),
(5, 7, 2),
(4, 8, 1),
(5, 9, 3),
(3, 10, 1),
(1, 11, 2),
(1, 12, 1),
(3, 13, 3),
(4, 14, 4),
(5, 15, 5),
(1, 16, 2),
(3, 17, 4),
(4, 18, 1),
(5, 19, 3),
(3, 20, 1);



insert into fornecedor(id_fornecedor, nome, contacto ,email) values
(1, 'Bosch', 253123456, 'bosch@gmail.com'),
(2, 'CarParts', 253908123, 'carparts@gmail.com'),
(3, 'Pecas Auto', 253457098, 'pecasauto@gmail.com'),
(4, 'AutoZone', 253765432, 'autozone@gmail.com'),
(5, 'CarFix', 253876543, 'carfix@gmail.com'),
(6, 'Pecas Rápidas', 253987654, 'pecasrapidas@gmail.com');



insert into encomenda (id_encomenda, mecanico, fornecedor) values
(1, 1, 1),
(2, 1, 3),
(3, 4, 2),
(4, 3, 2),
(5, 5, 3),
(6, 3, 1),
(7, 1, 4),
(8, 1, 1),
(9, 4, 4),
(10, 3, 6),
(11, 5, 5),
(12, 3, 4);



insert into peca (id_peca, marca, tipo, stock, fornecedor) values
(1, 'ABAKUS', 'Radiador', 1, 2),  
(2, 'Mercedes', 'Sensor', 3, 3),  
(3, 'BMW', 'Caixa de velocidades', 1, 3),  
(4, 'Bosch', 'Bateria', 2, 1),  
(5, 'Bosch', 'Farol', 4, 1),  
(6, 'Bosch', 'Lampada', 8, 1),
(7, 'RIDEX', 'Lampada', 6, 2),
(8, 'RIDEX', 'Pastilha de travão', 4, 3), 
(9, 'Michelin', 'Pneu', 4, 2), 
(10, 'Goodyear', 'Pneu', 4, 3),
(11, 'TRW', 'Pastilha de travão', 10, 4),
(12, 'Bosch', 'Filtro de óleo', 20, 1),
(13, 'Delphi', 'Compressor de ar condicionado', 5, 4),
(14, 'Gates', 'Correia dentada', 8, 6),
(15, 'LUK', 'Kit de embraiagem', 4, 5),
(16, 'Denso', 'Bateria', 6, 4),
(17, 'Monroe', 'Amortecedor', 12, 4),
(18, 'Walker', 'Catalisador', 7, 5),
(19, 'Mann', 'Filtro de ar', 15, 4),
(20, 'ATE', 'Disco de travao', 9, 6);



insert into reparacao_peca (reparacao, peca, preco_peca, quantidade_peca) values
(1, 1, 100, 1),
(2, 2, 60, 2),
(3, 3, 1800, 1),
(4, 4, 400, 1),
(6, 5, 60, 2),
(7, 6, 6, 4),
(7, 7, 8, 4),
(9, 8, 90, 2),
(10, 9, 90, 2),
(10, 10, 80, 2),
(11, 11, 40, 2),
(12, 12, 15, 1),
(13, 13, 300, 1),
(14, 14, 100, 1),
(15, 15, 500, 1),
(16, 16, 80, 1),
(17, 17, 120, 2),
(18, 16, 80, 1),
(19, 18, 200, 1),
(20, 19, 20, 1);



insert into encomenda_peca (encomenda, peca, preco_peca, quantidade_peca) values
(1, 4, 300, 1), 
(1, 5, 50, 3), 
(6, 6, 4, 8), 
(2, 2, 50, 3),
(2, 3, 1500, 1), 
(3, 1, 80, 1), 
(3, 7, 5, 6), 
(4, 9, 80, 4),
(5, 8, 80, 4), 
(5, 10, 70, 4),
(7, 11, 35, 10),
(8, 12, 12, 20),
(9, 13, 250, 5),
(10, 14, 90, 8),
(11, 15, 450, 4),
(12, 16, 70, 6),
(7, 17, 110, 12),
(11, 18, 180, 7),
(9, 19, 18, 15),
(10, 20, 85, 9);



-- Nome do cliente e da marca da viatura que necessitou de trocar os pneus
select cliente.nome, marca.nome
from cliente, viatura, reparacao, marca, modelo
where id_cliente = cliente and modelo = id_modelo and marca = id_marca and id_viatura=reparacao.viatura and descricao like '%pneu%'


--Listar o nome do cliente e a matricula da sua viatura em que foram necessárias 2 ou mais peças na sua reparação
select distinct cliente.nome, viatura.matricula
from cliente, viatura, reparacao, reparacao_peca, peca
where id_cliente = cliente and id_viatura = viatura and id_reparacao = reparacao_peca.reparacao and peca=id_peca and (quantidade_peca > 2)


-- Nome do funcionario que, no dia 23 de abril, iniciou a reparação da viatura do José
select funcionario.nome 
from funcionario, mecanico, mecanico_reparacao, reparacao, viatura, cliente
where id_funcionario = id_mecanico and id_mecanico = mecanico_reparacao.mecanico and mecanico_reparacao.reparacao = id_reparacao 
	  and viatura = id_viatura and viatura.cliente = id_cliente and data_inicio = '2024-04-23' and cliente.nome like '%José%'



-- Tipo e marca da peca encomendada mais cara
select tipo, marca, preco_peca
from peca, encomenda_peca
where id_peca = encomenda_peca.peca and encomenda_peca.preco_peca in (select MAX(preco_peca) from encomenda_peca) 



-- Tipo e marca da peca mais barata usada na reparacao
select tipo, marca, preco_peca
from peca, reparacao_peca
where id_peca = reparacao_peca.peca and reparacao_peca.preco_peca in (select min(preco_peca) from reparacao_peca) 



-- Datas de reparacao em que não foram reparadas viaturas da BMW
select distinct data_inicio
from reparacao 
where data_inicio not in (select data_inicio
						  from reparacao, viatura, modelo, marca
                          where id_viatura = reparacao.viatura and id_modelo = modelo and marca = id_marca and marca.nome = 'BMW')



-- Pares de funcionarios que iniciaram uma reparacao no mesmo dia
select x.nome, y.nome, a.data_inicio
from funcionario x, funcionario y, mecanico_reparacao n, mecanico_reparacao m, mecanico o, mecanico p, reparacao a, reparacao b
where x.id_funcionario = o.id_mecanico and o.id_mecanico = n.mecanico and n.reparacao = a.id_reparacao 
	  and y.id_funcionario = p.id_mecanico and p.id_mecanico = m.mecanico and m.reparacao = b.id_reparacao
	  and a.data_inicio = b.data_inicio and x.id_funcionario < y.id_funcionario


--Pares de nomes de fornecedores em que foram encomendados tipos de pecas iguais
select x.nome, y.nome, a.tipo
from fornecedor x, fornecedor y, peca a, peca b
where x.id_fornecedor = a.fornecedor and y.id_fornecedor = b.fornecedor and x.id_fornecedor < y.id_fornecedor and a.tipo = b.tipo
		

-- Criar uma vista em que mostre a descrição da reparação com maior quantidade de peças usadas.
-- Primeiro, criar uma vista com a maior quantidade de peças usadas numa reparacao
-- Depois criar outra vista que mostre a descrição da reparação
create view mais_pecas as
select id_peca, quantidade_peca
from peca, reparacao_peca 
where id_peca = peca and quantidade_peca = (select max(quantidade_peca) from reparacao_peca)

select * from reparacao_mais_pecas

create view reparacao_mais_pecas as 
select descricao, quantidade_peca
from reparacao, mais_pecas
where id_reparacao = id_peca 



-- Tipo e marca da peça com o valor com que foi encomendado e com o valor que foi cobrado na reparação, 
-- mostrando a diferenca de preço
select distinct tipo, marca, encomenda_peca.preco_peca as preco_encomenda, 
		        reparacao_peca.preco_peca as preco_reparacao, (reparacao_peca.preco_peca - encomenda_peca.preco_peca) as diferenca
from peca, encomenda_peca, reparacao_peca
where id_peca = encomenda_peca.peca and id_peca = reparacao_peca.peca



-- Nome do fornecedor, tipo, marca da peça, quantidade e preço de cada peça e preço total da encomenda
select encomenda, fornecedor.nome, tipo, marca, quantidade_peca, preco_peca, (quantidade_peca*preco_peca) as preco_pecas
from encomenda_peca, peca, fornecedor
where id_fornecedor = fornecedor and peca=id_peca 
order by encomenda

