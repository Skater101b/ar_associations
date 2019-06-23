class Car < ApplicationRecord
  has_and_belongs_to_many :factories, :join_table => 'cars_and_factories'

  scope :sorted, lambda { order("position ASC")}
  
  BRAND_NAMES = ["Kia", "Honda", "Chevy", "Ford"]
  validates :name, presence: true,
                   length: {:maximum => 10},
                   uniqueness: true

  validates_presence_of :brand  
  validate :brand_name 


  private 
  def brand_name 
    unless BRAND_NAMES.include?(brand)
      errors.add(:base, "That's not a valid brand please choose another")
    end
  end


end
