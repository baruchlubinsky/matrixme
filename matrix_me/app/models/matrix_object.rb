class MatrixObject
	include Mongoid::Document
	include Mongoid::Timestamps
	
	field :name, :type => String
	
	field :description, :type => String
	
	field :misc_attributes, :type => Hash
	
	field :access_level, :type => String
	
	embeds_one :matrix_location, as: :locatable
	
	index 'matrix_location.data'
	
	belongs_to :user
	belongs_to :project
	
end
