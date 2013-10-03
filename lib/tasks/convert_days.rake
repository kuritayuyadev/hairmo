namespace :seed do
  desc "Convert days  for wantedlists"
  task :convert_days => :environment do
    Wantedlist.transaction do
      Wantedlist.all.each do |item|
        item.days = item.days_old.to_i
        item.save!
      end
    end
  end
end
