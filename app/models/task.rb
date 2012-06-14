class Task < ActiveRecord::Base
  attr_accessible :name

  def self.search term
    where("name like ?", "%#{term}%")
  end

end
