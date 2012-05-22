require 'spec_helper'

describe MatrixObject do
  
  before(:each) do
    @matr = MatrixObject.new
  end
  
  describe 'Fields' do
    it 'has a name' do
      @matr.should respond_to(:name)
    end
    it 'has a created at timestamp' do
      @matr.should respond_to(:created_at)
    end
    it 'has a updated at timestamp' do
      @matr.should respond_to(:updated_at)
    end
    it 'has an access level' do
      @matr.should respond_to(:access_level)
    end
    it 'has a location' do
      @matr.should respond_to(:location)
    end
  end
  
  describe 'Relations' do
    it 'belongs to a user' do
      should belong_to(:user).of_type(User)#.as_inverse_of(:matrix_objects)
    end
    it 'belongs to a project' do
      should belong_to(:project).of_type(Project)#.as_inverse_of(:matrix_objects)
    end
  end
  
end