
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


async function MostrarAlumnos(pgact, registros) {
    var pgact = pgact??1;
    var registros = registros ??10;

    let sd = new FormData();
    sd.append("pg", parseInt(pgact));
    sd.append("registros", parseInt(registros));
    try {
      let resp = await fetch("controllers/vehiculos.php?op=__listado",{
        method: 'POST',
        mode: 'cors',
        cache: 'no-cache',
        body: sd
      });
      json = await resp.json();
      if (json.status) {
        let data = json.data;
        document.querySelector('#tbl-vehiculos').innerHTML=""
        let paginas = json.total_paginas;
        let tableBody = document.querySelector("#tbl-vehiculos"); // Obtener el cuerpo de la tabla
        data.forEach(item => {
          let newtr = document.createElement("tr");
          newtr.id = "row_" + item.id;
          newtr.innerHTML = `
            <td class="d-xl-table-cell">${item.placa}</td>
            <td class="d-xl-table-cell">${item.marca}</td>
            <td class="d-xl-table-cell">${item.modelo}</td>
            <td class="d-xl-table-cell">${item.color}</td>
            <td class="d-xl-table-cell">${item.tipo}</td>
            <td class="d-xl-table-cell">${item.nombre}</td>
            <td class="d-xl-table-cell">${item.correo}</td>
            <td class="d-xl-table-cell">${item.fecha_ingreso}</td>
            <td class="d-xl-table-cell"></td>
          `;
          tableBody.appendChild(newtr); // Agregar el registro al cuerpo de la tabla
            const paginacion = document.getElementById('paginas');
            if (pgact == 1) {
                paginacion.innerHTML = `<li class="page-item disabled"><a class="page-link">&laquo;</a></li>`;
            } else {
                let pba = pgact - 1;
                paginacion.innerHTML = `<li class="page-item"><a href="#" class="page-link" onclick="MostrarAlumnos(${pba}, ${registros})">«</a></li>`;
            }
            for (let i = 1; i <= paginas; i++) {
                if (pgact == i) {
                    paginacion.innerHTML += `<li class="page-item"><a class="page-link active" href="#" onclick="MostrarAlumnos(${i}, ${registros})">${i}</a></li>`;
                } else {
                    paginacion.innerHTML += `<li class="page-item"><a href="#" class="page-link" onclick="MostrarAlumnos(${i}, ${registros})">${i}</a></li>`;
                }
            }
            
            if (pgact == paginas) {
                paginacion.innerHTML += `<li class="page-item disabled"><a class="page-link" href="#">»</a></li>`;
            } else {
                let pgn = pgact + 1;
                paginacion.innerHTML += `<li class="page-item"><a href="#" class="page-link" onclick="MostrarAlumnos(${pgn}, ${registros})">»</a></li>`;
            }

        });
      }
    } catch (error) {
      console.log("Ocurrio un error" + error);
    }
  }
  
  // Verificar si existe el elemento de tabla antes de llamar a getTutors()
  if (document.querySelector("#tbl-vehiculos")) {
    const registros = document.getElementById('registros').value;
    MostrarAlumnos(1, registros);
  }

  
  
  if(document.getElementById('registros')){
    const slpg = document.getElementById('registros');
    slpg.addEventListener('change', function(){
        var registrosPagina = this.value;
        MostrarAlumnos(1, registrosPagina);
      });
  }