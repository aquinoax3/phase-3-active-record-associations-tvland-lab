class Actor < ActiveRecord::Base
    has_many :characters
    has_many :shows, through: :characters

    def full_name
        "#{self.first_name} #{self.last_name}"
    end

    def list_roles
        # get all the characters
        self.characters.map do {|character| "#{character.name} - #{character.show.name}"}
    end

    def a_star_is_born(first_name, last_name)
        Actor.create(first_name:first_name, last_name:last_name).save
    end



end