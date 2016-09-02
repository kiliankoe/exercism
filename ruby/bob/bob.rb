class Bob
  def hey(remark)
    remark.gsub!(/\n/, '')
    if remark == remark.upcase && remark.match(/[a-zA-Z]/)
      return 'Whoa, chill out!'
    elsif remark.match(/\?$/)
      return 'Sure.'
    elsif remark.strip == ''
      return 'Fine. Be that way!'
    end
    'Whatever.'
  end
end
