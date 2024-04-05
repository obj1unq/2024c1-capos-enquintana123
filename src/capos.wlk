import castilloDePiedra.*

object rolando {

	const bolsa = #{}
	const property historialDeArtefactos = []
	const capacidadMaxima = 2
	var hogar = castilloDePiedra

	method agarrarSiPuede(artefacto) {
		if (self.hayCapacidad()) {
			self.guardarArtefacto(artefacto)
		}
		self.registrarHistorialDeArtefactos(artefacto)
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
		castilloDePiedra.dejarArtefactos(bolsa)
		bolsa.clear()
	}

	method tieneEncima(artefacto) {
		return bolsa.contains(artefacto)
	}

	method posee(artefacto) {
		return self.tieneEncima(artefacto) or  castilloDePiedra.guarda(artefacto)
	}

}

