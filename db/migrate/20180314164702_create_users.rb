class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :slack_user_id
      t.string :hex_code
      t.boolean :enabled
      t.timestamps
    end
    add_index :users, :slack_user_id, unique: true
  end
end
