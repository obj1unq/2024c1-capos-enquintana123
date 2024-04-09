import castilloDePiedra.*

object rolando {

	// const bolsa = #{} 
	var property bolsa = #{} // SOLO PARA TESTEAR
	const property historialDeArtefactos = []
	var property capacidadMaxima = 2
	const hogar = castilloDePiedra
	var property poderBase = 5

	method encontrar(artefacto) {
		if (self.hayCapacidad()) {
			self.guardarArtefacto(artefacto)
		}
		self.registrarHistorialDeArtefactos(artefacto)
	}

	method poderDePelea() {
		return self.poderBase() + self.poderDeArtefactos()
	}

	method batalla() {
		bolsa.forEach({ artefacto => artefacto.usar()})
		poderBase += 1
	}

	method poderDeArtefactos() {
		return bolsa.sum({ artefacto => artefacto.poder(self) })
	// NO USAR FOREACH PARA CONSULTAS
	}

	method registrarHistorialDeArtefactos(artefacto) {
		historialDeArtefactos.add(artefacto)
	}

	method hayCapacidad() {
		return bolsa.size() < capacidadMaxima
	}

	method guardarArtefacto(artefacto) {
		bolsa.add(artefacto)
	}

	method artefactosEnBolsa() {
		return bolsa.size()
	}

	method dejarArtefactosEnElCastillo() {
		hogar.dejarArtefactos(bolsa)
		bolsa.clear()
	}

	method tieneEncima(artefacto) {
		return bolsa.contains(artefacto)
	}

	method posee(artefacto) {
		return self.tieneEncima(artefacto) or hogar.guarda(artefacto)
	}

	method poderInvocacion() {
		return hogar.poderInvocacion(self)
	}

	method vencible(enemigo) {
		return enemigo.poderDePelea() < self.poderDePelea()
	}

	method tieneArmaLetal(enemigo) {
		return bolsa.any({ artefacto => self.esLetal(artefacto, enemigo) })
	}

	method esLetal(artefacto, enemigo) {
		return artefacto.poder(self) > enemigo.poderDePelea()
	}

	method cantidadDeArmasFatales(enemigo) {
		return bolsa.count({ artefacto => self.esLetal(artefacto, enemigo) })
	}

	method armaLetal(enemigo) {
		return bolsa.find({ artefacto => self.esLetal(artefacto, enemigo) })
	}

	method armasLetales(enemigo) {
		return bolsa.filter({ artefacto => self.esLetal(artefacto, enemigo) })
	}

}

