class EditorsController < ApplicationController
  def index
    @sources = Source.all.order(:name)
    @source  = @sources.first
    @languages = Language.all.order(:name)
  end
end
