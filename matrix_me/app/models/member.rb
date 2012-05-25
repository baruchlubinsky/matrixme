class Member < MatrixObject
  
  def initialize
    super
    self.misc_attributes = {:job_title => '', :company => ''}
  end
  
end