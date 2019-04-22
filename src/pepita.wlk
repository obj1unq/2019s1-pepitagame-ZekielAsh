import ciudades.*
import wollok.game.*

object pepita {
	var property energia = 100
	var property ciudad = buenosAires 

	var property position = game.at(3,3)
	var property amiga = "Vieja amiga"
	method image() = if (energia > 100) "pepita-gorda-raw.png" else "pepita.png"

	method come(comida) {
		energia = energia + comida.energia()
	}
	
	method volaHacia(unaCiudad) {
		if (self.position() != unaCiudad.position()) {
			self.move(unaCiudad.position())
			ciudad = unaCiudad
		}
		else {
			game.say(self, "Ya estoy en " + unaCiudad + "!")
			ciudad = unaCiudad
		}
	}
	
	method volaYCome(comida){
		self.come(comida)
		game.removeVisual(comida)
		self.move(comida.position())
	}

	method energiaParaVolar(distancia) = 15 + 5 * distancia

	method move(nuevaPosicion) {
		if (self.puedoVolarHacia (nuevaPosicion)){
		energia -= self.energiaParaVolar(position.distance(nuevaPosicion))
		self.position(nuevaPosicion) 
		} else {
		game.say(self, "Dame de comer primero!")
		}
	}	
	
	method puedoVolarHacia (nuevaPosicion){
		return energia > self.energiaParaVolar(position.distance(nuevaPosicion))
	}
	
	method nuevaAmiga(ave) {
		if (amiga != ave){
		game.say(self, "Hola " + ave.nombre() + "!")
		amiga = ave
		} 
	}
}

object pepona{
	method nombre () = "pepona"
	method image () = "pepona.png"
	method position () = game.at(2,7)
}

object pipa{
	method nombre () = "pipa"
	method image () = "pepitaCanchera.png"
	method position () = game.at(6,6)
}

