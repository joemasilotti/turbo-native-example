class Article < ApplicationRecord
  validates :title, :body, presence: true
end
