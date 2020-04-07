class Camera < ActiveRecord::Base
        belongs_to :user 
        has_many :lenses
          

end 