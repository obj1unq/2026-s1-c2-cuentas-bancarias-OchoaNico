import estrategiasDeMantenimiento.*

object casa {
    var gastosDelMes = 0
    var estrategia = ninguna
    var cuentaDePagos = null
    var costoDeReparacion = 0
    var cantidadDeViveres = 0

    method asignarEstrategia(nuevaEstrategia) {
        estrategia = nuevaEstrategia
    }

    method costoDeReparacion(){
        return costoDeReparacion
    }

    method asignarViveres(cantidad){ //Uso exclusivo para tests
        cantidadDeViveres = cantidad
    }

    method hayViveresSuficientes(){
        return cantidadDeViveres >= 40
    }

    method estaEnOrden(){
        return self.hayViveresSuficientes() && not(self.hayQueReparar())
    }

    method comprarViveres(porcentaje, calidad){
        self.validarCompraDeViveres(porcentaje)
        self.pagarGastoDe(calidad * porcentaje)
        cantidadDeViveres = cantidadDeViveres + porcentaje
    }

    method validarCompraDeViveres(porcentaje){
        if (100 < (self.porcentajeDeViveres() + porcentaje)){
            self.error("La compra excede la capacidad de viveres maxima")
        }
    }

    method porcentajeDeViveres(){
        return cantidadDeViveres
    }

    method dañosPorUnMontoDe(montoDeReparacion){
        costoDeReparacion = costoDeReparacion + montoDeReparacion
    }

    method realizarReparaciones (){
        self.pagarGastoDe(costoDeReparacion)
        costoDeReparacion = 0
    }

    method puedeReparar(){
        return(cuentaDePagos.saldoActual() >= costoDeReparacion)
    }

    method hayQueReparar(){
        return costoDeReparacion > 0
    }

    method setGastoDelMes(cantidadDeGastos) {
        gastosDelMes = cantidadDeGastos
    }

    method gastosDelMes(){
        return gastosDelMes
    }

    method pagarGastoDe(cantidadAPagar){
        cuentaDePagos.extraerImporte(cantidadAPagar)
        gastosDelMes = gastosDelMes + cantidadAPagar
    }

    method asignarCuentaDeGastos (cuentaAAsignar){
        cuentaDePagos = cuentaAAsignar
    }

    method siguienteMes(){
        estrategia.realizarMantenimiento(self)
        gastosDelMes = 0
    }

}