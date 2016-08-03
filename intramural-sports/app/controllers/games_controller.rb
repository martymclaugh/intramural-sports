class GamesController < ApplicationController

def index

	@games = Game.find_by(:id)

end


def show


end


def edit

	@game = Game.find_by(:id)

end



end
