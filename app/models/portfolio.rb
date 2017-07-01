class Portfolio < ApplicationRecord
    include Placeholder
    validates_presence_of :title, :subtitle, :body
     # create an instance method on self
    def self.angular
        where(subtitle: "angular")
    end
  
    scope :ruby, -> { where(subtitle: "Ruby") }
    after_initialize :set_defaults
    
    def set_defaults
     
        self.main_image ||= Placeholder.image_generator(height: 400, width: 600)
        self.thumb_image ||= Placeholder.image_generator(height: 200, width: 350)
    end
end