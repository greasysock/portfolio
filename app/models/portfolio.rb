class Portfolio < ApplicationRecord

    validates_presence_of :title, :body, :main_image, :thumb_image

    def self.angular
        where(subtitle: 'Angular')
    end

    def self.ruby
        where(subtitle: 'Ruby on Rails')
    end

end
