# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"

ruby '2.6.3'

gem 'pg'
gem 'rake'
gem 'sinatra'
gem 'sinatra-flash'

group :test do
 gem 'capybara'
 gem 'rspec'
 gem 'rubocop', '0.56.0'
 gem 'simplecov', require: false
 gem 'simplecov-console', require: false
end