
class Persona {
	const	property	peso					//num
	const	property	nivelDeAguante			//num
	const	inventarioDeCervezas	=	[]		//lista de jarra de cervezas compradas
	
	var		property	gustaMusica				//boolean
	
	//abstract
	method nacionalidad()
	method gustaCerveza(unaCerveza)		
	//getters
	method	cervezasCompradas()		=	inventarioDeCervezas
	//defs
	method	estaEbrio()				=	(self.alcoholIngerido()*self.peso()) > self.nivelDeAguante()
	method	esEbrioEmpedernido()	=	self.estaEbrio() && self.tieneCervezasGrandes()
	method 	tieneCervezasGrandes()	=	self.cervezasCompradas().all{	jarra => jarra.capacidadLts()>=1	}
	method	quiereEntrarA(unaCarpa)	=	self.gustaCerveza(unaCarpa.cervezaALaVenta()) && 
											(unaCarpa.tieneMusica() == self.gustaMusica())	
	method	puedeEntrarA(unaCarpa)	=	self.quiereEntrarA(unaCarpa) && unaCarpa.puedeIngresar(self)
	method	alcoholIngerido()		=	self.cervezasCompradas().sum{	jarra => jarra.contenidoAlcohol()	}
	method	esPatriota()			= 	self.cervezasCompradas().all{ 	jarra => jarra.origen()==self.nacionalidad()	}
	method	comprarJarra(unaJarra)	=	self.cervezasCompradas().add(unaJarra)
}

class Belga inherits Persona {
	
	override	method	nacionalidad()				=	"Belga"
	override	method	gustaCerveza(unaCerveza)	=	unaCerveza.lupulo()>0.04	
}

class Checo inherits Persona {
	
	override	method	nacionalidad()				=	"Checo"
	override	method	gustaCerveza(unaCerveza)	=	unaCerveza.graduacion()>0.08
}

class Aleman inherits Persona {
	
	override	method	nacionalidad()				=	"Aleman"	
	override	method 	gustaCerveza(unaCerveza)	=	true
	override	method	quiereEntrarA(unaCarpa)		=	super(unaCarpa) && unaCarpa.cantidadPersonas().even()
}