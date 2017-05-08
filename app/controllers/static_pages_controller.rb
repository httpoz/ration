class StaticPagesController < ApplicationController
  
  def home
    render html: "Hello World"
  end
  
end