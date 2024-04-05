object castilloDePiedra {
	
	const armario = #{}
	
	method dejarArtefactos(artefactos) {
		armario.addAll(artefactos)
	}
	
	method guarda(artefacto) {
		return 
		armario.contains(artefacto)
	}
}
