# encoding: UTF-8
module Sip
  class HogarController < ApplicationController

    def index
      if current_usuario
        authorize! :contar, Sip::Ubicacion
      end
      nr = Rails.configuration.relative_url_root 
      nr += "/" + params[:locale] if params[:locale]
      nr += '/etapas/2'
      redirect_to nr
    end

  end
end
