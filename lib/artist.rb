require 'song.rb'
require 'pry'
class Artist
    attr_accessor :name, :songs

@@all = []

    def initialize(name)
        @name = name 
        @songs = [] 
        @@all << self 
    end 
    
    def self.all 
        return @@all
    end

    def name
        @name 
    end 

    def artist
        @artist 
    end 
    

    def songs 
        Song.find_by_artist(self)
    end 

    def add_song(song)
        song.artist = self
    end

    def self.name 
        @name 
    end

    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.create(name)
    end

    def self.find(name)
        self.all.find {|artist| artist.name == name }
    end
    
    def self.create(name)
        self.new(name).tap {|artist| artist}
    end

    def save
        @@all << self
    end

    def print_songs 
    songs.each {|song| puts song.name}
    end


end