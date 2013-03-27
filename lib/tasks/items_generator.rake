require "#{Rails.root}/app/helpers/application_helper"
include ApplicationHelper

namespace :items do
  desc "Generate 10 random items"
  task :dummy => :environment do
    10.times do
      puts Item.create(:name => Faker::Lorem.sentence, :description => Faker::Lorem.paragraph, :cost => ApplicationHelper::dollar_random(1, 100), :url => Faker::Internet.url )
    end
  end
end