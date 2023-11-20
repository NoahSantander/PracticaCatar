import Cocineros.*
import Platos.*

class Torneo {
	const catadores = []
	const participantes = new Dictionary()
	
	method inscribir(cocinero, plato) {
		participantes.put(plato, cocinero)
	}
	
	method platoPuntajes(plato) = catadores.map({ catador => catador.catarPlato(plato) })
	
	method puntajeTotal(plato) = self.platoPuntajes(plato).sum()
	
	method puntajeMasAlto(platos) = platos.max({ plato => self.puntajeTotal(plato) })
	
	method platoGanador() = self.puntajeMasAlto(participantes.keys())
	
	method cocineroGanador() = if(participantes.isEmpty()) throw new DomainException(message = "No se puede hacer el torneo porque no hay participantes") 
								else participantes.get(self.platoGanador())
}
