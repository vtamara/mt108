function establece_porcentaje(p1, p2) {
  $('.vacio').height(200-2*(p1+p2));
  $('.prestamo').height(2*p2);  
  $('.lleno').height(2*p1);  
}

document.addEventListener('turbolinks:load', function() {
  p = window.porcentaje;
  s = window.suma;
  m = window.meta;
  pr = window.prestamo;
  for (pi = 20; pi <= 100; pi += 20) {
    v = Math.round(m*pi/100);
    $('.e' + pi).html('- ' + v);
  }
  console.log('meta=', m);
  console.log('suma=', s);
  console.log('pr=', pr);
  console.log('porcentaje=', p);
  p2 = pr > s ? pr - s : 0
  p2 = Math.round(p2*100/m)
  establece_porcentaje(p, p2);
})
