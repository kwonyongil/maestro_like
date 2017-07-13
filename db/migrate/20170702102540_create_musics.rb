class CreateMusics < ActiveRecord::Migration
  def change
    create_table :musics do |t|
      t.string :name
      t.float :volume
      t.boolean :onoff
      t.timestamps null: false
      t.references :playlist, index: true, foreign_key: true
      
    end
  end
end
