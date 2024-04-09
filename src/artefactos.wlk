object espadaDelDestino {

	var primeraVez = true

	method poder(personaje) {
		return personaje.poderBase() * self.coeficiente(personaje)
	}

	method coeficiente(personaje) {
		return if (primeraVez) 1 else 0.5
	}

	method usar() {
		primeraVez = false
	}

}

object collarDivino {

	var usos = 0

	method poder(personaje) {
		return 3 + self.extra(personaje)
	}

	method extra(personaje) {
		return if (personaje.poderBase() > 6) usos else 0
	}

	method usar() {
		usos += 1
	}

}

object armaduraDeAceroValyrio {

	method poder(personaje) {
		return 6
	}

	method usar() {
	}

}

object libroDeHechizos {

	var property hechizos = []

	method poder(personaje) {
		return if (not hechizos.isEmpty()) hechizos.first().poder(personaje) else 0
	}

	method usar() {
		if (not hechizos.isEmpty()) hechizos.remove(hechizos.first())
	}

}

object bendicion {

	method poder(personaje) {
		return 4
	}

}

object invisibilidad {

	method poder(personaje) {
		return personaje.poderBase()
	}

}

/*
 * - Invocación: Aporta el valor del artefacto más poderoso para el héroe que posee en su morada. 
 * (el artefacto del castillo no sufre ningún efecto por la batalla)
 */
object invocacion {
	method poder(personaje) {
		return personaje.poderInvocacion()
	}
}

