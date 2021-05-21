#!/usr/bin/ruby
# generate.rb
# End of boilerplate 
# Read the lines after the __END__ marker

DATA.each do |line|
  # Create directories and files here
  p line
end 

# CREATE THESE DIRECTORIES AND FILES ######################
# Directories       Files
# ------       ---
__END__
                    index.cgi
app/
app/controllers/    user_controller.rb admin_controller.rb
app/models/         user.rb photos.rb ecards.rb
app/views/          
app/views/user      index.rhtml
app/views/admin     index.rhtml show.rhtml list.rhtml
app/views/photos    index.rhtml show.rhtml list.rhtml
app/views/layouts/  default.rhtml
config/             database.yaml
doc/                README
lib/                cgi_helper.rb 
public/             
public/javascripts/ 
public/stylesheets/ 
public/images/      
script/             generate.rb
tmp/
tmp/sessions/
