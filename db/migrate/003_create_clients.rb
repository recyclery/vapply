class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.datetime :date
      t.string :sex
      t.string :weight
      t.integer :age
      t.string :height
      t.string :biketype
      t.boolean :helmet
      t.boolean :lock
      t.text :reason
      t.boolean :ridden_before
      t.references :caseworker, foreign_key: true
      t.datetime :completed_at

      t.timestamps
    end
  end
end
