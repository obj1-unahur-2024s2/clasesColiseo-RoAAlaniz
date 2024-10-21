import armas.*
import armadura.*
import grupos.*

class Mirmillones {
    var  vida = 100
    const property arma
    var property armadura
    var property fuerza 

    method vida() = vida
    method destreza() = 15
    method atacar(unGladiador) {
        unGladiador.recibirAtaque(self.valorAtaque())
    }
    method valorAtaque() = arma.valorAtaque() + fuerza
    method defensa() = armadura.defensa() + self.destreza()
    method recibirAtaque(unValor) {
        vida = vida - 0.max(unValor - self.defensa())
    }
    method crearUnGrupo(otroGladiador) {
        const nuevoGrupo = new Grupo(
            gladiadores=[self,otroGladiador],
            nombre = "mirmillolandia"
        )
        return nuevoGrupo
    }
}

class Dimachaerus {
    var  vida = 100
    const property arma = []
    var property destreza 

    method fuerza() = 10
    method vida() = vida
    method pelear(unGladiador) {
        self.atacar(unGladiador)
        unGladiador.atacar(self)
    }
    method atacar(unGladiador){
        unGladiador.recibirAtaque(self.poderDeAtaque())       
        destreza = destreza + 1
    }
    method poderDeAtaque() = self.fuerza() + arma.sum( 
        { arma => arma.poderDeAtaque()}
        )
    method defensa() = destreza * 0.5
    method recibirAtaque(unValor) {
        vida = vida - 0.max(unValor - self.defensa())
    }
    method puedePelear() = vida > 0
    method crearUnGrupo(otroGladiador) {
        const nuevoGrupo = new Grupo(
            gladiadores=[self,otroGladiador],
            nombre = "D-" + (self.poderDeAtaque() + otroGladiador.poderDeAtaque())
        )
        return nuevoGrupo   
    }
}