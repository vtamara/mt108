/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

console.log('Hola Mundo desde Webpacker')

require('@rails/ujs').start()   // Javascript no intrusivo segun rails
require('turbolinks').start()   // Acelera carga de paginas

import './jquery'

import 'popper.js'              // Dialogos emergentes usados por bootstrap
import 'bootstrap'              // Maquetacion y elementos de diseño
import 'chosen-js/chosen.jquery';       // Cuadros de seleccion potenciados
import 'bootstrap-datepicker'
import 'bootstrap-datepicker/dist/locales/bootstrap-datepicker.es.min.js'


function establecePorcentaje(p1, p2, meta, suma, prestamo, vacio) {
  t1 = Math.round(200-2*(p1+p2))+10
  document.getElementById('vacio').setAttribute('style', 'height: ' + t1 + 
    'px')
  
  document.getElementById('vacio').setAttribute('title', vacio);

  t2 = Math.round(2*p2)
  document.getElementById('prestamo').setAttribute('style', 'height: ' + t2 + 
    'px')
  document.getElementById('prestamo').setAttribute('title', prestamo-suma);

  t3 = Math.round(2*p1);
  document.getElementById('lleno').setAttribute('style', 'height: ' + t3 +
    'px');
  document.getElementById('lleno').setAttribute('title', suma);
  document.getElementById('e100').setAttribute('title', meta);
}

//document.addEventListener('turbolinks:load', function() {
document.addEventListener('turbolinks:load', function() {
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
  establecePorcentaje(p, p2, m, s, pr, m-s-pr);
})
