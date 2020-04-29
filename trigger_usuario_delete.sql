-- ejemplo eliminar trigger

CREATE TRIGGER usuarioDelete
on Usuario
-- instead of => es cuando se realice la accion de eliminar
instead of delete
as 
begin
set nocount on;
insert into Log(idUsuario, dato, fecha, descripcion)
select 1, CONCAT(nombre, ' ', apellidos), GETDATE(), 'Se elimino el registro'
from deleted
end 
go

SELECT * FROM Usuario
go
SELECT * FROM Log
go
DELETE FROM Usuario where idUsuario = 7