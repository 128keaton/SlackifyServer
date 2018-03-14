class CreateUsers < ActiveRecord::Migration[5.1]
  def change
	create_table :users do |t|
      		t.string :hex_code
		t.string :uid
    	end
	add_index :users, :uid, unique: true
  end
end
