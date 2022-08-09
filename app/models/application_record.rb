class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.sample(n = 1)
    order(Arel.sql('RANDOM()')).limit(n)
  end
end
