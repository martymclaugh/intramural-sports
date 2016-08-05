class LeaguesController < ApplicationController
  def index
    @leagues = League.all
    p "=" * 100
    p params
    p "=" * 100
  end
end
