class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :name
      t.integer :pin_pi
      t.boolean :value

      t.timestamps null: false
    end
  end
end
