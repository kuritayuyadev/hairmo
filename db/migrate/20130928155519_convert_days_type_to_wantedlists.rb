class ConvertDaysTypeToWantedLists < ActiveRecord::Migration

  def change
    remove_column :wantedlists, :days_old
  end
end
