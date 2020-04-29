create proc reporteUsuarios -- create procedimiento almacenado
as
declare @idUsuario char(5), @nombreCompleto varchar(500), @pais varchar(500)

declare segundoCursor cursor
	for SELECT us.idUsuario, (us.nombre+' '+us.apellidos) as nombreCompleto, pa.nombre as Pais
		FROM Usuario us inner join Pais pa
		ON us.idPais = pa.idPais

OPEN segundoCursor

FETCH segundoCursor INTO @idUsuario,@nombreCompleto,@pais
-- Imprimir la cabecera del reporte
print 'CODIGO	NOMBRE_COMPLETO		PAIS	'
print '-------------------------------------'
-- Agregar los detalles
WHILE @@FETCH_STATUS=0
BEGIN 
	print @idUsuario+space(5)+@nombreCompleto+space(5)+@pais+space(5)
	FETCH segundoCursor INTO @idUsuario, @nombreCompleto, @pais	
END
CLOSE segundoCursor
DEALLOCATE segundoCursor

-- solo llamamos al procedimiento almacenado

reporteUsuarios