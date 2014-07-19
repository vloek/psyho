class Unit < ActiveRecord::Base
  belongs_to :category
  paginates_per 10
  
  has_many :file_attaches
  accepts_nested_attributes_for :file_attaches, allow_destroy: true

  def self.search query
    where("(name || longname || description) ilike ?", "%#{query}%") 
  end

  def to_param
    [id, name.parameterize].join("-")
  end
end
