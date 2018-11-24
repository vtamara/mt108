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
    @notas2 = "Recibimos donaciones de dos formas: (1) Consignación en la cuenta corriente del Banco de Occidente 240066712 a nombre de 'Iglesia Menonita de Colombia', o (2)  mediante el Paypal de 'Pasos de Jesús', si dona mediante paypal por favor especifique 'Para Misión en Suba' y ponga el nombre que desea presentar en este sitio web."

    @grupod1 = @registro.donacion.where('nombre IN (SELECT nombre FROM
      (SELECT nombre, sum(valor) FROM donacion 
        WHERE etapa_id = ? GROUP BY 1) AS s
      WHERE s.sum>=?)', @registro.id, @registro.destacadona1)
    @grupod2 = @registro.donacion.where('nombre IN (SELECT nombre FROM
      (SELECT nombre, sum(valor) FROM donacion 
        WHERE etapa_id = ? GROUP BY 1) AS s
      WHERE ? <= s.sum AND s.sum < ?)', @registro.id, @registro.destacadona2, 
      @registro.destacadona1)
    @grupod3 = @registro.donacion.where('nombre IN (SELECT nombre FROM
      (SELECT nombre, sum(valor) FROM donacion 
        WHERE etapa_id = ? GROUP BY 1) AS s
      WHERE s.sum < ?)', @registro.id, @registro.destacadona2)
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
      @notas2 = "We receive donations in two ways: (1) Deposito in the checking account 240066712 of 'Iglesia Menonita de Colombia' in Banco de Occidente, or (2)  through the Paypal of 'Pasos de Jesús', if you use paypal please specify 'For Suba Missión' and also the name that you want to appear in this website."
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
