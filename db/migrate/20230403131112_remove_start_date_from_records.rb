class RemoveStartDateFromRecords < ActiveRecord::Migration[6.0]
  def change
    remove_column :records, :start_date, :datetime
  end
end
