class Host < ActiveRecord::Base
  validates :ip_address, presence:true, uniqueness:true
end
