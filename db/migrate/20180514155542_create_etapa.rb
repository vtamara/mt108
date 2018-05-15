class CreateEtapa < ActiveRecord::Migration[5.2]
  def change
    create_table :etapa do |t|
      t.string :nombre, limit: 255
      t.float :meta
      t.string :descripcion, limit: 4097
      t.float :destacadona1
      t.float :destacadona2
      t.timestamp :created_at
      t.timestamp :updated_at
    end

    add_column :donacion, :etapa_id, :integer, null: false
    add_foreign_key :donacion, :etapa
  end
end
