require_relative '../../../src/anagrams'

describe 'anagrams' do
  context 'error input: []' do
    let(:strings){[]}
    
    it 'shall return blank' do
      expect(anagrams_count(strings)).to eq(0) 
    end
  end
  
  context 'error input: nil' do
    let(:strings){nil}
    
    it 'shall return blank' do
      expect(anagrams_count(strings)).to eq(0) 
    end
  end
  
  context 'error input: string' do
    let(:strings){'hello'}
    
    it 'shall return blank' do
      expect(anagrams_count(strings)).to eq(0) 
    end
  end
  
  context 'valid input' do
    let(:strings){['abc','cab','dac','beed','deb','few','acd']}
    
    it 'shall return anagrams' do
      expect(anagrams_count(strings)).to eq(5)
    end
  end
end
