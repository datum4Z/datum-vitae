FROM ruby:3.2

WORKDIR /app

RUN gem install bundler

COPY Gemfile Gemfile.lock ./

RUN bundle config set --local without 'development test'
RUN bundle install

COPY . .

ENV RAILS_ENV development
ENV RAILS_SERVE_STATIC_FILES true

RUN bundle exec rake assets:precompile

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "5000"]
