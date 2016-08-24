require_relative '../anagram'

describe Anagram do
  before :each do
    @ini = Anagram.new('words.txt')
  end
  
  it 'normalizes a text given' do
    expect(@ini.normalize('Its just a test')).to eq 'itsjustatest'
  end

  describe '#match?' do 
    context 'with two differents words given' do 
      it 'returns false' do 
        expect(@ini.match?("times", "itoms")).to eq false
      end
    end

    context 'with matched words given' do 
      it 'returns false' do 
        expect(@ini.match?("times", "items")).to eq true
      end
    end
  end

  describe '#anagrams' do 
    it 'returns all anagrams from dictionary file' do 
      anagrams = @ini.anagrams
      expect(anagrams).to eq "Laid, Dial\nTimes, Items\n"
    end
  end
end
