class User < ApplicationRecord

    with_options dependent: :destroy do |assoc|
        assoc.has_many :messages
        assoc.has_many :room_mates
        assoc.has_many :rooms, through: :room_mates
    end


end
