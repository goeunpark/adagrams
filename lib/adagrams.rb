require 'pry'
require 'csv'

POOL = { A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1, K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1 }

SCORE_CHART = { A: 1, B: 3, C: 3, D: 2, E: 1, F: 4, G: 2, H: 4, I: 1, J: 8, K: 5, L: 1, M: 3, N: 1, O: 1, P: 3, Q: 10, R: 1, S: 1, T: 1, U: 1, V: 4, W: 4, X: 8, Y: 4, Z: 10 }


def is_in_english_dict?(input)
  CSV.open("assets/dictionary-english.csv", "r").each do |word|
    return true if word.include?(input.downcase)
  end
  return false
end


def highest_score_from(unscored_words)
  all_scores = {}

  unscored_words.each do |word|
    all_scores[word] = score_word(word)
  end

  max_words = all_scores.select { |word, score| score == all_scores.values.max }

  first_ten_lettered_word = max_words.select { |word, score| word.length == 10 }.keys[0]
  first_min_word = max_words.min_by { |word, score| word.length }[0]

  max_words.any? { |word, score| word.length == 10 } ?
  first_word = first_ten_lettered_word : first_word = first_min_word

  first_word_score = max_words.values[0]

  best_word = {
    word: first_word,
    score: first_word_score
  }

  return best_word
  
end

def score_word(word)
  total_points = []

  word.each_char do |char|
    total_points << SCORE_CHART.fetch(char.upcase.to_sym)
  end

  total_points.length >= 7 ? total_points.sum + 8 : total_points.sum

end

def uses_available_letters?(input, letters_in_hand)
  input = input.chars
  (input & letters_in_hand) == input ? true : false
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
