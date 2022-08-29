class ChangeDataTypeForDateAndTime < ActiveRecord::Migration[7.0]
  def change
    change_column(:flights, :date_and_time, :datetime)
  end
end
