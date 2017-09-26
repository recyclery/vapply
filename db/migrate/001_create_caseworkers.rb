class CreateCaseworkers < ActiveRecord::Migration
  def change
    create_table :caseworkers do |t|
      t.string :name
      t.string :organization
      t.string :address1
      t.string :address2
      t.string :phone
      t.string :email
      t.integer :limit, :default => 3
      t.references :user

      t.timestamps
    end
  end
end
