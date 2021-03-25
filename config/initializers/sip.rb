Sip.setup do |config|
  config.ruta_anexos = ENV.fetch('SIP_RUTA_ANEXOS', 
                                 "#{Rails.root}/archivos/anexos")
  config.ruta_volcados = ENV.fetch('SIP_RUTA_VOLCADOS',
                                   "#{Rails.root}/archivos/bd")
  config.titulo = I18n.t("gen.colecta_para_el_templo_de_la_mision_menonita_de_suba")
  config.longitud_nusuario = 15
end

