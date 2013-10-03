class Wantedlist < ActiveRecord::Base
  attr_accessible :cosmeticians_id, :days, :hair_style, :memo, :name, :price, :sex
  belongs_to :cosmeticians


  validates :name,presence:true,length:{ maximum:15 }
  validates :hair_style,presence:true
  validates :price,presence:true
end
