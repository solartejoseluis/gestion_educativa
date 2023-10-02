document.addEventListener("DOMContentLoaded", function () {
  dttblListadoGralCalificaciones();
}); // cierre del addEventListener del inicio de pagina



function dttblListadoGralCalificaciones(){


$('#tbl_todas_las_calificaciones thead th').each( function () {
        var title = $('#tbl_todas_las_calificaciones tfoot th').eq( $(this).index() ).text();
        if(title!=""){
            $(this).html( '<input type="text" placeholder="'+title+'" />' );
      }
    } );
 
    // DataTable
    var table = $('#tbl_todas_las_calificaciones').DataTable({
    ajax: {
      url: "coord_home_mdl.php?accion=carga_dttbl_todas_las_calificaciones",
      dataSrc: "",
      data: "",
    },
    columns: [
      { data: "docente" },
      { data: "estudiante" },
      { data: "modulo_nombre" },
      { data: "semestre_actual" },
      { data: "cal_nota1" },
      { data: "cal_nota2" },
      { data: "cal_nota3" },
      { data: "cal_nota4" },
      { data: "cal_nota_final" },
      { data: "cal_nota_habilitacion" },
    ],
    columnDefs: [
{ "searchable": false, "targets": [4,5,6,7,8,9] }
    ],
    language: {
      url: "//cdn.datatables.net/plug-ins/1.13.1/i18n/es-ES.json",
    },
    searching: true,
    info: true,
    paging: false,
    destroy: false,

  });
 
    // Apply the search
    table.columns().eq( 0 ).each( function ( colIdx ) {
        if( !table.settings()[0].aoColumns[colIdx].bSearchable ){
        table.column( colIdx ).header().innerHTML=table.column( colIdx ).footer().innerHTML;
    }
        $( 'input', table.column( colIdx ).header() ).on( 'keyup change', function () {
            table
                .column( colIdx )
                .search( this.value )
                .draw();
        } );
    } );
} 






// DTTBL TODAS LAS CALIFICACIONES
// function dttblListadoGralCalificaciones() {
//   var listado = $("#tbl_todas_las_calificaciones").DataTable({
//     ajax: {
//       url: "coord_home_mdl.php?accion=carga_dttbl_todas_las_calificaciones",
//       dataSrc: "",
//       data: "",
//     },
//     columns: [
//       { data: "cal_id" },
//       { data: "docente" },
//       { data: "estudiante_id" },
//       { data: "estudiante_nombres" },
//       { data: "estudiante_apellidos" },
//       { data: "modulo_nombre" },
//       { data: "cal_nota1" },
//       { data: "cal_nota1_tipo" },
//       { data: "cal_nota2" },
//       { data: "cal_nota2_tipo" },
//       { data: "cal_nota3" },
//       { data: "cal_nota3_tipo" },
//       { data: "cal_nota4" },
//       { data: "cal_nota4_tipo" },
//       { data: "cal_nota_final" },
//       { data: "cal_nota_habilitacion" },
//     ],
//     columnDefs: [

//     ],
//     language: {
//       url: "//cdn.datatables.net/plug-ins/1.13.1/i18n/es-ES.json",
//     },
//     searching: true,
//     info: true,
//     paging: false,
//     destroy: true,

//   });



// }