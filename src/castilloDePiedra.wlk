object castilloDePiedra {
	
	var property armario = #{} 
	
	method dejarArtefactos(artefactos) {
		armario.addAll(artefactos)
	}
	
	method guarda(artefacto) {
		return 
		armario.contains(artefacto)
	}
	
	method poderInvocacion(personaje) {
		//return if(not armario.isEmpty()) self.masPoderoso(personaje).poder(personaje) else 0
		return armario.map({artefacto => artefacto.poder(personaje)}).maxIfEmpty(0) 
		//Evito llamar poder de nuevo
	}
	
	method masPoderoso(personaje) {
		return armario.max({artefacto => artefacto.poder()})
	}
}
