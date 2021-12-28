# encoding: UTF-8

class Donacion < ActiveRecord::Base
	include Sip::Modelo
  include Sip::Localizacion

  belongs_to :etapa, optional: false

  campofecha_localizado :fecha
  flotante_localizado   :valor

  validates :nombre, presence: true
  validates :fecha, presence: true
  validates :valor, presence: true

  def presenta_nombre
    "#{fecha}: #{nombre} : #{valor}"
  end
end
