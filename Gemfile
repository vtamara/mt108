source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

#ruby '~> 2.5.0'

gem 'babel-transpiler'

gem 'bootsnap', '>= 1.1.0', require: false

gem 'cancancan'                   # Control de acceso

gem 'cocoon', git: 'https://github.com/vtamara/cocoon.git', 
  branch: 'new_id_with_ajax' # Formularios anidados (algunos con ajax)

gem 'coffee-rails', '~> 4.2'

gem 'devise'    # Autenticación

gem 'devise-i18n'               # Localización e Internacionalización

gem 'jbuilder', '~> 2.5'

gem 'jsbundling-rails'

gem 'paperclip'                   # Anexos

gem 'pg'

gem 'rails', '~> 7.0'

gem 'rails-i18n'                 # Localización e Internacionalización

gem 'sassc-rails'

gem 'simple_form'   # Formularios

gem 'sprockets-rails'

gem 'stimulus-rails'

gem 'turbo-rails'

gem 'twitter_cldr'               # Localiación e internacionalización

gem 'will_paginate'              # Pagina listados


# Motores
# En orden apilamiento

gem 'sip',  # Sistema de informacion estilo Pasos de Jesús
  github: 'pasosdeJesus/sip', branch: :main
  #path: '../sip'

group :development, :test do
  gem 'debug'

  gem 'colorize' # Colores en terminal 

  gem 'dotenv-rails'
end

group :development do
  gem 'puma'

  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'cuprite'

  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
end

group :production do
  gem 'unicorn'
end

