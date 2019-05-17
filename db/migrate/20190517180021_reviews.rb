class Reviews < ActiveRecord::Migration


  def change
   create_table :reviews do |t|
     t.integer :rating
     t.string :description
     t.references :user
     t.references :product


     t.timestamps null: false
   end
 end
end