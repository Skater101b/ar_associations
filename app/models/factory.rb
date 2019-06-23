class Factory < ApplicationRecord

  scope :search, lambda {|query| where(["name LIKE ?", "%#{query}%"])}
  scope :sorted, lambda { order("position ASC")}

  has_and_belongs_to_many :cars, :join_table => 'cars_and_factories'


  validates :location, exclusion: { in: %w(Australia Mexico Brazil), message: "Restricted location"} 
  validates :location, inclusion: { in: %w(India China US), message: "Not a valide Location"}

  validates_presence_of :name
  validates_uniqueness_of :name

  def factory 
    "The factory of #{name} located in #{location} is great! "
  end

end