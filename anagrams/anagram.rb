require 'byebug'

class Anagram

  def initialize(file_name)
    @words = File.read(file_name).split(/\r?\n/)
  end

  def normalize(text)
    text.downcase.scan(/[a-z]/).join
  end

  def match?(word_1, word_2)
    word = word_1.chars
    word_2.chars.each do |char|
      if index = word.index(char)
        word.delete_at(index)
      else
        return false
      end
    end
    true
  end

  def anagrams
    words_by_length = @words.group_by {|w| normalize(w).length }.sort.to_h
    words_matched = []

    words_by_length.each do |length, words|
      unless length.eql? 1
        (0..words.length-1).each do |i|
          ((i+1)..words.length-1).each do |j|
            if match?(normalize(words[i]), normalize(words[j]))
              words_matched << words[i]
              words_matched << words[j]
            end
          end
        end
      end
    end 
    words_matched
  end

  def ananagrams
    @words - anagrams
  end

  def display(words)
    text = ""
    words.each_slice(2) { |slice| text << "#{slice[0]}, #{slice[1]}\n" }
    text
  end
end

anagram = Anagram.new("words.txt")

puts "Anagrams..."
puts anagram.display(anagram.anagrams)

puts "\n"

puts "Ananagrams..."
puts anagram.display(anagram.ananagrams)


