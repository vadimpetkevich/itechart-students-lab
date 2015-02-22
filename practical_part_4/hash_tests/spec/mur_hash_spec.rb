require 'mur_hash.rb'

RSpec.describe MurHash do
  describe '#[]=' do
    let(:mur_hash) { MurHash.new }
    before { mur_hash[:key] = 'value' }

    context 'when there is no such key' do
      it 'increments size' do
      	expect(mur_hash.size).to eql(1)
      end

      it 'addes key' do
        expect(mur_hash.keys).to include(:key)
      end
      
      it 'addes value' do
        expect(mur_hash.values).to include('value')
      end
    end

    context 'when there is such key' do
      before { mur_hash[:key] = 'another_value' }
      
      it 'does not increment size' do
      	expect(mur_hash.size).to eql(1)
      end
  
      it 'does not add the same key' do
        expect(mur_hash.keys).to match_array([:key])
      end
      
      it 'changes value' do
        expect(mur_hash.values).to include('another_value')
      end
    end
  end

  describe '#[]' do
  	let(:mur_hash) { MurHash.new }

    context 'when there is no such key' do
      it "returns the default value" do
        expect(mur_hash[:key]).to be_nil
      end
    end

    context 'when there is such key' do
      before { mur_hash[:key] = 'value' }
      
      it "returns the value" do
        expect(mur_hash[:key]).to eql('value')
      end
    end
  end
  
  describe '#empty?' do
  	let(:mur_hash) { MurHash.new }

  	context 'after initialize' do  
      it "returns the true state" do
        expect(mur_hash.empty?).to equal(true)
      end
  	end
  
  	context 'after adding' do
  	  before { mur_hash[:key] = 'value' }

      it "returns the false state" do
        expect(mur_hash.empty?).to equal(false)
      end
  	end

  	context 'after cleaning' do
      before do
      	mur_hash[:key] = 'value'
        mur_hash.clear
      end

      it "returns the true state" do
        expect(mur_hash.empty?).to equal(true)
      end
  	end
  end

  describe '#clear' do
  	let(:mur_hash) { MurHash.new }
  	before do 
      mur_hash[:key] = 'value'
      mur_hash.clear
    end
    
    it "resets size" do
        expect(mur_hash.size).to eql(0)
    end

    it "cleans keys" do
        expect(mur_hash.keys).to match_array([])
    end

    it "cleans values" do
        expect(mur_hash.values).to match_array([])
    end
  end
end