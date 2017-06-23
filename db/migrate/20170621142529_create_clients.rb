class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
    	t.string :fullname
    	t.string :street
    	t.string :apt
    	t.string :borough 
    	t.string :notes
    	t.integer :user_id

    end
  end
end
