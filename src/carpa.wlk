
class Carpa {
	const	property	cervezaALaVenta						//instancia de tipo clase Cerveza Rubia/Roja/Negra
	const	property	capacidadPersonas					//num 
	
	var 	property	tieneMusica							//boolean
	var		property	personas		=	#{}				//conjunto de personas
	
	method 	cantidadPersonas()			=	self.personas().size()
	method	hayCapacidad()				=	self.cantidadPersonas()<self.capacidadPersonas()
	method	puedeIngresar(unaPersona)	=	self.hayCapacidad() && not unaPersona.estaEbrio()
	method 	ingresarPersona(unaPersona)	=	if(self.puedeIngresar(unaPersona))
												self.personas().add(unaPersona)
											else if(not self.hayCapacidad())
												self.error("No puede ingresar porque no hay lugar")
											else if(unaPersona.estaEbrio())
												self.error("No puede ingresar borracho")
	method	ebriosEmpedernidos()		=	self.personas().filter{	persona => persona.esEbrioEmpedernido()	}
	method	cantidadEbriosEmpedernidos()=	self.ebriosEmpedernidos().size()
}