/*
 * ### Enemigos

 * En la tierra de Erethia existen 3 poderosos enemigos, de cada uno interesa saber su poder de pelea 
 * y su morada.

 * - Archibaldo tiene 16 de poder de pelea y vive en el palacio de mármol. 
 * - Caterina tiene 28 de poder de pelea y vive en la fortaleza de acero
 * - Astra tiene 14 de poder pelea y vive en la torre de marfil
 *  
 */
object archibaldo {

	var property hogar = palacioDeMarmol

	method poderDePelea() {
		return 16
	}

}
object caterina {
var property hogar = fortalezaDeAcero

	method poderDePelea() {
		return 28
	}
	
}
object astra {
	var property hogar = torreDeMarfil

	method poderDePelea() {
		return 14
	}
	
}
object palacioDeMarmol {
	
}

object fortalezaDeAcero {
	
	
}

object torreDeMarfil {
	
}
object erethia {

	var property enemigos = #{}
	
	method vencibles(capo) {
		return enemigos.filter({enemigo => capo.vencible(enemigo)})
	}
	
	method hogaresConquistables(capo) {
		return self.vencibles(capo).map({enemigo => enemigo.hogar()}).asSet()
	}	
	
	method esPoderoso(capo) {
		return enemigos.all({enemigo => capo.vencible(enemigo)})
	}
}

