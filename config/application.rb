require_relative 'boot'

require 'rails/all'

# Requiere gemas listas en el Gemfile, incluyendo las
# limitadas a :test, :development, o :production.
Bundler.require(*Rails.groups)

require 'sip'

module Mt108
  class Application < Rails::Application

    # config.load_defaults 6.0

    # Las configuraciones en config/environments/* tiene precedencia sobre
    # las especificadas aquí.
    # La configuración de la aplicación puede ir en archivos en
    # config/initializers
    # -- todos los archivos .rb en ese directorio se cargan automáticamente
    # tras cargar el entorno y cualquier gema en su aplicación.
    
    # Establece Time.zone por defecto en la zona especificada y hace que
    # Active Record auto-convierta a esta zona.
    # Ejecute "rake -D time" para ver una lista de tareas para encontrar
    # nombres de zonas. Por omisión es UTC.
    config.time_zone = 'America/Bogota'

    config.i18n.available_locales = [:en, :es]

    # El locale predeterminado es :en y todas las traducciones de
    # config/locales/*.rb,yml se cargan automaticamente
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    ActiveRecord::Base.pluralize_table_names=false

    config.railties_order = [:main_app, Sip::Engine, :all]

    config.colorize_logging = true

    config.active_record.schema_format = :sql

    config.hosts << ENV.fetch('CONFIG_HOSTS', '127.0.0.1')

    #config.web_console.whitelisted_ips = ['186.154.35.237']

    # La siguiente puede producir rutas /sip/sip en las pruebas
    # En general debe bastar dejarla solo en
    #   config/initializers/punto_montaje.rb
    # config.relative_url_root = ENV.fetch('RUTA_RELATIVA', '/sip')

    # sip
    config.x.formato_fecha = ENV.fetch('SIP_FORMATO_FECHA', 'dd/M/yyyy')
    # En el momento soporta 3 formatos: yyyy-mm-dd, dd-mm-yyyy y dd/M/yyyy

  end
end
