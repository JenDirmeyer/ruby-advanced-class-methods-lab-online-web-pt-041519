require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end
  
  def self.create
    @@all << self.new
    @@all.last
  end 
  
  def name
    @name
  end  
  
  def self.new_by_name(name)
    song = self.new
    #binding.pry
    song.name = name
    #binding.pry
    song
  end  
  
  def self.create_by_name(name)
    song = self.new
    song.name = name 
    @@all << song 
    song
  end  
  
  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end  
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
       return self.find_by_name(name)
    else self.create_by_name(name)
    end
  end  
  
  def self.alphabetical
    @@all.sort_by {|song| song.name }
  end  
  
  def self.new_from_filename(filename)
    data = filename.split(" - ")
    @name = data[1].chomp(".mp3")
    @artist = data[0]
    song = self.new
    song.name = @name
    song.artist_name = @artist
    song
  end  
  
  def self.create_from_filename(filename)
    data = filename.split(" - ")
    @name = data[1].chomp(".mp3")
    @artist = data[0]
    song = self.new
    song.name = @name
    song.artist_name = @artist
    song.save
    song
  end  
  
  def self.destroy_all
    @@all.clear
  end  
end
