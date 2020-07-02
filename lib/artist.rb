require 'pry'
class Artist
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_song(name, genre)
    Song.new(name, self, genre)
  end

  def songs # setter
    Song.all.select {|song| song.artist == self }
  end

  def genres # getter
    songs.collect do |song|
      song.genre
    end
  end

  def self.all
    @@all 
  end
end 