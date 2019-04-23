import comidas.*
import pepita.*
import wollok.game.*

object roque {
	var property position = game.at(4,5)
	var property comidaActual = "No tengo comida"
	
	method image () = "jugador.png"
	
	method move(nuevaPosicion){
		self.position(nuevaPosicion)
	}
	
	method agarrarComida(comida){
		self.soltarComida()
		game.removeVisual(comida)
		comidaActual = comida
	}
	
	method soltarComida(){
		if (self.comidaActual() != "No tengo comida"){
		game.addVisualIn(comidaActual, self.posicionRandom()) 
		}
	}
	
	method posicionRandom() {
		return game.at(1.randomUpTo(10).roundUp(), 1.randomUpTo(10).roundUp())
	}
	
	method alimentarAPepita(){
		
	}
}
