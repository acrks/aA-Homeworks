module Toyable
    extend ActiveSupport::Concern
  
    included do
        has_many :toys, as: :toyable

    end
  
    def receive_toy(name)
        newToy = Toy.find_or_create_by(name: name)
        self.toys << newToy
    end
  end