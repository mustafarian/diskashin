class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy]

  # GET /boards
  # GET /boards.json
  def index
    @boards = Board.where(parent_id: nil)
                  .paginate(page: params[:page], per_page: 10)
                  .order("title ASC")
  end

  # GET /boards/1
  # GET /boards/1.json
  def show
    @threads = @board.threads.paginate(:page => params[:page], :per_page => 10).order("updated_at DESC")
  end

  # GET /boards/new
  def new
    @board = Board.new
  end

  # GET /boards/1/edit
  def edit
  end

  # POST /boards
  # POST /boards.json
  def create
    new_board = Board.new(board_params)

    if board_params[:parent_id]
      parent = Board.find(board_params[:parent_id])
      @board = parent
    else
      @board = new_board
    end

    respond_to do |format|
      if new_board.save
        if parent
          parent.sub_boards << new_board
          parent.save
          format.html { redirect_to edit_board_path(@board), notice: 'Board was successfully created.' }
          format.json { render :show, status: :updated, location: @board }
        else
          format.html { redirect_to @board, notice: 'Board was successfully created.' }
          format.json { render :show, status: :created, location: @board }
        end
      else
        format.html { render :new }
        format.json { render json: new_board.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boards/1
  # PATCH/PUT /boards/1.json
  def update
    respond_to do |format|
      if @board.update(board_params)
        format.html { redirect_to @board, notice: 'Board was successfully updated.' }
        format.json { render :show, status: :ok, location: @board }
      else
        format.html { render :edit }
        format.json { render json: @board.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boards/1
  # DELETE /boards/1.json
  def destroy
    @board.destroy
    respond_to do |format|
      format.html { redirect_to boards_url, notice: 'Board was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_board
    @board = Board.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def board_params
    params.require(:board).permit(:title, :description, :parent_id)
  end
end
