document.addEventListener("DOMContentLoaded", function () {
  dttblGruposAsignadosAso();
  dttblGruposAsignadosMd();

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
        { data: "grupo_fch_inicio" },
        { data: "grupo_fch_fin" },
        { data: null, orderable: false },
      ],
      columnDefs: [
        {
          targets: 5,
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
        { data: "grupo_fch_inicio" },
        { data: "grupo_fch_fin" },
        { data: null, orderable: false },
      ],
      columnDefs: [
        {
          targets: 5,
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
    });


    // BTN VER GRUPO ASIGNADO MD
    $("#tbl_grupos_asignados_md tbody").on("click", "button.btnVerGrupoAsignadoMd", function () {
      let registro = listado.row($(this).parents("tr")).data();
      // recuperarRegistro(registro.grupo_id);
      $("#mdl_registro_calificaciones").modal("show");
    });

  } // final dttbl de grupos asignados

}); // cierre del addEventListener del inicio de pagina
