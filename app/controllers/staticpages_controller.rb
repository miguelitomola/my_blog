class StaticpagesController < ApplicationController
  def welcome
  	render 'welcome'
  end
  def contact
  	render 'contact'
  end
end
