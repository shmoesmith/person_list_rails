class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :hair_color, null: false
      t.string :eye_color, null: false
      t.string :gender, null: false
      t.boolean :alive, default: true

      t.timestamps
    end
  end
end
