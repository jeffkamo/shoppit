class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.text :description
      t.float :cost
      t.string :url

      t.timestamps
    end
  end
end
