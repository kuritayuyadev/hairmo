class WantedList < ActiveRecord::Base
  attr_accessible :cosmetician_id, :days, :hair_style, :memo, :name, :price, :sex
  belongs_to :cosmetician
  default_scope order: 'wanted_lists.created_at DESC'


  validates :cosmetician_id, presence:true
  validates :name,presence:true,length:{ maximum:15 }
  validates :hair_style,presence:true
  validates :price,presence:true
end
