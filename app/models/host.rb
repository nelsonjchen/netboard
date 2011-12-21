class Host < ActiveRecord::Base
  validates :address, presence:true
end
