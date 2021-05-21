# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_mydiary_session',
  :secret      => '53b77ccd0e077316ce3b4074f093f1f1d2eca79dc44e44cbcc8c606273b137ba6d4d80a99fb261a45befcefd22655ee7ed0e38dde14913db0707c44f9e029b8a'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
