class MatrixLocation
  include Mongoid::Document
  
  Separator = '-'
  
  field :data, :type => Array
  
  embedded_in :locatable, polymorphic: true
  
  def method_missing(name, *args)
    if data.respond_to?(name)
      self.data.send(name, *args)
    else
      super
    end
  end
  
  def from_s(val)
    data = val.split(Separator)
  end

  def [](i)
    data[i]
  end
  
  def []=(i,val)
    data[i] = val
  end
  
  def to_s
    data.join Separator
  end
  
  
  
end