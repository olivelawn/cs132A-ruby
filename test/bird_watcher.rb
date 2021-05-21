#!/usr/bin/ruby

class Bird_watcher 
  include Enumerable 
  def initialize 
    @birds = {} 
  end 

  def saw_bird(bird) 
    if @birds[bird].nil? 
      @birds[bird] = 1 
    else 
      @birds[bird] += 1 
    end 
  end 
  
  def each
    @birds.each { |bird, count| yield bird, count }
  end
end 


birds = %w{ robin chicken sparrow pigeon hawk seagull hummingbird hawk 
seagull hummingbird hawk seagull hummingbird  hawk seagull hummingbird 
 robin sparrow  robin sparrow  robin sparrow  robin sparrow  robin sparrow 
sparrow pigeon sparrow pigeon sparrow pigeon sparrow pigeon sparrow pigeon 
parrot parrot vulture } 
  
watcher = Bird_watcher.new 
birds.each do |t| 
  watcher.saw_bird(t) 
end 

watcher.each { |bird, count| puts "yeah #{bird} #{count}" }

puts "Most common birds" 
common_birds = watcher.select {|bird, count| count > 5 } 
p common_birds

common_birds.each {|bird,count| puts "#{bird.capitalize}: #{count}"}

p watcher

