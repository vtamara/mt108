class DatosSuba < ActiveRecord::Migration[5.2]
  def up
    execute <<-SQL
    INSERT INTO etapa (id, nombre, meta, descripcion, 
      destacadona1, destacadona2, created_at, updated_at)
      VALUES (1, 'Compra del terreno', '389000000', 
        'La iglesia nacional compró el dinero con donaciones por 300.000.000 y ahora lo estamos pagando como si fuese un prestamo a un interés del 0.25% mensual', 
        '2500000', '1000000', '2018-05-14', '2018-05-14');
    INSERT INTO etapa (id, nombre, meta, descripcion, 
      destacadona1, destacadona2, created_at, updated_at)
      VALUES (2, 'Estudios, planos y permisos', '16000000', 
        'Es la cotización inicial de una persona que tramito estos documentos para el lote contiguo', 
        '2500000', '1000000', '2018-05-14', '2018-05-14');
    INSERT INTO etapa (id, nombre, meta, descripcion, 
      destacadona1, destacadona2, created_at, updated_at)
      VALUES (3, 'Construcción local, estructura temporal y licencia 1', 
        '60000000', 'Está por definirse bien su valor a partir de la etapa 2', 
        '2500000', '1000000', '2018-05-14', '2018-05-14');
    INSERT INTO etapa (id, nombre, meta, descripcion, 
      destacadona1, destacadona2, created_at, updated_at)
      VALUES (4, 'Piso 1 del templo', '60000000', 
        'Remplazará estructura temporal de la etapa anterior, esperamos que local comience a producir y a ayudar a pagar', 
        '2500000', '1000000', '2018-05-14', '2018-05-14');
    INSERT INTO etapa (id, nombre, meta, descripcion, destacadona1, 
      destacadona2, created_at, updated_at)
      VALUES (5, 'Piso 2 del templo y licencia', '60000000', 
        'Con base en diseños y estudios de la etapa 2', 
        '2500000', '1000000', '2018-05-14', '2018-05-14');
    INSERT INTO etapa (id, nombre, meta, descripcion, destacadona1, 
      destacadona2, created_at, updated_at)
      VALUES (6, 'Piso 3 del templo y licencia', '60000000', 
        'Con base en diseños y estudios de la etapa 2', 
        '2500000', '1000000', '2018-05-14', '2018-05-14');

    INSERT INTO donacion (id, etapa_id, nombre, fecha, valor, 
      credito, mensaje, created_at, updated_at)
      VALUES (1, 1, 'Apoyo de iglesia de Teusaquillo', '2017-01-31',
        '750000', 't', '', '2017-01-31', '2017-01-31');
    INSERT INTO donacion (id, etapa_id, nombre, fecha, valor, 
      credito, mensaje, created_at, updated_at)
      VALUES (2, 1, 'Aporte comunidad de Suba', '2018-05-01',
        '300000', 't', '', '2018-05-14', '2018-04-14');
    INSERT INTO donacion (id, etapa_id, nombre, fecha, valor, 
      credito, mensaje, created_at, updated_at)
      VALUES (3, 2, 'Donación de la Iglesia Menonita Mechanic Groove, Quarryville, PA, Estados Unidos', 
        '2018-04-21', '2650000', 't', '', '2018-05-14', '2018-04-14');
    SQL

  end

  def down
    execute <<-SQL
      DELETE FROM etapa WHERE id>='1' AND id<='6';
    SQL
  end
end
