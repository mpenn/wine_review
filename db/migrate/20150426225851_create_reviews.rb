class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :name
      t.integer :stars
      t.text :comment
      t.references :wine, index: true

      t.timestamps null: false
    end
    add_foreign_key :reviews, :wines
  end
end
