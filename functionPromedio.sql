create function calcularPromedio(@valor1 as decimal(10,2), @valor2 as decimal(10,2))
RETURNS decimal(10,2)
as
begin
	declare @resultado decimal(10,2)
	set @resultado = (@valor1 + @valor2) / 2
	RETURN @resultado
end
go
select dbo.calcularPromedio(12,13) as promedio
go
print 'Promedio: ' + cast (dbo.calcularPromedio(12 , 13) as char(5))

