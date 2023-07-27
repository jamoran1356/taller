
async function guardarvehiculo(){
    const nombre = document.getElementById('nombre').value;
    const identificacion = document.getElementById('identificacion').value;
    const telefono = document.getElementById('telefono').value;
    const correo = document.getElementById('correo').value;

    //datos del vehiculo
    const marca = document.getElementById('marca').value;
    const modelo = document.getElementById('modelo').value;
    const color = document.getElementById('color').value;
    const placa = document.getElementById('placa').value;
    const tipo = document.getElementById('tipo').value;
    const motivo = document.getElementById('motivo').value;

    //agrego al formdata
    let formData= new FormData();
    formData.append("nombre", nombre);
    formData.append("identificacion", identificacion);
    formData.append("telefono", telefono);
    formData.append("correo", correo);
    formData.append("marca", marca);
    formData.append("modelo", modelo);
    formData.append("color", color);
    formData.append("placa", placa);
    formData.append("tipo", tipo);
    formData.append("motivo", motivo);
    console.log(formData)
    try {
        let resp = await fetch('controllers/vehiculos.php?op=__agregar',{
            method: 'POST',
            mode: 'cors',
            cache: 'no-cache',
            body : formData,
            });
            if (resp.ok){
                swal({
                    title: "Exito",
                    text: "El registro ha sido almacenado",
                    icon: "success",
                });
            }
    } catch(error)
        {
            console.log(error);
        }    
}

const btn = document.getElementById('btnvehiculo');

btn.addEventListener('click',function(e){
    e.preventDefault();
    guardarvehiculo();
});