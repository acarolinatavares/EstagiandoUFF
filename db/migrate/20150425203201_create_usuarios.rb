class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.integer :id
      t.string :nome
      t.string :email
      t.string :senha
      t.integer :administrador
      t.integer :verificado

      t.timestamps
    end
  end
end
