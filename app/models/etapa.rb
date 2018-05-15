# encoding: UTF-8

class Etapa < ActiveRecord::Base
	include Sip::Modelo
  include Sip::Localizacion


  has_many :donacion

  flotante_localizado   :destacadona1
  flotante_localizado   :destacadona2
  flotante_localizado   :meta

  validates :destacadona1, presence: true
  validates :destacadona2, presence: true
  validates :meta, presence: true
  validates :nombre, presence: true

  def presenta_nombre
    "#{id}: #{nombre}"
  end

end
