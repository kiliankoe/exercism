class Bob
  def hey(remark)
    remark.delete!("\n")
    if remark == remark.upcase && remark =~ /[A-Z]/
      'Whoa, chill out!'
    elsif remark =~ /\?$/
      'Sure.'
    elsif remark.strip.empty?
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end
end
