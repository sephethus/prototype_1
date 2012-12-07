class CreateReplies < ActiveRecord::Migration
  def change
    create_table :replies do |t|
      t.string :content
      t.integer :user_id

      t.timestamps
    end
    add_index :replies, [:user_id, :created_at]
  end
end
