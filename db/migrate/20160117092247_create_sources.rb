class CreateSources < ActiveRecord::Migration[5.0]
  def change
    create_table :sources do |t|
      t.string :name
      t.text :code
      t.references :language, index: true, foreign_key: true

      t.timestamps
    end
  end
end
