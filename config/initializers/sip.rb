#encoding: UTF-8 

Sip.setup do |config|
  config.ruta_anexos = "/var/www/resbase/mt108/anexos/"
  config.ruta_volcados = "/var/www/resbase/mt108/bd/"
  # En heroku los anexos son super-temporales
  if !ENV["HEROKU_POSTGRESQL_GREEN_URL"].nil?
    config.ruta_anexos = "#{Rails.root}/tmp/"
  end
  config.titulo = I18n.t("gen.colecta_para_el_templo_de_la_mision_menonita_de_suba")
end
