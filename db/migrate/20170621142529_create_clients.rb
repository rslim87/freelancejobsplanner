class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
    	t.string :firstname
    	t.string :lastname
    	t.string :streetname
    	t.string :aptnumber
    	t.string :borough 
    	t.string :notes
    	t.integer :user_id
    end
  end
end
