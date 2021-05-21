class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :title
      t.text :description
      t.string :image_name
      t.string :image_path
      t.string :photographer
      t.integer :album_id

      t.timestamps
    end

    s_dir = '/Users/Parker/cs132A/test/rails/photo_album/public/images/'
    albums = Album.find(:all)
    #p albums
    albums.each do |a|
    #p a
      Dir.chdir(s_dir + a.directory + "/thumbs/")

      images = Dir.entries('.')
#	p images
      images.each do |im|
        next if File.directory?(im)
        next if im !~ /.(jpg|png|gif)$/i
        p im
 	if File.exist?(s_dir + a.directory + "/" + im)
	  p = Photo.new(:title => im, :description => im + ": needs description", :image_path => a.directory, :photographer => "needs attribution", :album_id => a.id, :image_name => im)
	  p.save
	end
      end
    end
        
  end

  def self.down
    drop_table :photos
  end

end
