class Items < ActiveRecord::Migration
  def change
  	create_table :items do |t|
  		t.string :name
  		t.string :brand
  		t.integer :price
  		t.references :user
  	end	
  end
end
