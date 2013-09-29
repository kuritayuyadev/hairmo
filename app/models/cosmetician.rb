class Cosmetician < ActiveRecord::Base
  attr_accessible :id,:area_id, :email, :name, :password, :salon_address, :salon_name,:created_at,:updated_at
  has_many :wantedlists,dependent: :destroy,foreign_key: "cosmeticians_id"
end
