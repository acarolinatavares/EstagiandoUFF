class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.integer :id
      t.string :nome

      t.timestamps
    end
  end
end
