class Bob
  def hey(remark)
    remark.gsub!(/\n/, '')
    if remark == remark.upcase && remark.match(/[A-Z]/)
      'Whoa, chill out!'
    elsif remark.match(/\?$/)
      'Sure.'
    elsif remark.strip.empty?
      'Fine. Be that way!'
    else
      'Whatever.'
    end
  end
end
