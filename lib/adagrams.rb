require 'awesome_print'
require 'pry'

POOL = { A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1, K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1 }

SCORE_CHART = { A: 1, B: 3, C: 3, D: 2, E: 1, F: 4, G: 2, H: 4, I: 1, J: 8, K: 5, L: 1, M: 3, N: 1, O: 1, P: 3, Q: 10, R: 1, S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 10}

def score_word(word)
  total_points = []
  SCORE_CHART.each {|letter,letter_points|
    if word.downcase.include?(letter.to_s.downcase)
      total_points << letter_points
    end
  }
  return total_points.sum
end

def uses_available_letters?(input, letters_in_hand)
  input.chars.each do |char|
    unless letters_in_hand.include?(char)
      return false
    end
    letters_in_hand.delete(char)
  end
  return true
end

def draw_letters
  ten_letters = []
  all_letters = generate_letter_array(POOL)
  10.times do
    ten_letters << all_letters.shuffle!.pop
  end
  return ten_letters
end

def generate_letter_array(pool)
  letter_array = []
  pool.each do |letter, qty|
    qty.times do
      letter_array << letter.to_s
    end
  end
  return letter_array
end

score_word('DOG')
