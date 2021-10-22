class LikesController < ApplicationController
  before_action :set_like, only: %i[ show edit update destroy ]

  if Like.find_by(post_id: @post_id, member_id:@member_id)
    @liked_post = true
  else
    @liked_post = false
  end

  # GET /likes or /likes.json
  def index
    @likes = Like.all
  end

  # GET /likes/1 or /likes/1.json
  def show
  end

  # GET /likes/new
  def new
    @post_id = params[:post_id]
    @member_id = params[:member_id]
    @like = Like.new
  end

  # GET /likes/1/edit
  def edit
  end

  # POST /likes or /likes.json
  def create
    @like = Like.new(like_params)
    @post = Post.find(@post_id)
    
    @post_likes = Post.select("likes")
      @post_likes += 1
      respond_to do |format|
        if @like.save
          format.html { redirect_to @post, notice: "You have liked this post." }
          format.json { render :show, status: :created, location: @like }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @like.errors, status: :unprocessable_entity }
        end
      end
      
  end

  # PATCH/PUT /likes/1 or /likes/1.json
  def update
    respond_to do |format|
      if @like.update(like_params)
        format.html { redirect_to @like, notice: "Like was successfully updated." }
        format.json { render :show, status: :ok, location: @like }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @like.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /likes/1 or /likes/1.json
  def destroy
    @like.destroy
    respond_to do |format|
      format.html { redirect_to likes_url, notice: "Like was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      # params.fetch(:like, {:meeting_id, :member_id})
      params.require(:like).permit(:meeting_id, :member_id)
    end
end