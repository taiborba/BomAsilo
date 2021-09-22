drop table paciente cascade;
drop table funcionario cascade;
drop table medicamentos cascade;
drop table familiar cascade;
drop table endereco cascade;
drop table financeiro cascade;
drop table especialidade cascade;
drop table prontuario cascade;
drop table clinico cascade;
drop table medicamento cascade;
drop table prescricao cascade;
drop table rotina cascade;
drop table cargo cascade;
drop table usuario cascade;


create table cargo
(idCargo serial not null,
descCargo varchar(50) not null,
primary key (idCargo));

create table usuario(
emailUsuario varchar(40) not null,
login varchar (75) not null,
senha varchar (30) not null,
tipoAcesso varchar (20) not null,
primary key (login));

--Primary key do usuario foi alterado para login, pois o e-mail pode vir a mudar e a chave primaria não pode ser alterada, só excluida. Dificultando uma possivel manutenção
create table endereco
(idEndereco serial not null,
cep varchar(14) not null,
rua varchar(40) not null,
nr int not null,
complemento varchar(40),
bairro varchar(20) not null,
cidade varchar(20) not null,
uf varchar(14) not null,
primary key (idEndereco));

--O CPF não pode ser a chave primaria do endereço, pois um endereço pode ser vinculado a mais de um cpf(pessoas da mesma familia)

create table funcionario
(idFuncionario serial not null,
nome varchar(20) not null,
cpfFuncionario varchar(14) not null,
rg varchar(14) not null,
idCargo int not null,
regProfissional varchar(25) not null,
dataAdmissao date not null,
dataDesliga date,
loginFuncion varchar(40) not null,
foneFuncionario varchar(14),
enderecoFuncionario  serial not null,
primary key (cpfFuncionario));

--A chave primaria foi alterada para simples para facilitar, pois não há necessidade de ter uma chave composta nessa tabela

alter table funcionario add constraint fk_func_cargo
foreign key (idCargo) references cargo (idCargo);

alter table funcionario add constraint fk_func_usuario
foreign key (loginFuncion) references usuario (login);

alter table funcionario add constraint fk_func_endereco
foreign key (enderecoFuncionario) references endereco (idEndereco);

create table familiar
(idFamiliar serial not null,
nome varchar(40) not null,
cpfFamiliar varchar(14) not null,
rg varchar(14) not null,
foneFixo varchar(20),
foneCelular varchar(20) not null,
nomeContato varchar(40) not null,
loginFamiliar varchar(40) not null,
enderecoFamiliar serial not null,
cpfPaciente varchar(14) not null,
primary key (cpfFamiliar));

alter table familiar add constraint fk_familiar_usuario
foreign key (loginFamiliar) references usuario (login);

alter table familiar add constraint fk_familiar_endereco
foreign key (enderecoFamiliar) references endereco (idEndereco);

alter table familiar add constraint fk_familiar_cpfPaciente
foreign key (cpfPaciente) references paciente (cpfPaciente);

create table paciente
(idPaciente serial not null,
nome varchar(40) not null,
cpfPaciente varchar(14) not null,
rg varchar(14) not null,
dataNascimento date not null,
cpfFamiliar varchar(14) not null,
quarto int not null,
fotoPaciente varchar(40),
enderecoPaciente serial not null,
primary key (cpfPaciente));

alter table paciente add constraint fk_paciente_endereco
foreign key (enderecoPaciente) references endereco (idEndereco);

alter table paciente add constraint fk_paciente_familiar
foreign key (cpfFamiliar) references familiar (cpfFamiliar);


create table prontuario
(idProntuario serial not null,
tipoSangue varchar(3),
peso decimal(3,2),
altura decimal(2,2),
imc decimal(3,2),
limitCognitiva boolean,
limitLocomocao boolean,
limitVisao boolean,
limitAudicao boolean,
limitOutras varchar(40),
descAlergia varchar(40),
descOcupacao varchar(40),
cpfPaciente varchar(14) not null,
primary Key (idProntuario));

alter table prontuario add constraint fk_pront_paciente
foreign key (cpfPaciente) references paciente (cpfPaciente);

create table especialidade
(idEspecialidade serial not null,
descEspecialidade varchar(40) not null,
primary key (idEspecialidade));

create table clinico
(idClinico serial not null,
nomeClinico varchar(40) not null,
codRegistro varchar(40) not null,
idEspecialidade int not null,
primary key(idClinico));

alter table clinico add constraint fk_clinico_espec
foreign key (idEspecialidade) references especialidade (idEspecialidade);

create table medicamento
(idMedicamento serial not null,
nomeMedicamento varchar(40) not null,
indControlado boolean,
primary key (idMedicamento));

create table prescricao
(idPrescricao serial not null,
idClinico int not null,
dataConsulta date not null,
horaConsulta varchar(5),
descOrientacao varchar(40),
descPosologia varchar(40) not null,
idMedicamento int not null,
primary key (idPrescricao));

alter table prescricao add constraint fk_presc_medicamento
foreign key (idMedicamento) references medicamento (idMedicamento);

alter table prescricao add constraint fk_presc_clinico
foreign key (idClinico) references clinico (idClinico);

create table rotina
(idEvento serial not null,
cpfPaciente varchar(14) not null,
dataEvento date not null,
horaInicio varchar(5) not null,
horaFinal varchar(5) not null,
descEvento varchar(40) not null,
status varchar(20) not null,
qtdIntervalo int not null,
idPrescricao int not null,
primary key (idEvento));

alter table rotina add constraint fk_rotina_presc
foreign key (idPrescricao) references prescricao (idPrescricao);

alter table rotina add constraint fk_rotina_paciente
foreign key (cpfPaciente) references paciente (cpfPaciente);

--FIM DO CADASTRO BASE

--INICIO DAS MANUTENÇÕES

insert into usuario (emailusuario,login,senha,tipoacesso) values ('teste@teste.com','teste','123','administrador');

select * from funcionario f ;

alter table funcionario rename column loginFuncion to loginFuncionario;
alter table funcionario add emailFuncionario varchar(40) not null ;


insert into usuario (emailusuario,login,senha,tipoacesso) values ('teste@teste.com','teste','123','administrador');
insert into cargo (desccargo) values ('Administrativo');
insert into endereco (cep, rua, nr, bairro, cidade, uf) values ('89057001', 'Rua Francisco', '2627', 'Fortaleza', 'Blumenau', 'SC');

select * from endereco;

select * from familiar;

select * from paciente p2 ;

ALTER TABLE paciente DROP COLUMN cpfFamiliar;
ALTER TABLE paciente DROP COLUMN quarto;
alter table paciente add nomeContato varchar(40) not null ;
alter table paciente add foneContato varchar(20) not null ;
alter table paciente add quarto varchar(15) not null ;

alter table familiar add idPaciente int not null ;
ALTER TABLE familiar DROP COLUMN nomecontato;

alter table familiar add constraint fk_familiar_endereco
foreign key (enderecoFamiliar) references endereco (idEndereco);


alter table prontuario drop column peso;
alter table prontuario drop column altura;
alter table prontuario drop column imc;
alter table prontuario drop column idprontuario;

alter table prontuario add peso decimal(5,2);
alter table prontuario add altura decimal(5,2);
alter table prontuario add imc decimal(5,2);
alter table prontuario add idprontuario serial not null primary key;

select * from medicamento m ;

select * from prontuario p ;

select * from familiar f ;


