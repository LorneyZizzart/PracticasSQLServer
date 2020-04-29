-- Implementar una funcion de tabla en linea que muestre los registros de la tabla usuario
-- dependiendo del pais
if object_id('usuarioPais') is not null
begin
	DROP function usuarioPais 
end
go
CREATE function usuarioPais(@pais as varchar(30))
RETURNS table
AS
	RETURN (SELECT us.nombre, us.apellidos, pa.nombre as pais
			FROM Usuario us inner join Pais pa
			on us.idPais = pa.idPais
			WHERE pa.nombre = @pais )

SELECT * FROM dbo.usuarioPais('Argentina')
