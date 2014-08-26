# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
UserAuth::Application.config.secret_key_base = '96a7b82b305b225ad9f21960c908aeebc861cb6c957ef92746738cfcd68d77322b65a6458d70748e160c1ecc35297144f9947fbedc809a6f0505f1560a9927a1'
