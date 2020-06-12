conexion = ActiveRecord::Base.connection();

Sip::carga_semillas_sql(conexion, 'sip', :datos)

conexion.execute("INSERT INTO public.usuario 
  (nusuario, email, encrypted_password, password, 
    fechacreacion, created_at, updated_at, rol) 
  VALUES ('sip', 'sip@localhost', 
    '$2a$04$uLWQzmlDYEaegYs4brFVYeLN9FeIE6vAPQqp9HgbQDGLKOV9dXTK6',
    '', '2014-08-14', '2014-08-14', '2014-08-14', 1);")
