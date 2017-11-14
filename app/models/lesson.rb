class Lesson < ApplicationRecord
  belongs_to :company
  validates_format_of :name, with: /\A[A-Za-z0-9 ]+\z/
end
