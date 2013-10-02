class Wantedlist < ActiveRecord::Base
  attr_accessible :cosmeticians_id, :days, :hair_style, :memo, :name, :price, :sex
  belongs_to :cosmeticians


  validates :name,presence:true,length:{ maximum:30 }
  validates :hair_style,presence:true
  validates :price,presence:true
  validates :sex,presence:true
  validates :days,presence:true
end
