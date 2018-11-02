
class Jarra {
	const   property	capacidadLts						//num
	const 	property	cerveza								//instancia de tipo clase cerveza Rubia/Roja/Negra
	
	method	contenidoAlcohol()	=	self.capacidadLts()*self.cerveza().graduacion()
	method	origen()			=	cerveza.origen()
}
