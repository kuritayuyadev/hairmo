class ConvertDaysTypeToWantedlists < ActiveRecord::Migration

  def change
    rename_column :wantedlists, :days, :days_old
    add_column :wantedlists, :days, :date_time
  end
end
