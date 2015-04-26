class WinesController < ApplicationController
  def index
    @available_at = Time.now
    @wines = ["Franzia", "Apothic", "Trader Joes", "Yellow Tail"]
  end
end