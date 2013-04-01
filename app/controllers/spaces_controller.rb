class SpacesController < ApplicationController

  before_filter :load_game

  # GET /spaces
  # GET /spaces.json
  def index
    @spaces = Space.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @spaces }
    end
  end

  # GET /spaces/1
  # GET /spaces/1.json
  def show
    @space = Space.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @space }
    end
  end

  # GET /spaces/new
  # GET /spaces/new.json
  def new
    @space = Space.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @space }
    end
  end

  # GET /spaces/1/edit
  def edit
#    @space = @game.spaces.find(params[:id])
    @space = Space.find(params[:id])
  end

  # POST /spaces
  # POST /spaces.json
  def create

    @space = @game.spaces.create(params[:space])

    redirect_to edit_game_path(@game)

#    @space = Space.new(params[:space])

#    respond_to do |format|
#      if @space.save
#        format.html { redirect_to @space, notice: 'Space was successfully created.' }
#        format.json { render json: @space, status: :created, location: @space }
#      else
#        format.html { render action: "new" }
#        format.json { render json: @space.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # PUT /spaces/1
  # PUT /spaces/1.json
  def update
    @space = Space.find(params[:id])

    @space.update_attributes(params[:space])

    redirect_to game_space_path(@game, @space)

#    respond_to do |format|
#      if @space.update_attributes(params[:space])
#        format.html { redirect_to @space, notice: 'Space was successfully updated.' }
#        format.json { head :no_content }
#      else
#        format.html { render action: "edit" }
#        format.json { render json: @space.errors, status: :unprocessable_entity }
#      end
#    end
  end

  # DELETE /spaces/1
  # DELETE /spaces/1.json
  def destroy
    @space = Space.find(params[:id])
    @space.destroy

    respond_to do |format|
      format.html { redirect_to game_spaces_path(@game) }
      format.json { head :no_content }
    end
  end

  private

    def load_game
      @game = Game.find(params[:game_id])
    end
end
