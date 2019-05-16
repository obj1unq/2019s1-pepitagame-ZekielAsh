import comidas.*
import pepita.*
import wollok.game.*

object roque {

	var property position = game.at(4, 5)
	var property mochila = "No tengo comida"

	method image() = "jugador.png"

	method move(nuevaPosicion) {
		self.position(nuevaPosicion)
	}

	method agarrarComida(comida) {
		self.soltarComida()
		game.removeVisual(comida)
		mochila = comida
	}

	method soltarComida() {
		if (self.mochila() != "No tengo comida") {
			game.addVisualIn(mochila, self.posicionRandom())
		}
	}

	method posicionRandom() = game.at(1.randomUpTo(10).roundUp(), 1.randomUpTo(10).roundUp())

	method alimentar(ave) {
		if (self.mochila() != "No tengo comida") {
			ave.come(mochila)
			game.addVisualIn(mochila, self.posicionRandom())
			mochila = "No tengo comida"
		}
	}

}

