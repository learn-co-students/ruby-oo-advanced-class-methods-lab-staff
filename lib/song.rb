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
  	song = Song.new
  	@@all << song 
  	song
  end 
 
 def self.new_by_name(name)
    song = Song.new 
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new 
    song.name = name
  	song.save
  	song
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	if self.find_by_name(name)
  		return self.find_by_name(name)
  	else 
  		self.create_by_name(name)
  	end
  end

  def self.alphabetical 
  	@@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file) 
  	song = Song.new 
  	file_parts = file.split(/[\-.]/)
  	file_parts.pop
  	file_parts.map{|x| x.strip}
  	song.artist_name = file_parts[0].strip
  	song.name = file_parts[1].strip
  	song
  end

  def self.create_from_filename(file)
  	self.new_from_filename(file).save
  end

   def self.destroy_all
    self.all.clear
  end




end
