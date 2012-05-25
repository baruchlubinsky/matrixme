module MatrixObjectHelper
  def attribute_label(sym)
    sym.to_s.capitalize.gsub('_',' ')    
  end
end