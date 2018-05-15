function establece_porcentaje(p) {
  $('.vacio').height(200-2*p);
  $('.lleno').height(2*p);  
}

$(document).ready(function() {
  p = window.porcentaje;
  s = window.suma;
  m = window.meta;
  for (pi = 20; pi <= 100; pi += 20) {
    v = Math.round(m*pi/100);
    $('.e' + pi).html('- ' + v);
  }
  console.log('meta=', m);
  console.log('suma=', s);
  console.log('porcentaje=', p);
  establece_porcentaje(p);
})
