class Content < MatrixObject

  def initialize
    super
    self.misc_attributes = {:document_type => '', :author => ''}
  end

end