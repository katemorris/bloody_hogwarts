class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.alpha
    order(:name)
  end
end
