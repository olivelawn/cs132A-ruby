class CreateAlbums < ActiveRecord::Migration
  def self.up
    create_table :albums do |t|
      t.string :title
      t.string :directory

      t.timestamps
    end

    s_dir = '/Users/Parker/cs132A/test/rails/photo_album/public/images/'
    albums = Dir.entries(s_dir)

    albums.each do |a|
	next if a == '.'
	next if a == '..'
	al = Album.new(:title => a.gsub('_',' '), :directory => a)
	al.save
    end	

  end

  def self.down
    drop_table :albums
  end
end
