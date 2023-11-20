import Platos.*

class Cocinero {
	var especialidad
	
	method cocinar() = especialidad.cocinar()
	method catarPlato(plato) = especialidad.darCalificacion(plato)
	
	method cambiarDeEspecialidad(especialidadNueva) {
		especialidad = especialidadNueva
	}
	
	method participar(torneo) = torneo.inscribir(self, self.cocinar())
}

class Pastelero {
	const nivelDeseadoDeDulzor
	
	method calcularPuntaje(plato) = (5 * plato.cantidadDeAzucar()) / nivelDeseadoDeDulzor
	
	method darCalificacion(plato) = if(self.calcularPuntaje(plato) > 10) 10 else self.calcularPuntaje(plato) 
	
	method cocinar() = new Postre(cantidadDeColores = nivelDeseadoDeDulzor/50)
}

class Chef {
	const cantidadDeseadaDeCalorias
	
	method tieneLasCaloriasDeseadas(cantidad) = cantidad == cantidadDeseadaDeCalorias
	
	method cumpleCondiciones(plato) = plato.esBonito() && self.tieneLasCaloriasDeseadas(plato.calorias())
	
	method darCalificacion(plato) = if(self.cumpleCondiciones(plato)) 10 
									else 0
	
	method cocinar() = new Principal(esBonito = true, cantidadDeAzucar = cantidadDeseadaDeCalorias)
}

class Souschef inherits Chef {
	method calcularPuntaje(plato) = plato.calorias() / 100
	
	override method darCalificacion(plato) = if(self.cumpleCondiciones(plato)) 10 
											else if(self.calcularPuntaje(plato) > 6) 6 
											else self.calcularPuntaje(plato)

	override method cocinar() = new Entrada()
}