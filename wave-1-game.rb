require_relative 'lib/adagrams'

def display_welcome_message
  puts "Welcome to Adagrams!"
  puts "Let's draw 10 letters from the letter pool..."
end

def display_drawn_letters(letters)
  puts "You have drawn the letters:"
  puts letters.join(', ')
end

def run_game
  display_welcome_message
  display_drawn_letters(draw_letters)
end

run_game
