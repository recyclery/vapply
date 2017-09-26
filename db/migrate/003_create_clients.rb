class CreateClients < ActiveRecord::Migration
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
      t.references :caseworker
      t.datetime :completed_at

      t.timestamps
    end
    add_index :clients, :caseworker_id
  end
end
