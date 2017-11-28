class CreateCaseworkers < ActiveRecord::Migration[5.1]
  def change
    create_table :caseworkers do |t|
      t.string :name
      t.string :organization
      t.string :address1
      t.string :address2
      t.string :phone
      t.string :email
      t.integer :limit, default: 3
      t.integer :user_id
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
