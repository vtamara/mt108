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
      'nombre_en',
      'meta',
      'descripcion',
      'descripcion_en',
      'prestamo',
      'infoprestamo',
      'infoprestamo_en',
      'destacadona1',
      'destacadona2'
    ]
  end

  def atributos_form
    [
      'id',
      'nombre',
      'nombre_en',
      'meta',
      'descripcion',
      'descripcion_en',
      'prestamo',
      'infoprestamo',
      'infoprestamo_en',
      'destacadona1',
      'destacadona2'
    ]
  end

  def show
    @suma = ::Donacion.where(etapa_id: @registro.id).sum(:valor)
    @meta = @registro.meta
    @porcentaje = @suma*100.0/@meta
    @porcentaje = @porcentaje.round(2)
    @prestamo = @registro.prestamo.to_i

    @destacado1 = @registro.destacadona1
    @destacado2 = @registro.destacadona2
    @notas = ""
    @notas2 = "We receive donations through Paypal and Pasos de Jesús, if you donate please specify 'For Suba Mission'"

    if locale == :en 
      @suma = @suma/ApplicationHelper::DOLAR
      @notas += "Using #{ApplicationHelper::DOLAR} as exchange rate. "
      @suma = @suma.round
      @meta = @meta/(ApplicationHelper::DOLAR*100)
      @meta= @meta.round*100
      @prestamo = @prestamo/(ApplicationHelper::DOLAR*100)
      @prestamo = @prestamo.round*100
      @notas += "Goal and loans rounded to 100s. "
      @destacado1 = @registro.destacadona1 / (ApplicationHelper::DOLAR*10)
      @destacado1 = @destacado1.round*10
      @notas += "Featured values of donations rounded to 10s. "
      @destacado2 = @registro.destacadona2 / (ApplicationHelper::DOLAR*10)
      @destacado2 = @destacado2.round*10
    end
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
