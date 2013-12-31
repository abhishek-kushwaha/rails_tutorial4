# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#RailsTutorial4::Application.config.secret_key_base = '0c952326547bfdc162e0ff7853aa7b84e389af033a1a676c89978fedc71cfbb34969616f6296a62e18f81f5f4ed1cbe8ed36db6a4073e66aa99f8df81e587233'
require 'securerandom'

def secure_token
  token_file = Rails.root.join('.secret')
  if File.exist?(token_file)
    # Use the existing token.
    File.read(token_file).chomp
  else
    # Generate a new token and store it in token_file.
    token = SecureRandom.hex(64)
    File.write(token_file, token)
    token
  end
end

RailsTutorial4::Application.config.secret_key_base = secure_token
