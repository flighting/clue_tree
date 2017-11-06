class Region < ApplicationRecord
  belongs_to :parent, class_name: 'Region'

  has_many :nodes
end
