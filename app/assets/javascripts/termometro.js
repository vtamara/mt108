function establece_porcentaje(p1, p2) {
  t1 = Math.round(200-2*(p1+p2));
  document.getElementById('vacio').setAttribute('style', 'height: ' + t1 + 
    'px');
  t2 = Math.round(2*p2);
  document.getElementById('prestamo').setAttribute('style', 'height: ' + t2 + 
    'px');
  t3 = Math.round(2*p1);
  document.getElementById('lleno').setAttribute('style', 'height: ' + t3 +
    'px');
}

//document.addEventListener('turbolinks:load', function() {
document.addEventListener('DOMContentLoaded', function() {
  p = window.porcentaje;
  s = window.suma;
  m = window.meta;
  pr = window.prestamo;
  for (pi = 20; pi <= 100; pi += 20) {
    v = Math.round(m*pi/100);
    d = document.getElementById('e' + pi);
    d.innerHtml = '- ' + v;
  }
  console.log('meta=', m);
  console.log('suma=', s);
  console.log('pr=', pr);
  console.log('porcentaje=', p);
  p2 = pr > s ? pr - s : 0
  p2 = Math.round(p2*100/m)
  establece_porcentaje(p, p2);
})
