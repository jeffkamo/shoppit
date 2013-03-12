class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :dialogue

      t.timestamps
    end
  end
end
