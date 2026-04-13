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

object cuentaCombinada {
    
    var cuentaPrimaria = null
    var cuentaSecundaria = null


    method cuentaPrimaria(nuevaCuenta){
        cuentaPrimaria = nuevaCuenta
    }

    method cuentaSecundaria(nuevaCuenta){
        cuentaSecundaria = nuevaCuenta
    }

    method añadirImporte(cantidadAAñadir){
        cuentaPrimaria.añadirImporte(cantidadAAñadir)
    }

    method extraerImporte(cantidadAExtraer){
        const saldoCuentaPrimaria = cuentaPrimaria.saldoActual()
        self.validarExtraccion(cantidadAExtraer)
        
        if (saldoCuentaPrimaria >= cantidadAExtraer){
            cuentaPrimaria.extraerImporte(cantidadAExtraer)
        } else {
            cuentaPrimaria.extraerImporte(saldoCuentaPrimaria)
            cuentaSecundaria.extraerImporte(cantidadAExtraer - saldoCuentaPrimaria)
        }
    }

    method validarExtraccion(cantidadAExtraer){
        if(self.saldoActual() < cantidadAExtraer){
            self.error("No puede extraerse el monto deseado de la cuenta combinada")
        }
    }

    method saldoActual(){
        return cuentaPrimaria.saldoActual().max(0) + cuentaSecundaria.saldoActual().max(0)
    }

}