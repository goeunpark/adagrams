require 'awesome_print'
require 'pry'

POOL = {
  A: 9,
  B: 2,
  C: 2,
  D: 4,
  E: 12,
  F: 2,
  G: 3,
  H: 2,
  I: 9,
  J: 1,
  K: 1,
  L: 4,
  M: 2,
  N: 6,
  O: 8,
  P: 2,
  Q: 1,
  R: 6,
  S: 4,
  T: 6,
  U: 4,
  V: 2,
  W: 2,
  X: 1,
  Y: 2,
  Z: 1
}

def uses_available_letters?(input, letters_in_hand)
 return input.chars.all? { |char| letters_in_hand.include?(char) }
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
