module RoomsHelper

    def person_email(room)
        emails = room.users.pluck(:email)
        emails.delete(current_user.email)
        emails.first.blank? ? "Personal Space" : emails.first
    end

end
