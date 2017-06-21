class CreateJobClients < ActiveRecord::Migration[5.1]
  def change
    create_table :job_clients do |t|
    	t.belongs_to :job
    	t.belongs_to :client
    end
  end
end
