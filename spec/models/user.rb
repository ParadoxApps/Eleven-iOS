describe 'User' do

  before do
    include CDQ
    cdq.setup
  end

  after do
    cdq.reset!
  end

  it 'should be a User entity'
    User.entity_description.name.should == 'User'
  end
end
