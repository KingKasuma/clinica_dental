$(document).ready(function(){
    $('.datepicker').datepicker({
      dateFormat: 'yy-mm-dd',
      showWeek: true,
      changeYear: true,
      selectOtherMonths: true,
      dayNamesMin: ["Do","Lu","Ma","Mi","Ju","Vi","Sa"],
      weekHeader: "Se",
      monthNames: ["Enero","Febrero","Marzo","Abril", "Mayo", "Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"],
      yearRange: "1950:2017"
      });


      $('[data-toggle="popover"]').popover('')

});
