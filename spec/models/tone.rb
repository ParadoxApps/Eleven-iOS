describe 'Tone' do

  before do
    include CDQ
    cdq.setup
  end

  after do
    cdq.reset!
  end

  it 'should be a Tone entity'
    Tone.entity_description.name.should == 'Tone'
  end
end
