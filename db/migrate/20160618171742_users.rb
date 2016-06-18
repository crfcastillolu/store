class Users < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :name
  		t.string :last_name
  		t.string :nickname
  	end	
  end
end
