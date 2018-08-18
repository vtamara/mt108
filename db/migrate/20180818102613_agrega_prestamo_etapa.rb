class AgregaPrestamoEtapa < ActiveRecord::Migration[5.2]
  def change
    add_column :etapa, :prestamo, :float
    add_column :etapa, :infoprestamo, :string, limit: 5000
    add_column :etapa, :infoprestamo_en, :string, limit: 5000
  end
end
