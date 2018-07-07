# encoding: UTF-8

class EtapasController < Sip::ModelosController
  helper ::ApplicationHelper

  before_action :set_etapa, 
    only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource  class: ::Etapa
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def clase 
    "::Etapa"
  end

  def atributos_index
    [
      'id',
      'nombre',
      'meta',
      'descripcion',
      'destacadona1',
      'destacadona2'
    ]
  end

  def atributos_form
    [
      'id',
      'nombre',
      'meta',
      'descripcion',
      'destacadona1',
      'destacadona2'
    ]
  end

  def show
    @suma = ::Donacion.where(etapa_id: @registro.id).sum(:valor)
    @meta = @registro.meta
    @porcentaje = @suma*100.0/@meta
    @porcentaje = @porcentaje.round(2)
    render layout: 'show'
  end

  def index_reordenar(registros)
    return registros.reorder(:id)
  end

  def new_modelo_path(o)
    return new_etapa_path()
  end

  def genclase
    return 'F'
  end


  private

  def set_etapa
    @registro = @etapa = ::Etapa.find(
      ::Etapa.connection.quote_string(params[:id]).to_i
    )
  end

  # No confiar parametros a Internet, sólo permitir lista blanca
  def etapa_params
    params.require(:etapa).permit(*atributos_form)
  end

end
