# frozen_string_literal: true

Configus.build Rails.env do
  env :production do
    github do
      app_id ENV['GITHUB_CLIENT_ID']
      app_secret ENV['GITHUB_CLIENT_SECRET']
    end

    disqus_id 'hexlet-basics'
  end

  env :development, parent: :production do
    disqus_id 'code-basics-test'
  end

  env :test, parent: :development do
    github do
      app_id
      app_secret
    end
  end
end
