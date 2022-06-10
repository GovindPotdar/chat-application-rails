class Room < ApplicationRecord

    with_options dependent: :destroy do |assoc|
        assoc.has_many :messages
        assoc.has_many :room_users , class_name: 'RoomMate'
        assoc.has_many :users, through: :room_users
    end

    enum :room_type, [:one_to_one,:many_to_many]

end
