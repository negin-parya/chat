class Message < ActiveRecord::Base
	
	belongs_to :user


        default_scope order('created_at DESC')
        
        default_scope where('created_at>= '+Time.now.to_s[0..9])

end
