

module CGIHelper

  def http_header()
    puts "Content-type: text/html"
    puts
  end

  def humanize(str)
    wordarray = str.split('_')
    if wordarray.length == 1
      return wordarray[0].capitalize 
    else 
      return wordarray[0].capitalize + " " + wordarray[1].capitalize 
    end
  end
end
