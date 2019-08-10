class CreateHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :histories do |t|
      t.string :seed
      t.string :comparator
      t.string :algorithm
      t.references :comparation, foreign_key: true

      t.timestamps
    end
  end
end
