document.addEventListener("DOMContentLoaded", function () {
  cargaPaginaPrincipal();
  dttblGruposAsignadosAso();
  dttblGruposAsignadosMd();
}); // cierre del addEventListener del inicio de pagina


  function cargaPaginaPrincipal() {
    $.ajax({
      type: "POST",
      async: false,
      url: "docente_mdl.php?accion=carga_pagina_principal",
      data: "",
      success: function (datos) {
        $("#npt_docente_nombres").val(datos[0].nombres_completos);
      },
      error: function () {
        alert("Problema en cargar pagina principal");
      },
    });
  }


  // DTTBL GRUPOS ASIGNADOS ASO
  function dttblGruposAsignadosAso() {
    var listado = $("#tbl_grupos_asignados_aso").DataTable({
      ajax: {
        url: "docente_mdl.php?accion=carga_dttbl_grupos_asignados_aso",
        dataSrc: "",
        data: "",
      },
      columns: [
        { data: "grupo_id" },
        { data: "modulo_nombre" },
        { data: "modulo_semestre" },
        { data: "jornada_nombre" },
        { data: "grupo_fch_inicio" },
        { data: "grupo_fch_fin" },
        { data: null, orderable: false },
      ],
      columnDefs: [
        {
          targets: 6,
          defaultContent:
            "<button class='btn btn-outline-primary btn-sm btnVerGrupoAsignadoAso'><i class='fa-solid fa-pen'></i></button>",
          data: null,
        },
      ],
      language: {
        url: "//cdn.datatables.net/plug-ins/1.13.1/i18n/es-ES.json",
      },
      searching: false,
      info: false,
      paging: false,
      destroy: true,
    });
    // BTN VER GRUPO ASIGNADO ASO
    $("#tbl_grupos_asignados_aso tbody").on("click", "button.btnVerGrupoAsignadoAso", function () {
      let registro = listado.row($(this).parents("tr")).data();
      $("#mdl_calificaciones_grupo").modal("show");
      dttbl_listar_calificaciones_grupo(registro.grupo_id);
    });


  }

  // DTTBL GRUPOS ASIGNADOS MD
  function dttblGruposAsignadosMd() {
    var listado = $("#tbl_grupos_asignados_md").DataTable({
      ajax: {
        url: "docente_mdl.php?accion=carga_dttbl_grupos_asignados_md",
        dataSrc: "",
        data: "",
      },
      columns: [
        { data: "grupo_id" },
        { data: "modulo_nombre" },
        { data: "modulo_semestre" },
        { data: "jornada_nombre" },
        { data: "grupo_fch_inicio" },
        { data: "grupo_fch_fin" },
        { data: null, orderable: false },
      ],
      columnDefs: [
        {
          targets: 6,
          defaultContent:
            "<button class='btn btn-primary btn-sm btnVerGrupoAsignadoMd'><i class='fa-solid fa-pen'></i></button>",
          data: null,
        },
      ],
      language: {
        url: "//cdn.datatables.net/plug-ins/1.13.1/i18n/es-ES.json",
      },
      searching: false,
      info: false,
      paging: false,
      destroy: true,
    });



    // BTN VER GRUPO ASIGNADO MD
    $("#tbl_grupos_asignados_md tbody").on("click", "button.btnVerGrupoAsignadoMd", function () {
      let registro = listado.row($(this).parents("tr")).data();
      $("#mdl_calificaciones_grupo").modal("show");
      dttbl_listar_calificaciones_grupo(registro.grupo_id);
    });




  } // final dttbl de grupos asignados


// MODAL CALIFICACIONES GRUPOS  
function dttbl_listar_calificaciones_grupo(grupo_id) {
  turno_id = $("#npt_turno_id_actual").val();
  user_id = $("#npt_user_id_actual").val();
  let listado = $("#tbl_calificaciones_grupo").DataTable({
    ajax: {
      url: "docente_mdl.php?accion=listar_calificaciones_grupo&grupo_id=" + grupo_id,
      dataSrc: "",
      data: "",
    },
    columns: [
      // { data: "estudiante_id" },
      { data: "estudiante_nombres" },
      { data: "estudiante_apellidos" },
      { data: "cal_nota1" },
      { data: "cal_nota2" },
      { data: "cal_nota3" },
      { data: "cal_nota4" },
      { data: "cal_nota_final" },
      { data: "cal_nota_habilitacion" },
      { data: null, orderable: false },
    ],
    columnDefs: [
      { "width": "300px", "targets": 0 },
      { "width": "300px", "targets": 1 },
      { "width": "10px", "targets": 2 },
      { "width": "10px", "targets": 3 },
      { "width": "10px", "targets": 4 },
      { "width": "10px", "targets": 5 },
      {
        targets: 8,
        defaultContent:
          "<button class='btn btn-primary btn-sm btnAgregarNota'><i class='fa-solid fa-pen'></i></button>",
        data: null,
      },
    ],
    order: [[1, "asc"]],
    language: {
      url: "//cdn.datatables.net/plug-ins/1.13.1/i18n/es-ES.json",
    },
    info: false,
    searching: false,
    paging: false,
    destroy: true,
  });


// BTN MDL AGREGAR NOTA
    $("#tbl_calificaciones_grupo tbody").on("click", "button.btnAgregarNota", function () {
      let registro = listado.row($(this).parents("tr")).data();
      $("#mdl_agregar_nota").modal("show");
      listarNotasEstudiante(registro.estudiante_id, registro.grupo_id);
    });

}

//------------------------
//CICLO MDL AGREGAR NOTAS
//------------------------

//CARGA SLCT CALIFICACION TIPO
$(document).ready(function () {
  $.ajax({
    type: "POST",
    url: "carga_slct_cal_tipo.php",
    success: function (response) {
      $("#slct_nota1_tipo").html(response).fadeIn();
    },
  });
});

// OJO ACTUALIZARLO!!!!
// asigna valor select vendedor al input
$("#slctEdit_vendedor").change(function () {
  $("#nptEdit_vendedor_id").val($(this).val());
});


function listarNotasEstudiante(estudiante_id,grupo_id) {
  $.ajax({
    type: "GET",
    url:
      "docente_mdl.php?accion=listar_notas_estudiante&estudiante_id="+estudiante_id+"&grupo_id="+grupo_id,
    data: "",
    success: function (datos) {
      $("#npt_cal_id").val(datos[0].cal_id);
      $("#npt_estudiante_id").val(datos[0].estudiante_id);
      $("#npt_grupo_id").val(datos[0].grupo_id);
      $("#npt_estudiante_nombres").val(datos[0].estudiante_nombres);

      $("#npt_nota1").val(datos[0].cal_nota1);
      $("#slct_nota1_tipo").val(datos[0].cal_nota1_tipo);
      $("#npt_nota1_tipo").val(datos[0].cal_nota1_tipo);

      $("#npt_nota2").val(datos[0].cal_nota2);
      $("#slct_nota2_tipo").val(datos[0].cal_nota2_tipo);
      $("#npt_nota2_tipo").val(datos[0].cal_nota2_tipo);
      
      $("#npt_nota3").val(datos[0].cal_nota3);
      $("#slct_nota3_tipo").val(datos[0].cal_nota3_tipo);
      $("#npt_nota3_tipo").val(datos[0].cal_nota3_tipo);
      
      $("#npt_nota4").val(datos[0].cal_nota4);
      $("#slct_nota4_tipo").val(datos[0].cal_nota4_tipo);
      $("#npt_nota4_tipo").val(datos[0].cal_nota4_tipo);
      
      $("#npt_nota_final").val(datos[0].cal_nota_final);
      $("#slct_nota_final_tipo").val(datos[0].cal_nota_final_tipo);
      $("#npt_nota_final_tipo").val(datos[0].cal_nota_final_tipo);
    },
    error: function () {
      alert("Problema en listar notas estudiante");
    },
  });

$("#btn_agregar_nota").on("click", function () {
  $("#mdl_agregar_nota").modal("hide");
  let registro = recolectarAgregarNotas();
  modificarNotas(registro);
});


}


// AL CAMBIAR PASA EL VALOR DE SELECT AL INPUT
$("#slct_nota1_tipo").change(function () {
  $("#npt_nota1_tipo").val($(this).val());
});


$("#slct_nota2_tipo").change(function () {
  $("#npt_nota2_tipo").val($(this).val());
});

$("#slct_nota3_tipo").change(function () {
  $("#npt_nota3_tipo").val($(this).val());
});


$("#slct_final_tipo").change(function () {
  $("#npt_final_tipo").val($(this).val());
});


$("#slct_nota1_tipo").change(function () {
  $("#npt_nota1_tipo").val($(this).val());
});







function recolectarAgregarNotas() {
  let registro = {
cal_id: $("#npt_cal_id").val(),
estudiante_id: $("#npt_estudiante_id").val(),
grupo_id: $("#npt_grupo_id").val(),

cal_nota1: $("#npt_nota1").val(),
cal_nota1_tipo: $("#npt_nota1_tipo").val(),

cal_nota2: $("#npt_nota2").val(),
cal_nota2_tipo: $("#npt_nota2_tipo").val(),

cal_nota3: $("#npt_nota3").val(),
cal_nota3_tipo: $("#npt_nota3_tipo").val(),

cal_nota4: $("#npt_nota4").val(),
cal_nota4_tipo: $("#npt_nota4_tipo").val(),

cal_nota_final: $("#npt_nota_final").val(),
cal_nota_final_tipo: $("#npt_nota_final_tipo").val(),
  };
  return registro;
}



function modificarNotas(registro) {
  $.ajax({
    type: "POST",
    url:
      "docente_mdl.php?accion=modificar_notas&cal_id=" +
      registro.cal_id,
    dataSrc: "",
    data: registro,
    success: function (msg) {
      // $("#tbl_domi_por_salir").DataTable().ajax.reload();
      alert("nota agregaa con exito");
    location.reload();
    $("#mdl_calificaciones_grupo").modal("show");

    },
    error: function () {
      alert("Problema modificando");
    },
  });
}