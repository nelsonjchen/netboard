class Host < ActiveRecord::Base
  validates :address, presence:true, uniqueness:true
end
