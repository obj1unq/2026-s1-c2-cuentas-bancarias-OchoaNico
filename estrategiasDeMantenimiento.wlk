
object ninguna {
  
    method realizarMantenimiento(casa){

    }

}

object minimoEIndispensable {

    var calidadDeViveres = null

    method asignarCalidadDeViveres(calidad) {
        calidadDeViveres = calidad
    }
  
    method realizarMantenimiento(casa){
        if(not(casa.hayViveresSuficientes())){
            casa.comprarViveres((40 - casa.porcentajeDeViveres()), calidadDeViveres)
        }
    }

}

object full {

    method realizarMantenimiento(casa){
        const viveresDeLaCasa = casa.porcentajeDeViveres()
        if (casa.estaEnOrden()){
            casa.comprarViveres((100 - viveresDeLaCasa),5)
        } else {
            if(viveresDeLaCasa < 40){
                casa.comprarViveres((40 - viveresDeLaCasa), 5)
            }
            if (casa.hayQueReparar() && casa.puedeReparar()){
                casa.realizarReparaciones()
            }
        }
    }
}