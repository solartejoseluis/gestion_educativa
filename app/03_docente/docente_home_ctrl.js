document.addEventListener("DOMContentLoaded", function () {
  cargaPaginaPrincipal();
  dttblGruposAsignadosAso();
  dttblGruposAsignadosMd();



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

    // BTN VER GRUPO ASIGNADO ASO
    $("#tbl_grupos_asignados_aso tbody").on("click", "button.btnVerGrupoAsignadoAso", function () {
      let registro = listado.row($(this).parents("tr")).data();
      $("#mdl_calificaciones_grupo").modal("show");
      dttbl_listar_calificaciones_grupo(registro.grupo_id);
    });


    // BTN VER GRUPO ASIGNADO MD
    $("#tbl_grupos_asignados_md tbody").on("click", "button.btnVerGrupoAsignadoMd", function () {
      let registro = listado.row($(this).parents("tr")).data();
      $("#mdl_calificaciones_grupo").modal("show");
      dttbl_listar_calificaciones_grupo(registro.grupo_id);
    });

  } // final dttbl de grupos asignados

}); // cierre del addEventListener del inicio de pagina


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
      { data: "estudiante_nombres" },
      { data: "estudiante_apellidos" },
      { data: "cal_nota1" },
      { data: "cal_nota2" },
      { data: "cal_nota3" },
      { data: "cal_nota4" },
      { data: "cal_notadef" },
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
      // dttbl_listar_calificaciones_grupo(registro.grupo_id);
    });



}