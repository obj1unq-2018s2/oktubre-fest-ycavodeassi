class Cerveza {
	const	property 	lupulo					//num gramos de lupulo por litro de cerveza
	const 	property	origen					//string
	var		graduacion							//num porcentaje de graduacion alcoholica
	
	method 	graduacion()
}

class Rubia inherits Cerveza {
	
	override method	graduacion()	=	graduacion
}

class Negra inherits Cerveza {
	
	override method graduacion()	=	graduacionReglamentaria.graduacion().min(self.lupulo()*2)
}

class Roja inherits Negra {
	
	override method graduacion()	=	super()*1.25
}

object graduacionReglamentaria {
	var 	property	graduacion				//num porcentaje  x*1.25 = 0.08
	
}

