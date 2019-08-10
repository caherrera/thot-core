class CreateComparations < ActiveRecord::Migration[5.2]
  def change
    create_table :comparations do |t|
      t.string :seed
      t.string :comparator
      t.float :lineal
      t.float :ncslineal
      t.float :levenshtein
      t.float :wlevenshtein
      t.float :damerau
      t.float :winkler
      t.float :cosine
      t.float :jaccard
      t.float :ngram
      
      t.timestamps
    end
  end
end
