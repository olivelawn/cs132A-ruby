#!/usr/bin/ruby

puts 'Content-type: text/html'
puts
puts "Lab 2"
puts "Parker Johnson"
puts

# Text analyzer code follows 

speeches = %w{abraham_lincoln_1st.txt franklin_roosevelt_2nd.txt ronald_reagan_1st.txt abraham_lincoln_2nd.txt john_kennedy.txt teddy_roosevelt.txt barack_obama.txt thomas_jefferson_1st.txt bill_clinton_1st.txt richard_nixon.txt}
stopwords = %w{the a by on for of are with just but and to the my I has some in}

speeches.each do |file|
  puts "#{file.split(/\./).slice(0,1)} speech:"
  lines = File.readlines(file)
  #p lines

  line_count = lines.size
  puts "Lines #{line_count}"

  text = lines.join
  character_count = text.length
  puts "Characters #{character_count}"

  character_count_no_space = text.gsub(/\s+/, '').length
  puts "Characters (exc. space) #{character_count_no_space}"

  word_count = text.split.length
  puts "Word count #{word_count}"
  
  sentence_count = text.split(/\.|\!|\?/).length
  puts "Sentences #{sentence_count}"

  paragraph_count = text.split(/\n\n/).length
  puts "Paragraphs #{paragraph_count}"

  puts "Words Per Sentence: #{(word_count/sentence_count)}"

  #puts "Sentence: #{(sentence_count/paragraph_count)}"

  all_words = text.scan(/\w+/)
  good_words = all_words.select { |word| !stopwords.include?(word) }
  good_percentage = (( good_words.length.to_f / all_words.length.to_f ) *100).to_i
  puts "Non-fluff #{good_percentage}%"

  sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|!/)
  sentences_sorted = sentences.sort_by { |sentence| sentence.length }
  one_third = sentences_sorted.length / 3
  ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
  ideal_sentences = (ideal_sentences.select { |sentence| sentence =~ /is|are/ }).slice(0, 7)
  puts "Abstract: #{ideal_sentences.join(". ")}."
  puts

  good_words_uniq = good_words.uniq()
  good_words_uniq_hash = Hash.new
  #p good_words_length
  good_words_uniq.each do |word| 
    good_words_uniq_hash[word] = 0
  end  
   
  good_words.each { |word| good_words_uniq_hash[word] += 1 }
 
  topten = (good_words_uniq_hash.sort { |a,b| a[1]<=>b[1] }).reverse[0,10]
  
  print "The Ten Most Common Words: "
  topten.each { |array| print "#{array[0]} (#{array[1]}) " }
  puts
  puts
end
