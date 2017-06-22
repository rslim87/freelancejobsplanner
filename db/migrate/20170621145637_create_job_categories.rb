class CreateJobCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :job_categories do |t|
    	t.belongs_to :job
    	t.belongs_to :category
    end
  end
end
