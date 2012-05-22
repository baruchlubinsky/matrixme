class Workspace
  include Mongoid::Document
  
  field :navigation, :type => Array
  field :context
  
  belongs_to :project
  belongs_to :user
  
end