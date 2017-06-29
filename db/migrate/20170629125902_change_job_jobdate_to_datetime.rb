class ChangeJobJobdateToDatetime < ActiveRecord::Migration[5.1]
  def change
  	change_column :jobs, :jobdate, :datetime
  end
end
