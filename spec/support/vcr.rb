VCR.configure do |c|
  c.hook_into :webmock

  c.cassette_library_dir = "spec/support/vcr_cassettes"

  c.configure_rspec_metadata!

  c.allow_http_connections_when_no_cassette = false

  c.default_cassette_options = { record: :new_episodes }

  %w(TWITTER_API_KEY TWITTER_APP_SECRET TWITTER_APP_TOKEN TWITTER_APP_TOKEN_SECRET).each do |secret_name|
    c.filter_sensitive_data("<#{secret_name}>") { ENV.fetch(secret_name) }
  end
end
