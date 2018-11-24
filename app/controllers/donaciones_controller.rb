# encoding: UTF-8

class DonacionesController < Sip::ModelosController
  helper ::ApplicationHelper

  before_action :set_donacion, 
    only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource  class: ::Donacion, 
    except: [:termometro]

  def clase 
    "::Donacion"
  end

  def atributos_index
    [
      "id",
      "nombre",
      "nombre_en",
      "fecha_localizada",
      "valor_localizado",
      "credito",
      "mensaje",
      "mensaje_en",
      "etapa_id"
    ]
  end

  def index
    super
  end

  def index_reordenar(registros)
    return registros.reorder('fecha DESC')
  end

  def new_modelo_path(o)
    return new_donacion_path()
  end

  def genclase
    return 'F'
  end

  def termometro
    @suma = ::Donacion.sum(:valor)
    @meta = 16000000
    @porcentaje = @suma*100/@meta
    @porcentaje = @porcentaje.to_i
    #::Donacion.all.each do |d|
    #  if d>
    render :termometro
  end

  private

  def set_donacion
    @registro = @donacion = ::Donacion.find(
      ::Donacion.connection.quote_string(params[:id]).to_i
    )
  end

  # No confiar parametros a Internet, sólo permitir lista blanca
  def donacion_params
    params.require(:donacion).permit(*atributos_form)
  end

end
