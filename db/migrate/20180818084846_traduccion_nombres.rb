class TraduccionNombres < ActiveRecord::Migration[5.2]
  def change
    add_column :etapa, :nombre_en, :string, limit: 255
    add_column :etapa, :descripcion_en, :string, limit: 4097
    add_column :donacion, :nombre_en, :string, limit: 255
    add_column :donacion, :mensaje_en, :string, limit: 4097
  end
end
