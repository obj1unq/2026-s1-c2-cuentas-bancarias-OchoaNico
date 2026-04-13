object cuentaCorriente{
    var saldo = 0


    method saldoActual(){
        return saldo
    }

    method extraerImporte(cantidadAExtraer){
        saldo = saldo - cantidadAExtraer
    }

    method añadirImporte(cantidadAAñadir){
        saldo = saldo + cantidadAAñadir
    }

}

object cuentaConGastos {
    var saldo = 0
    var costoDeOperacion = 0


    method setCostoDeOperacion(nuevoCosto) {
        costoDeOperacion = nuevoCosto
    }

    method saldoActual(){
        return saldo
    }

    method extraerImporte(cantidadAExtraer){
        saldo = saldo - cantidadAExtraer
    }

    method añadirImporte(cantidadAAñadir){
        self.validarImporte(cantidadAAñadir)
        saldo = saldo + (cantidadAAñadir - costoDeOperacion)
    }

    method validarImporte(cantidadAAñadir){
        if(not(self.puedoImportar(cantidadAAñadir))){
            self.error("No puedo importar la suma ya que "+ cantidadAAñadir +"<"+ costoDeOperacion)
        }
    }

    method puedoImportar(cantidadAAñadir){
        return (cantidadAAñadir > costoDeOperacion)
    }

}