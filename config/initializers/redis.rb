credentials = Rails.application.credentials
REDIS_CURRENT = Redis.new(url: "#{credentials.redis_url}:#{credentials.redis_port}/#{credentials.redis_db}")
