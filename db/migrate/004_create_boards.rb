class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.references :user
      t.text :text

      t.timestamps
    end

    add_index :boards, :user_id
  end
end
