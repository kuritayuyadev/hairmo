class Wantedlist < ActiveRecord::Base
  attr_accessible :cosmeticians_id, :days, :hair_style, :memo, :name, :price, :sex
  belongs_to :cosmeticians
end
