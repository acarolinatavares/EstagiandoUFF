class CreateComentarios < ActiveRecord::Migration
  def change
    create_table :comentarios do |t|
      t.integer :id
      t.string :texto
      t.date :data
      t.integer :usuario_id

      t.timestamps
    end
  end
end
