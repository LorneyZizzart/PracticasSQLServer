-- Implementar una funcion que devuelva una fecha ingresada en letras
-- 15-08-2015 = 15 de Agosto del 2015

-- se evalua si existe la funcion fechaLetras
if object_id('fechaLetras') is not null
begin
	DROP function fechaLetras 
end
go
-- ALTER function fechaLetras(@fecha as date)
create function fechaLetras(@fecha as date)
RETURNS varchar(50)
as
BEGIN
	declare @resultado varchar(50)
	set @resultado = CONCAT(DAY(@fecha), ' de ', datename(month, @fecha), ' del ', YEAR(@fecha))
	RETURN @resultado
END
go
SELECT dbo.fechaLetras('2015-08-08') as [Fecha Actual]
go
SELECT nombre, apellidos, dbo.fechaLetras(fechaNacimiento) as [Fecha de Nacimiento]
FROM Usuario