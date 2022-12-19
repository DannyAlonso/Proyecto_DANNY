create database GYM_PRO_DAN

use GYM_PRO_DAN
Create table Usuarios
(
Codigo_Usuario int identity primary key, 
Nombre varchar (50)null,
Correo varchar (50) null,
Tipo varchar (20) null,
Clave varchar (4) null,
constraint UQ_Correo unique(Correo)
)


create table Clientes
(
Codigo_Clientes int identity primary key, 
Nombre_Clientes varchar (10) null,
Apellidos varchar (40) null,
Telefono varchar(8) null,
)


create table Factura
(
Codigo_Factura  int identity primary key,
Fecha datetime default getdate(),
Total money,
IV_Total float, 
Cliente int
Constraint FK_Codigo_Factura foreign key(Codigo_Factura) references Clientes (Codigo_Clientes)
)
 

create table Producto
(
Codigo_Producto int identity primary key,
Nombre varchar (100),
Precio money,
)

create table Provincia
(
Codigo_Provincia int identity primary key,
Nombre_Provincia varchar(100)
constraint FK_Codigo_Provincia foreign key (Codigo_Provincia)references Clientes(Codigo_Clientes)
)

create table Canton 
(
Codigo_Canton int identity primary key,
Nombre_Canton varchar (100)
constraint FK_Codigo_Canton foreign key (Codigo_Canton) references Provincia (Codigo_Provincia) 
)

create table Distrito
(
Codigo_Distrito int identity primary key, 
Nombre_Distrito varchar(100),
constraint FK_Codigo_Distrito foreign key (Codigo_Distrito) references Canton (Codigo_Canton)
)
select cl.Nombre_Clientes, p.Nombre_Provincia, c.Nombre_Canton, d.Codigo_Distrito, d.Nombre_Distrito 
from Canton c 
inner join Distrito d on d.Codigo_Distrito = c.Codigo_Canton 
inner join Clientes cl on cl.Codigo_Clientes = c.Codigo_Canton 
inner join Provincia p on p.Codigo_Provincia = cl.Codigo_Clientes

create table Direcciones
(
Codigo_Direcciones int identity primary key,
Comentarios_de_Direccion varchar (300),
constraint FK_codigo_direcciones foreign key (Codigo_Direcciones) references Clientes (Codigo_Clientes),
constraint FK_codigo_Direccion foreign key (Codigo_Direcciones) references Provincia (Codigo_Provincia),
constraint fk_Cod_direcciones foreign key (Codigo_Direcciones) references Canton (Codigo_Canton),
constraint FK_codigoDirecciones foreign key (Codigo_Direcciones) references Distrito (Codigo_Distrito)
)
select cl.Nombre_Clientes, p.Nombre_Provincia, c.Nombre_Canton, d.Nombre_Distrito, di.Codigo_Direcciones, di.Comentarios_de_Direccion 
from Clientes cl 
inner join Provincia p on p.Codigo_Provincia = cl.Codigo_Clientes-------- darles vuelta
inner join Canton c on c.Codigo_Canton = p.Codigo_Provincia
inner join Distrito d on d.Codigo_Distrito = c.Codigo_Canton
inner join Direcciones di on di.Codigo_Direcciones = d.Codigo_Distrito

create table DET_Factura 
(
Codigo_DET_Factura int identity primary key,
linea nchar(10)null,
Codigo_Producto int null,
Cantidad int null,
Precio_Unitario money null,
IV int null,
Sub_total float null
constraint FK_Codigo_DET_Factura foreign key (Codigo_DET_Factura) references Factura (Codigo_Factura)
)


-----------------------------------------------------------------------------------------------------------
create procedure ValidarUsuario
@Correo varchar(50),
@Clave varchar(4)
as
begin
select Nombre, Correo, Tipo, Clave from Usuarios where correo = @Correo and clave = @Clave
end
-----------------------------------------------------------------------------------------------------------
CREATE procedure ConsultaUsuario
as
begin
select Codigo_Usuario, Nombre, Correo, Tipo, Clave from Usuarios
end

-----------------------------------------------------------------------------------------------------------
create procedure InsertarUsuario
@Nombre varchar (50)='ninguno',
@Correo varchar(50)='ninguno',
@Tipo nvarchar(20)='ninguno',
@Clave varchar(4)='000'
as
begin
insert into Usuarios (Nombre,Correo,Tipo,Clave) values (@Nombre,@Correo,@Tipo,@Clave)
end
-----------------------------------------------------------------------------------------------------------
create procedure BorrarUsuario
@Nombre nvarchar (50)
as
begin
   delete Usuarios where Nombre = @Nombre
end
-----------------------------------------------------------------------------------------------------------
create procedure ActualizarUsuario
@Codigo int,
@Nombre varchar (50),
@Correo varchar(50),
@Tipo nvarchar(20),
@Clave varchar(4)
as
begin
update Usuarios set Correo=@Correo,Clave=@Clave,Nombre=@Nombre,Tipo=@Tipo
where Codigo_Usuario=@Codigo 
end
-----------------------------------------------------------------------------------------------------------


create procedure ConsultaUsuarioFiltro
@nombre varchar(50)
---@codigo int //con la de abajo 
as
begin
select Codigo_Usuario, Nombre, Correo, Tipo, Clave from Usuarios
where Nombre like '%'+ @nombre +'%'
--where id = @codigo// una opcion
end
exec ConsultaUsuarioFiltro 'danny'
-----------------------------------------------------------------------------------------------------------


exec ActualizarUsuario 13,'Rosa','rosa@gmail.com','Administrador','1111'
exec InsertarUsuario 'Marta','Marta@uh.com','Regular','1212'
select Nombre, Correo, Tipo, Clave from Usuarios where correo ='danny@gmail.com' and clave='8888'
exec ConsultaUsuario
select * from Usuarios 
exec BorrarUsuario Marta

-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------
CREATE procedure ConsultaClientes
as
begin
select Codigo_Clientes, Nombre_Clientes, Apellidos, Telefono from Clientes
end

-----------------------------------------------------------------------------------------------------------
create procedure InsertarClientes
@Nombre varchar (10)='ninguno',
@Apellidos varchar(40)='ninguno',
@Telefono varchar(8)
as
begin
insert into Clientes(Nombre_Clientes,Apellidos,Telefono) values (@Nombre,@Apellidos,@Telefono)
end
-----------------------------------------------------------------------------------------------------------
create procedure BorrarCliente
@Nombre nvarchar (10)
as
begin
   delete Clientes where Nombre_Clientes = @Nombre
end
-----------------------------------------------------------------------------------------------------------
create procedure ActualizarClientes
@Codigo int,
@Nombre varchar (10),
@Apellidos varchar(40),
@Telefono varchar(8)

as
begin
update Clientes set Nombre_Clientes=@Nombre,Apellidos=@Apellidos,Telefono=@Telefono
where Codigo_Clientes=@Codigo 
end
-----------------------------------------------------------------------------------------------------------

create procedure SeleccionarCliente
@Codigo int 
as
begin
select Codigo_Clientes, Nombre_Clientes, Apellidos, Telefono from Clientes where Codigo_Clientes = @Codigo
end

-----------------------------------------------------------------------------------------------------------


exec ActualizarClientes 1,'Nair','Castro Calvo','88897271'
exec InsertarClientes'Roy','Castro Campos','88221247'
exec ConsultaClientes
exec BorrarCliente Roy

-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------

CREATE procedure ConsultaProvincia
as
begin
select Codigo_Provincia, Nombre_Provincia from Provincia
end

-----------------------------------------------------------------------------------------------------------
create procedure InsertarProvincia
@Nombre varchar (100)='ninguno'
as
begin
insert into Provincia(Nombre_Provincia) values (@Nombre)
end
-----------------------------------------------------------------------------------------------------------
create procedure BorrarProvincia
@codigo int

as
begin
   delete Provincia where Codigo_Provincia = @codigo
end
-----------------------------------------------------------------------------------------------------------
create procedure ActualizarProvincia
@Codigo int,
@Nombre varchar (100)
as
begin
update Provincia set Nombre_Provincia=@Nombre
where Codigo_Provincia=@Codigo 
end

exec ActualizarProvincia 2,'Nair'
exec InsertarProvincia'	San Jose'
exec ConsultaProvincia
exec BorrarProvincia 3

-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------

CREATE procedure ConsultaCanton
as
begin
select Codigo_Canton, Nombre_Canton from Canton
end

-----------------------------------------------------------------------------------------------------------
create procedure InsertarCanton
@Nombre varchar (100)='ninguno'
as
begin
insert into Canton(Nombre_Canton) values (@Nombre)
end
-----------------------------------------------------------------------------------------------------------
create procedure BorrarCanton
@codigo int

as
begin
   delete Canton where Codigo_Canton = @codigo
end
-----------------------------------------------------------------------------------------------------------
create procedure ActualizarCanton
@Codigo int,
@Nombre varchar (100)
as
begin
update Canton set Nombre_Canton=@Nombre
where Codigo_Canton=@Codigo 
end

exec ActualizarCanton 2,'guadalupe'
exec InsertarCanton'Coronado'
exec ConsultaCanton
exec BorrarCanton 3

-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------



CREATE procedure ConsultaDistrito
as
begin
select Codigo_Distrito, Nombre_Distrito from Distrito
end

-----------------------------------------------------------------------------------------------------------
create procedure InsertarDistrito
@Nombre varchar (100)='ninguno'
as
begin
insert into Distrito(Nombre_Distrito) values (@Nombre)
end
-----------------------------------------------------------------------------------------------------------
create procedure BorrarDistrito
@codigo int

as
begin
   delete Distrito where Codigo_Distrito = @codigo
end
-----------------------------------------------------------------------------------------------------------
create procedure ActualizarDistrito
@Codigo int,
@Nombre varchar (100)
as
begin
update Distrito set Nombre_Distrito=@Nombre
where Codigo_Distrito=@Codigo 
end

exec ActualizarDistrito 2,'san rafael'
exec InsertarDistrito'san isidro'
exec ConsultaDistrito
exec BorrarDistrito 3

-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------


CREATE procedure ConsultaDirecciones
as
begin
select Codigo_Direcciones, Comentarios_de_Direccion from Direcciones
end

-----------------------------------------------------------------------------------------------------------
create procedure InsertarDirecciones
@Nombre varchar (100)='ninguno'
as
begin
insert into Direcciones(Comentarios_de_Direccion) values (@Nombre)
end
-----------------------------------------------------------------------------------------------------------

create procedure ActualizarDirecciones
@Codigo int,
@Nombre varchar (300)
as
begin
update Direcciones set Comentarios_de_Direccion=@Nombre
where Codigo_Direcciones=@Codigo 
end

exec ActualizarDirecciones 2,'Nair'
exec InsertarDirecciones 'casa de porton cafe'
exec ConsultaDirecciones 
exec BorrarDirecciones  3

-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------



CREATE procedure ConsultaProducto
as
begin
select Codigo_Producto, Nombre, Precio from Producto
end

-----------------------------------------------------------------------------------------------------------
create procedure InsertarProducto
@Nombre varchar (100)='ninguno',
@Precio money null
as
begin
insert into Producto(Nombre,Precio) values (@Nombre,@Precio)
end
-----------------------------------------------------------------------------------------------------------
create procedure BorrarProducto
@codigo int

as
begin
   delete Producto where Codigo_Producto = @codigo
end
-----------------------------------------------------------------------------------------------------------
create procedure ActualizarProducto
@Codigo int,
@Nombre varchar (100),
@Precio money null
as
begin
update Producto set Nombre=@Nombre, Precio=@Precio
where Codigo_Producto=@Codigo 
end
-----------------------------------------------------------------------------------------------------------
create procedure SeleccionarProducto
@Codigo int 
as
begin
select Codigo_Producto, Nombre, Precio from Producto where Codigo_Producto = @Codigo
end
-----------------------------------------------------------------------------------------------------------

exec SeleccionarProducto 5
exec ActualizarProducto 6,'paño','3000'
exec InsertarProducto'vitaminassss','2000'
exec InsertarProducto'camisas','1500'
exec InsertarProducto'agua','500'
exec InsertarProducto'mani','1000'
exec InsertarProducto'batidos','2500.22'
exec ConsultaProducto
exec BorrarProducto 10

-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------


create procedure Insertarfactura
  @Total money null,
  @IV_Total float null,
  @Codigo_Cliente int null, 
  @Fecha datetime   
  as 
  begin
    insert into Factura (Fecha,total,IV_Total,Cliente) values (@Fecha,@Total,@IV_Total,@Codigo_Cliente)
  
  end  
  
-------------------------------------------------------------------------------------------------------
 

CREATE procedure ConsultaFactura
as
begin
select Codigo_Factura, Fecha, Total, IV_Total, Cliente from Factura
end

-----------------------------------------------------------------------------------------------------------
create procedure BorrarFactura
@codigo int

as
begin
   delete Factura where Codigo_Factura = @codigo
end
-----------------------------------------------------------------------------------------------------------
create procedure ActualizarFactura
 @Codigo int,
 @Total money null,
  @IV_Total float null,
  @Codigo_Cliente int null, 
  @Fecha datetime  
as
begin
update Factura set Fecha=@Fecha, Total=@Total, IV_Total=@IV_Total, Cliente=@Codigo_Cliente
where Codigo_Factura=@Codigo 
end
-----------------------------------------------------------------------------------------------------------
create procedure SeleccionarFactura
@Codigo int 
as
begin
select Codigo_Factura, Fecha, Total, IV_Total, Cliente from Factura where Codigo_Factura = @Codigo
end
-----------------------------------------------------------------------------------------------------------


exec Insertarfactura '2500','200','2','2022/12/17'
exec ConsultaFactura
 select top 1 * from Factura order by Codigo_Factura desc


-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------


create procedure InsertarDETFactura
  @Linea nchar(10) null,
  @Codigo_Producto int null,
  @Cantidad int null,
  @Precio_Unitario money null,
  @IVA int null,
  @Sup_Total float null
  as 
  begin
    Declare @Codigo int
	set @Codigo = (select top 1 Codigo_Factura from Factura order by Codigo_Factura desc)
    insert into DET_Factura(Linea,Codigo_Producto,Cantidad,Precio_Unitario,IV,Sub_Total) values (@Linea,@Codigo_Producto,@Cantidad,@Precio_Unitario,@IVA,@Sup_Total)
    end  
  
-------------------------------------------------------------------------------------------------------

create procedure ConsultaDETFacutura
as
begin
select Codigo_DET_Factura, linea, Codigo_Producto, Cantidad, Precio_Unitario, IV, Sub_total from DET_Factura
end

-----------------------------------------------------------------------------------------------------------
create procedure BorrarDETFactura
@codigo int

as
begin
   delete DET_Factura where Codigo_DET_Factura= @codigo
end
-----------------------------------------------------------------------------------------------------------
create procedure ActualizarDETFactura
@codigo int,
 @Linea nchar(10) null,
 @Codigo_Producto int null,
 @Cantidad int null,
 @PrecioUnitario money null,
 @IVA int,
  @Sup_Total float null
as
begin 
update DET_Factura set Linea=@Linea,Codigo_Producto=@Codigo_Producto,Cantidad=@Cantidad,Precio_Unitario=@PrecioUnitario,IV=@IVA, Sub_total=@Sup_Total
where Codigo_DET_Factura=@Codigo 
end
-----------------------------------------------------------------------------------------------------------
create procedure SeleccionarDETFactura
@Codigo int 
as
begin
select Codigo_DET_Factura, Linea,Codigo_Producto,Cantidad,Precio_Unitario,IV, Sub_total from DET_Factura where Codigo_DET_Factura = @Codigo
end
-----------------------------------------------------------------------------------------------------------

exec ConsultaDETFacutura


-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
-------------------------------------------+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------------------------------------------------------------
 select m.Codigo_Factura,m.Cliente, m.Fecha,d.linea,d.Codigo_Producto, d.Cantidad, d.Precio_Unitario,d.IV,m.IV_Total, m.Total
 from Factura m 
 inner join DET_Factura d on m.Codigo_Factura = d.Codigo_DET_Factura 
-----------------------------------------------------------------------------------------------------------

