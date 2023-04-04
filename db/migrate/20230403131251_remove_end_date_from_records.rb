class RemoveEndDateFromRecords < ActiveRecord::Migration[6.0]
  def change
    remove_column :records, :end_date, :datetime
  end
end
