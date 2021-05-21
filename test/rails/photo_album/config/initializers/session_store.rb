# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_photo_album_session',
  :secret      => '8c847e167558b3fb95e519a4ae18586850ae46f41c4e94c40acb063eb6f86d9af3788d536a2f8e468c951665d888dda3d234f54169cc9d095bc266f3a1f0f2e1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
