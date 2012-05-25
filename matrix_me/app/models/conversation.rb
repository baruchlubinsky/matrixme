class Conversation < MatrixObject
  
  embeds_many :comments
  
  def initialize
    super
    self.misc_attributes = {:tags => ''}
  end
  
end