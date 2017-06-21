class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
    	t.string :name
    	t.date :jobdate
    	t.integer :payrate
    	t.integer :category_id
    	t.boolean :paid 
    	t.string :equipment 
    	t.integer :user_id
    	t.datetime "created_at", null: false
    	t.datetime "updated_at", null: false

    end
  end
end
