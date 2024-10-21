object casco{
    method defensa() = 10 
}

object escudo{
    method defensa(unGladiador) {
        return 5 + unGladiador.destreza() * 0.1
    }
}