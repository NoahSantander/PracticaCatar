class Plato {
	method esBonito() 
	
	method cantidadDeAzucar() 
	
	method calorias() = self.cantidadDeAzucar() * 3 + 100
}

class Entrada inherits Plato {
	override method esBonito() = true
	
	override method cantidadDeAzucar() = 0
}

class Principal inherits Plato {
	const esBonito
	const cantidadDeAzucar
	
	override method esBonito() = esBonito
	override method cantidadDeAzucar() = cantidadDeAzucar
}

class Postre inherits Plato {
	const cantidadDeColores
	
	override method esBonito() = cantidadDeColores > 3 
	override method cantidadDeAzucar() = 120
}