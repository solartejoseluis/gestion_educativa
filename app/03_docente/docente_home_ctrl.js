document.addEventListener("DOMContentLoaded", function () {
  dttblGruposAsignadosAso();
  dttblGruposAsignadosMd();
  cargaPaginaPrincipal();


  function cargaPaginaPrincipal() {
    $.ajax({
      type: "POST",
      async: false, // hacer que sea asincronico para sarle tiempo a ajax para cargar variable
      url: "docente_mdl.php?accion=carga_pagina_principal",
      data: "",
      success: function (datos) {
        $("#npt_docente_nombres").val(datos[0].nombres_completos);
        //He tomado el valor del input
        // turno_id = $("#npt_turno_id_actual").val();
        // user_id = $("#npt_user_id_actual").val();
      },
      error: function () {
        alert("Problema en cargar acceso");
      },
    });
  }




  // DTTBL GRUPOS ASIGNADOS ASO
  function dttblGruposAsignadosAso() {
    var listadoDomiPorSalir = $("#tbl_grupos_asignados_aso").DataTable({
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
            "<button class='btn btn-outline-primary btn-sm btnVerGrupoAsignadoMd'><i class='fa-solid fa-pen'></i></button>",
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
      // recuperarRegistro(registro.grupo_id);
      $("#mdl_registro_calificaciones").modal("show");
      dttbl_listar_grupo(registro.grupo_id);
    });


    // BTN VER GRUPO ASIGNADO MD
    $("#tbl_grupos_asignados_md tbody").on("click", "button.btnVerGrupoAsignadoMd", function () {
      let registro = listado.row($(this).parents("tr")).data();
      // recuperarRegistro(registro.grupo_id);
      $("#mdl_registro_calificaciones").modal("show");
    });

  } // final dttbl de grupos asignados

}); // cierre del addEventListener del inicio de pagina



function dttbl_listar_grupo(grupo_id) {
  turno_id = $("#npt_turno_id_actual").val();
  user_id = $("#npt_user_id_actual").val();
  let listado = $("#tbl_grupo_notas").DataTable({
    ajax: {
      url: "docente_mdl.php?accion=listar_grupo_notas&grupo_id=" + grupo_id,
      dataSrc: "",
      data: "",
    },
    columns: [
      { data: "estudiante_nombres" },
      { data: "estudiante_apellidos" },
      // { data: "nota_1" },
      // { data: "nota_2" },
      // { data: "nota_3" },
      // { data: "nota_4" },
      // { data: "definitiva" },
      // { data: "acumulado" },
    ],
    columnDefs: [
      // {
      //   targets: 13,
      //   defaultContent:
      //     "<button class='btn btn-primary btn-sm btnVerDomiEntregado' id='btn_ver_domi_entregado'><i class='fa-solid fa-pen'></i></button>",
      //   data: null,
      // },
    ],
    order: [[1, "asc"]],
    language: {
      url: "//cdn.datatables.net/plug-ins/1.13.1/i18n/es-ES.json",
    },
    info: true,
    searching: true,
    paging: false,
    destroy: true,
  });
}