class GamesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_game, only: [:show, :edit, :update, :destroy]

  # GET /games
  # GET /games.json
  def index
    @sort = {"name" => nil, "style_id" => nil, "min_players" => nil, "max_players" => nil, "num_cards" => nil}
    unless params["search"].nil?
      @games = Game.search_all(params["search"])
    else
      @games = Game.all
    end
    if params["sort_column"]
      case params["sort_direction"]
      when "ASC"
        @sort[params["sort_column"]] = "DESC"
      when "DESC"
        @sort[params["sort_column"]] = "ASC"
      else
        @sort[params["sort_column"]] = "DESC"
      end
      
    end
    params["show"] ||= 10
    params["show"] = @games.count if params["show"] == "all"
    @games = @games.order(sort_column + " " + sort_direction).paginate(:per_page => params["show"], :page => params[:page])
    @show = params["show"]
    @tags = tag_list
  end

  # GET /games/1
  # GET /games/1.json
  def show
  end

  # GET /games/new
  def new
    @game = Game.new
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    game_params["tags"]=params["game"]["tags"]
    @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render action: 'show', status: :created, location: @game }
      else
        format.html { render action: 'new' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def game_params
      params.require(:game).permit(:name, :description, :style_id, :min_players, :max_players, :num_cards, tags: [])
    end
    
    def sort_column
      Game.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end

    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
