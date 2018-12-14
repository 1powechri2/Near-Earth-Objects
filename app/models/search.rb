class Search < ApplicationRecord
  validates :search, presence: true, uniqueness: true
end
