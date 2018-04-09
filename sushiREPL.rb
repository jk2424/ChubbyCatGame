

puts "Chubby cat is excited to meet you!"
puts "What would you like to do?"
puts "Options: play with chubby cat, pet chubby cat, or ignore chubby cat."
option = gets.chomp.downcase
case option
when "play with chubby cat"
  puts "Type ruby sushigame.rb into the console! Have fun!"
when "ignore chubby cat"
  puts "Fine, bye."
when "pet chubby cat"
  puts "Great. How do you approach Chubby Cat?"
  puts "Options: approach with sushi in hand, or run up to chubby cat."
  option2 = gets.chomp.downcase
  case option2
    when "approach with sushi in hand"
      puts "Wow, chubby cat loves you. You are blessed."
    when "run up to chubby cat"
      puts "No sushi? No chubby cat for you!"
    else
      puts "You must be confused. Chubby cat doesn't need you."
    end
else
  puts "Not an option. Try again!"

end
