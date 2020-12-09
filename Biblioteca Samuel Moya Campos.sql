/*Creamos la base de datos y la utilizamos*/
CREATE DATABASE Biblioteca;
USE Biblioteca;
/*Deshacerse de todas las tablas y sus datos*/
DROP TABLE Bibliotecario;
DROP TABLE PEDIDOS;
DROP TABLE LIBROS;
DROP TABLE PRESTAMOS;
DROP TABLE USUARIOS;
/*Activar en caso de emergencia*/

/*Tabla Usuarios*/
CREATE TABLE USUARIOS(
Codigo_Usuarios INT NOT NULL UNIQUE,
Nombre  VARCHAR(45) NOT NULL,
Apellido VARCHAR(45),
DNI  VARCHAR(45) NOT NULL,
Domicilio VARCHAR(45),
Ciudad VARCHAR(45),
Provincia VARCHAR(45),
CONSTRAINT PK_USUARIOS PRIMARY KEY (Codigo_Usuarios)
); 
 /*Tabla Prestamos*/
 CREATE TABLE PRESTAMOS(
 Codigo_Prestamos INT UNIQUE,
 Codigo_Usuarios INT NOT NULL,
 Codigo_Libro INT NOT NULL UNIQUE,
 Fecha_Alquiler DATE NOT NULL,
 Fecha_Vencimiento DATE,
 CONSTRAINT PK_Prestamos PRIMARY KEY(Codigo_Prestamos),
FOREIGN KEY (Codigo_Usuarios) REFERENCES USUARIOS(Codigo_Usuarios) ON DELETE CASCADE
 );
/*Tabla Libros*/
CREATE TABLE LIBROS(
Codigo_Libros INT NOT NULL UNIQUE,
Nombre_Libros VARCHAR(55),
Editorial VARCHAR(55),
Autor VARCHAR(55),
Genero VARCHAR(55),
Fecha_Edicion DATE,
PRECIO DECIMAL(60,38) NOT NULL,
SAGA VARCHAR(55),
BIBLIOTECA VARCHAR(30) DEFAULT'Biblioteca El Libro Magico',
PRIMARY KEY (Codigo_Libros)
);
/*Tabla Pedidos*/
CREATE TABLE PEDIDOS(
Codigo_Pedidos INT NOT NULL AUTO_INCREMENT,
Codigo_Libros INT NOT NULL,
Fecha_Envio DATE NOT NULL,
Fecha_Recibo DATE,
CONSTRAINT PK_Prestamos PRIMARY KEY(Codigo_Pedidos, Codigo_libros)
);
/*Tabla Bibliotecario*/
CREATE TABLE BIBLIOTECARIO(
Codigo_Bibliotecario INT,
NOMBRE VARCHAR(55),
APELLIDO VARCHAR(55),
Puesto_Biblioteca VARCHAR(55),
Seguridad_Social VARCHAR(55),
Usuarios_Codigo INT NULL,
Pedidos_Codigo INT NULL,
Libros_Codigo INT NULL,
CONSTRAINT PK_Bibliotecario PRIMARY KEY(Codigo_Bibliotecario),
CONSTRAINT FK_Usuarios FOREIGN KEY(Usuarios_Codigo) REFERENCES USUARIOS(Codigo_Usuarios) ON DELETE CASCADE,
CONSTRAINT FK_Pedidos FOREIGN KEY(Pedidos_Codigo) REFERENCES PEDIDOS(Codigo_Pedidos) ON DELETE SET NULL,
CONSTRAINT FK_Libros FOREIGN KEY(Libros_Codigo) REFERENCES LIBROS(Codigo_Libros) ON DELETE RESTRICT
);

/*Introducir los datos en la tabla Usuarios*/
INSERT INTO USUARIOS(Codigo_Usuarios, Nombre, Apellido, DNI, Domicilio, Ciudad, Provincia) VALUES(23,'Ramon','Benitez','24123451E','Calle Narvaez, 14','Valdemoro','Madrid');
INSERT INTO USUARIOS(Codigo_Usuarios, Nombre, Apellido, DNI, Domicilio, Ciudad, Provincia) VALUES(30,'Juan','Campos', '23124125G', 'Calle Lodares, 2', 'Madrid', 'Madrid');
INSERT INTO USUARIOS(Codigo_Usuarios, Nombre, Apellido, DNI, Domicilio, Ciudad, Provincia) VALUES(40,'Fran', 'Rosa', '32939941I', 'Calle Ceuta, 7', 'Tembleque', 'Toledo');
INSERT INTO USUARIOS(Codigo_Usuarios, Nombre, Apellido, DNI, Domicilio, Ciudad, Provincia) VALUES(50, 'Alba', 'Catena','10293994K', 'Calle Melilla, 20', 'Albacete', 'Albacete');
INSERT INTO USUARIOS(Codigo_Usuarios, Nombre, Apellido, DNI, Domicilio, Ciudad, Provincia) VALUES(13,'Rosa', 'Perez', '41231231L', 'Calle Marin, 16', 'Jativa', 'Valencia');
INSERT INTO USUARIOS(Codigo_Usuarios, Nombre, Apellido, DNI, Domicilio, Ciudad, Provincia) VALUES(14, 'Monchi', 'Quintanilla', '50129319G', 'Calle Lorca, 60', 'Madrid', 'Madrid');
INSERT INTO USUARIOS(Codigo_Usuarios, Nombre, Apellido, DNI, Domicilio, Ciudad, Provincia) VALUES(20, 'Nesto', 'Marcante', '12931293M', 'Calle La Mancha,14', 'Bonillo', 'Albacete');
INSERT INTO USUARIOS(Codigo_Usuarios, Nombre, Apellido, DNI, Domicilio, Ciudad, Provincia) VALUES(11, 'Toni', 'Garcia',	'12351243E', 'Calle Araceli, 33', 'Aranjuez', 'Madrid');
INSERT INTO USUARIOS(Codigo_Usuarios, Nombre, Apellido, DNI, Domicilio, Ciudad, Provincia) VALUES(17, 'Claudia', 'Lopez', '41231243M', 'Calle 12 Rosas, 22', 'Mataró', 'Barcelona');

/*Introducir los datos en la tabla Prestamos*/
INSERT INTO PRESTAMOS(Codigo_Prestamos, Codigo_Usuarios, Codigo_Libro, Fecha_Alquiler, Fecha_Vencimiento) VALUES(62, 23, 10,'2018-10-23', NULL);
INSERT INTO PRESTAMOS(Codigo_Prestamos, Codigo_Usuarios, Codigo_Libro, Fecha_Alquiler, Fecha_Vencimiento) VALUES(32, 30,12, '2019-12-24','2022-12-07');
INSERT INTO PRESTAMOS(Codigo_Prestamos, Codigo_Usuarios, Codigo_Libro, Fecha_Alquiler, Fecha_Vencimiento) VALUES(12, 40, 13, '2016-03-01', '2021-05-04');
INSERT INTO PRESTAMOS(Codigo_Prestamos, Codigo_Usuarios, Codigo_Libro, Fecha_Alquiler, Fecha_Vencimiento) VALUES(42, 50, 14,'2018-11-05', '2021-12-12');
INSERT INTO PRESTAMOS(Codigo_Prestamos, Codigo_Usuarios, Codigo_Libro, Fecha_Alquiler, Fecha_Vencimiento) VALUES(53, 13, 15,'2015-05-06', '2019-12-07');
INSERT INTO PRESTAMOS(Codigo_Prestamos, Codigo_Usuarios, Codigo_Libro, Fecha_Alquiler, Fecha_Vencimiento) VALUES(63, 14, 17, '2014-05-12', NULL);
INSERT INTO PRESTAMOS(Codigo_Prestamos, Codigo_Usuarios, Codigo_Libro, Fecha_Alquiler, Fecha_Vencimiento) VALUES(93, 20, 18, '2020-10-16', '2022-07-03');
INSERT INTO PRESTAMOS(Codigo_Prestamos, Codigo_Usuarios, Codigo_Libro, Fecha_Alquiler, Fecha_Vencimiento) VALUES(11,11,	22,	'2019-02-05','2021-09-07');
INSERT INTO PRESTAMOS(Codigo_Prestamos, Codigo_Usuarios, Codigo_Libro, Fecha_Alquiler, Fecha_Vencimiento) VALUES(10,17,	30,	'2016-07-05', '2019-07-05');
INSERT INTO PRESTAMOS(Codigo_Prestamos, Codigo_Usuarios, Codigo_Libro, Fecha_Alquiler, Fecha_Vencimiento) VALUES(23,17,	33,	'2019-12-04',NULL);
INSERT INTO PRESTAMOS(Codigo_Prestamos, Codigo_Usuarios, Codigo_Libro, Fecha_Alquiler, Fecha_Vencimiento) VALUES(55,40,	36,	'2017-03-02','2021/12/21');
INSERT INTO PRESTAMOS(Codigo_Prestamos, Codigo_Usuarios, Codigo_Libro, Fecha_Alquiler, Fecha_Vencimiento) VALUES(35,30,	28,	'2018-08-04','2019-06-05');
INSERT INTO PRESTAMOS(Codigo_Prestamos, Codigo_Usuarios, Codigo_Libro, Fecha_Alquiler, Fecha_Vencimiento) VALUES(77,23,	32,	'1998-02-04','1998-03-02');
INSERT INTO PRESTAMOS(Codigo_Prestamos, Codigo_Usuarios, Codigo_Libro, Fecha_Alquiler, Fecha_Vencimiento) VALUES(89,11,	11,	'2016-07-06','2020-07-06');
INSERT INTO PRESTAMOS(Codigo_Prestamos, Codigo_Usuarios, Codigo_Libro, Fecha_Alquiler, Fecha_Vencimiento) VALUES(4,	17,	24,	'2016-08-14', NULL);
INSERT INTO PRESTAMOS(Codigo_Prestamos, Codigo_Usuarios, Codigo_Libro, Fecha_Alquiler, Fecha_Vencimiento) VALUES(5,	23,	29,'2007-11-15','2009-12-01');

/*Introducir los datos en la tabla Libros*/
INSERT INTO LIBROS(Codigo_Libros, Nombre_Libros, Editorial, autor, Genero, Fecha_Edicion, Precio, Saga, Biblioteca) VALUES(10,	'Todo Saldrá Bien',	'Duome',	'Emilio Ortiz Pulido',	'Policiaca',	'2016-02-23','14.6','Perretes',DEFAULT);
INSERT INTO LIBROS(Codigo_Libros, Nombre_Libros, Editorial, autor, Genero, Fecha_Edicion, Precio, Saga, Biblioteca) VALUES(12, 'Seis patas, Dos amigos', 'Duome','Emilio Ortiz Pulido',	'Inspiradora',	'2017-03-02',	'12.9',	'Perretes',DEFAULT);
INSERT INTO LIBROS(Codigo_Libros, Nombre_Libros, Editorial, autor, Genero, Fecha_Edicion, Precio, Saga, Biblioteca) VALUES(13,	'A traves de Mis pequeños ojos',	'Duome',	'Emilio Ortiz Pulido',	'Inspiradora',	'2016-02-03',	'11.9',	'Perretes',DEFAULT);
INSERT INTO LIBROS(Codigo_Libros, Nombre_Libros, Editorial, autor, Genero, Fecha_Edicion, Precio, Saga, Biblioteca) VALUES(14,	'Quijote de la mancha',	'C.La Mancha',	'Cervantes',	'Caballeros',	'1616-12-03', '6.5',NULL, DEFAULT);
INSERT INTO LIBROS(Codigo_Libros, Nombre_Libros, Editorial, autor, Genero, Fecha_Edicion, Precio, Saga, Biblioteca) VALUES(15,	'Tormenta de Espadas',	'Bantan',	'George.R.Martin',	'Fantasia',	'2012-02-15',	'28.3',	'Juego tronos' ,DEFAULT);
INSERT INTO LIBROS(Codigo_Libros, Nombre_Libros, Editorial, autor, Genero, Fecha_Edicion, Precio, Saga, Biblioteca) VALUES(17,	'Festin de Cuervos',	'Bantan',	'George.R.Martin',	'Fantasia',	'2012-03-05',	'33',	'Juego tronos',DEFAULT);
INSERT INTO LIBROS(Codigo_Libros, Nombre_Libros, Editorial, autor, Genero, Fecha_Edicion, Precio, Saga, Biblioteca) VALUES(18,	'Danza de Dragones',	'Bantan',	'George.R.Martin', 'Fantasia',	'2012-04-05',	'35',	'Juego tronos',DEFAULT);
INSERT INTO LIBROS(Codigo_Libros, Nombre_Libros, Editorial, autor, Genero, Fecha_Edicion, Precio, Saga, Biblioteca) VALUES(22,	'Juego de tronos',	'Bantan',	'George.R.Martin',	'Fantasia', '2019-02-19','37',	'Juego tronos',DEFAULT);
INSERT INTO LIBROS(Codigo_Libros, Nombre_Libros, Editorial, autor, Genero, Fecha_Edicion, Precio, Saga, Biblioteca) VALUES(30,	'It',	'Anaya',	'Steven King',	'Miedo',	'2012-06-21',	'11.9',	NULL ,DEFAULT);
INSERT INTO LIBROS(Codigo_Libros, Nombre_Libros, Editorial, autor, Genero, Fecha_Edicion, Precio, Saga, Biblioteca) VALUES(33,	'Carrie','Anaya',	'Steven King',	'Miedo',	'2012-09-04',	'12.4',	NULL,DEFAULT);
INSERT INTO LIBROS(Codigo_Libros, Nombre_Libros, Editorial, autor, Genero, Fecha_Edicion, Precio, Saga, Biblioteca) VALUES(36,	'El Resplandor',	'Anaya',	'Steven King',	'Miedo',	'2012-04-05',	'15.7',	NULL,DEFAULT);
INSERT INTO LIBROS(Codigo_Libros, Nombre_Libros, Editorial, autor, Genero, Fecha_Edicion, Precio, Saga, Biblioteca) VALUES(28,	'La Piedra Filosofal',	'Pearson', 'J.K.Rowling', 'Aventura',	'2014-03-16',	'21.3',	'Harry Potter',DEFAULT);
INSERT INTO LIBROS(Codigo_Libros, Nombre_Libros, Editorial, autor, Genero, Fecha_Edicion, Precio, Saga, Biblioteca) VALUES(32,	'El caliz del fuego',	'Pearson','J.K.Rowling', 'Aventura',	'2014-03-16',	'21.3',	'Harry Potter',DEFAULT);
INSERT INTO LIBROS(Codigo_Libros, Nombre_Libros, Editorial, autor, Genero, Fecha_Edicion, Precio, Saga, Biblioteca) VALUES(11,	'Las reliquias de la muerte',	'Pearson',	'J.K.Rowling',	'Aventura',	'2014-01-06',	'16.7',	'Harry Potter',DEFAULT);
INSERT INTO LIBROS(Codigo_Libros, Nombre_Libros, Editorial, autor, Genero, Fecha_Edicion, Precio, Saga, Biblioteca) VALUES(24,	'Codigo Da Vinci	','Book',	'Dan Brown',	'Aventura',	'2015-08-12',	'15.2',	NULL,DEFAULT);
INSERT INTO LIBROS(Codigo_Libros, Nombre_Libros, Editorial, autor, Genero, Fecha_Edicion, Precio, Saga, Biblioteca) VALUES(29,	'El Alquimista',	'Brasilero','Paulo Cohelo',	'Filosofia','2015-08-09','14',	NULL,DEFAULT);

/*Introducir los datos en la tabla Pedidos*/
INSERT INTO PEDIDOS(Codigo_Pedidos, Codigo_Libros, Fecha_Envio, Fecha_Recibo) VALUES(22,7,'2020-03-07','2020-10-10');
INSERT INTO PEDIDOS(Codigo_Pedidos, Codigo_Libros, Fecha_Envio, Fecha_Recibo) VALUES(33,8,'2020-06-07',NULL);
INSERT INTO PEDIDOS(Codigo_Pedidos, Codigo_Libros, Fecha_Envio, Fecha_Recibo) VALUES(34,9,'2020-09-03',NULL);
INSERT INTO PEDIDOS(Codigo_Pedidos, Codigo_Libros, Fecha_Envio, Fecha_Recibo) VALUES(35,10,'2020-06-02','2020-01-01');

/*Introducir Datos en la tabla Bibliotecario*/
INSERT INTO Bibliotecario(Codigo_Bibliotecario,Nombre,Apellido,Puesto_Biblioteca,Seguridad_Social,Usuarios_Codigo,Pedidos_Codigo,Libros_Codigo) VALUES(7,'Pepe','Lluic','jefe',NULL,NULL,NULL,NULL);
INSERT INTO Bibliotecario(Codigo_Bibliotecario,Nombre,Apellido,Puesto_Biblioteca,Seguridad_Social,Usuarios_Codigo,Pedidos_Codigo,Libros_Codigo) VALUES(5,'Marco','Aurelio','jefe',NULL,NULL,NULL,NULL);
INSERT INTO Bibliotecario(Codigo_Bibliotecario,Nombre,Apellido,Puesto_Biblioteca,Seguridad_Social,Usuarios_Codigo,Pedidos_Codigo,Libros_Codigo) VALUES(3,'Gonzalo','Benitez','jefe',NULL,NULL,NULL,NULL);
INSERT INTO Bibliotecario(Codigo_Bibliotecario,Nombre,Apellido,Puesto_Biblioteca,Seguridad_Social,Usuarios_Codigo,Pedidos_Codigo,Libros_Codigo) VALUES(4,'Raul','Florentino','jefe',NULL,NULL,NULL,NULL);

/*Si un pedido llega, se mira cual es su codigo, y se introduce la fecha en la que ha llegado el pedido*/
UPDATE PEDIDOS
SET Fecha_recibo='2020-10-10'
WHERE Codigo_Pedidos=22;

/*Si un libro esta rebajado se le baja el precio*/
UPDATE LIBROS
SET PRECIO='20.3'
WHERE Nombre_Libros='Juego de tronos';

/*Si un Usuario se da de baja, se le elimina de la tabla */
DELETE FROM Usuarios
WHERE Nombre LIKE'Ramon';


/*Si un cliente pide cual es la saga entera de un libro se busca*/
SELECT Nombre_Libros FROM Libros WHERE SAGA='Harry Potter';

/*Se necesita saber que clientes son de una ciudad, para saber hasta donde llega la biblioteca*/
SELECT * FROM USUARIOS 
WHERE Provincia <>'Madrid';

/*Se necesita saber que libros aun no se han devuelto desde el 2019*/
SELECT * FROM PRESTAMOS
WHERE Fecha_Vencimiento >='2019-01-01'; 

/*Se necesita saber que pedido de libros aun no se ha encontrado*/
SELECT * FROM Pedidos 
WHERE Fecha_Recibo IS NULL;

/*Se necesita saber cual es el precio medio de una saga*/
SELECT Saga, AVG(Precio) FROM Libros WHERE SAGA='Juego tronos'; 


CREATE USER jefe@192.198.15.1 IDENTIFIED BY 'jefe';
CREATE USER reponedor@192.198.15.1 IDENTIFIED BY 'empleado';
CREATE USER cajero@192.198.15.1 IDENTIFIED BY 'empleado';
CREATE USER Librero@192.198.15.1 IDENTIFIED BY 'empleado';


GRANT SELECT ON Biblioteca.* TO jefe@192.198.15.1;

GRANT ALL ON Libros TO reponedor@192.198.15.1;
GRANT ALL ON Pedidos TO reponedor@192.198.15.1;



GRANT ALL ON USUARIOS TO cajero@192.198.15.1;
GRANT ALL ON PEDIDOS TO cajero@192.198.15.1;
GRANT ALL ON LIBROS TO cajero@192.198.15.1;
GRANT ALL ON PRESTAMOS TO cajero@192.198.15.1;

GRANT ALL ON LIBROS TO Librero@192.198.15.1;


SELECT * FROM USUARIOS WHERE Nombre like'RAMON';


ALTER TABLE Libros ADD Inventario INT(30);



UPDATE Prestamos SET Fecha_Vencimiento=('2020-12-12') WHERE Codigo_Prestamos like 62;

ALTER TABLE bibliotecario MODIFY Seguridad_Social INT(55);
