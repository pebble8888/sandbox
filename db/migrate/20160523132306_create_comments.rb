class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :shop, foreign_key: true
      t.string :content

      t.timestamps null: false
    end
  end
end
