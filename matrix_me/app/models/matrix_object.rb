class MatrixObject
	include Mongoid::Document
	include Mongoid::Timestamps
	
	field :name, :type => String
	
	field :misc_attributes, :type => Hash
	
	field :object_type, :type => String
	
	field :access_level, :type => String
	
	field :location, :type => Array
	
	index :location
	
	belongs_to :user
	belongs_to :project
	
end
