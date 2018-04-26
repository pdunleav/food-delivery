class SessionsView
  def ask_for(item)
    puts "#{item}?"
    gets.chomp
  end

  def try_again
    puts "Wrong credentials, try again!"
  end
end
