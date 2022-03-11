require 'action_view'

class Cat < ApplicationRecord	
    include ActionView::Helpers::DateHelper

    validate :age, :check_sex, :check_color

    COLORS = ["RED", "YELLOW", "BLUE"]

    def age
        current_time = Time.now
        birth = self.birth_date
        cat_age = ((current_time.to_time - birth.to_time) / 31536000).to_i
    end

    def check_sex
       errors[:sex] << "Only single string, uppercase." unless (self.sex == 'M' || self.sex =='F')
    end

    def check_color
        # debugger
        errors[:color] << "Must be RED, YELLOW, BLUE"  unless COLORS.include?(self.color)
    end

end