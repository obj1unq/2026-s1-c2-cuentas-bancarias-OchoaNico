object casa {
    var gastosDelMes = 0
    var cuentaDePagos = null


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
        gastosDelMes = 0
    }

}