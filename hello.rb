# -*- coding: utf-8 -*-
require 'sinatra'
require 'rakuten_web_service'

#参考: https://github.com/k2works/sinatra_rakuten_api

get '/' do
  RakutenWebService.configuration do |c|
    c.application_id = ENV["APPID"]
    c.affiliate_id = ENV["AFID"]
  end
  # Use genre id to fetch genre object
  @rankings = RakutenWebService::Ichiba::Item.ranking(:age => 40, :sex => 0)
  erb :item_ranking
end

get '/recipe' do
   erb :recipe
end 

get '/category' do\
  RakutenWebService.configuration do |c|
    c.application_id = ENV["APPID"]
    c.affiliate_id = ENV["AFID"]
  end
  #resipe = RakutenWebService::Resipe.new() 
  @rankings = RakutenWebService::Recipe.large_categories
  #rankings = resipe.large_categories
 erb :category
end 

get '/books/' do
  RakutenWebService.configuration do |c|
    c.application_id = ENV["APPID"]
    c.affiliate_id = ENV["AFID"]
  end
  # Use genre id to fetch genre object
  @rankings = RakutenWebService::Ichiba::Item.ranking(:age => 40, :sex => 0)
  erb :item_ranking
end
