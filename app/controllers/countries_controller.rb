class CountriesController < ApplicationController

  def index
    @countries = Country.all
  end
  def about
  end
end
