class Node < ApplicationRecord
  belongs_to :region
  belongs_to :tree
  belongs_to :creator, class_name: 'User'
  belongs_to :clone_from_node, class_name: 'Node'

end
