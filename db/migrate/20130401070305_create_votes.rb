class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :user_id
      t.integer :item_id
      t.boolean :is_vote_up

      t.timestamps
    end
  end
end
