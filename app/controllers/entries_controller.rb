class EntriesController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @place = Place.find_by({ "id" => params["place_id"] })
    @entries = Entry.where({ "place_id" => params["place_id"], "user_id" => current_user["id"] })
  end

  def show
    @entry = Entry.find_by({ "id" => params["id"] })
    @place = Place.find_by({ "id" => params["place_id"] })
  end

  def new
    @place = Place.find_by({ "id" => params["place_id"] })
  end

  def create
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = current_user["id"]
    if params["image"] != nil
      @entry.image.attach(params["image"])
    end
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
