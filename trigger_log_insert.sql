-- Creando un log

CREATE trigger logUsuario
on Usuario
for insert
as 
begin 
SET NOCOUNT ON; -- evita que se muestre el muestre el sms al hacer un insert (1 rows(s) affected)
INSERT INTO Log(idUsuario, dato, fecha, descripcion) SELECT 1, CONCAT(nombre,' ',apellidos), GETDATE(), 'Se inserto un nuevo usuario'
from inserted
end

INSERT INTO Usuario VALUES(3, 'Josias', 'Gutierrez', '2016-12-17')

SELECT * FROM Log
