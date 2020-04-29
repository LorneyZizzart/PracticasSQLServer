-- Implementar un cursor basico donde se imprima el primer registro en la tabla Usuario

DECLARE micursor CURSOR
	FOR SELECT * FROM Usuario
OPEN micursor
FETCH NEXT FROM micursor -- asi vamos recorriendo cada usuario
CLOSE micursor -- solo cerrar cuando terminemos la sentencia anterior
DEALLOCATE micursor --liberar cursor para luego volver a declarar el cursor