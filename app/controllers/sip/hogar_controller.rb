# encoding: UTF-8
module Sip
  class HogarController < ApplicationController

    def index
      if current_usuario
        authorize! :contar, Sip::Ubicacion
      end
      nr = request.base_url + 
        Rails.configuration.relative_url_root 
      if nr[-1] != '/'
        nr += '/'
      end
      nr += params[:locale] + "/" if params[:locale]
      nr += 'etapas/2'
      puts "OJO nr=#{nr}"
      redirect_to nr
    end

  end
end
