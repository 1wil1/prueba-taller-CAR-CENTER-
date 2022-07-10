
--CREATE
IF OBJECT_ID('sp_INSERTAR_CLIENTE') IS NOT NULL
BEGIN 
    DROP PROC sp_INSERTAR_CLIENTE
END 
GO

CREATE PROCEDURE sp_INSERTAR_CLIENTE
@dcto int,
@tipoDcto varchar(3),
@nombre1 varchar(15),
@nombre2 varchar(15),
@apellido1 varchar(15),
@apellido2 varchar(15),
@direccion varchar(30),
@email varchar(50),
@cel int
AS 
BEGIN
	INSERT INTO CLIENTE (
		[dcto,
		[nombre1,
		[tipoDcto,
		[nombre2,
		[apellido1 ,
		[apellido2 ,
		[direccion ,
		[email ,
		[cel 
	)
	VALUES (
		@dcto,
		@nombre1,
		@tipoDcto,
		@nombre2,
		@apellido1 ,
		@apellido2 ,
		@direccion ,
		@email ,
		@cel 
	) 
END
GO

--READ
IF OBJECT_ID('sp_SELECT_CLIENTE') IS NOT NULL
BEGIN 
    DROP PROC sp_SELECT_CLIENTE
END 
GO
CREATE PROC sp_SELECT_CLIENTE
    @dcto int
AS 
BEGIN 
    SELECT * FROM CLIENTE WHERE dcto = @dcto
END
GO



--UPDATE

IF OBJECT_ID('sp_UPDATE_CLIENTE') IS NOT NULL
BEGIN 
DROP PROC sp_UPDATE_CLIENTE
END 
GO
CREATE PROC sp_UPDATE_CLIENTE
	@dcto int,
	@tipoDcto varchar(3),
	@nombre1 varchar(15),
	@nombre2 varchar(15),
	@apellido1 varchar(15),
	@apellido2 varchar(15),
	@direccion varchar(30),
	@email varchar(50),
	@cel int
AS 
BEGIN 
 
UPDATE CLIENTE
SET 
	nombre1 = @nombre1,
	tipoDcto = @tipoDcto,
	nombre2 = @nombre2,
	apellido1 = @apellido1 ,
	apellido2 = @apellido2 ,
	direccion = @direccion ,
	email = @email ,
	cel = @cel 
WHERE  dcto = @dcto
END
GO

--DELETE


IF OBJECT_ID('sp_DELETE_CLIENTE') IS NOT NULL
BEGIN 
DROP PROC sp_DELETE_CLIENTE
END 
GO

CREATE PROC sp_DELETE_CLIENTE 
    @dcto int
AS 
BEGIN 
DELETE
FROM   CLIENTE
WHERE  dcto = @dcto
 
END
GO
