class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def show
    @item = set_item
  end

  def new
    @user = User.find(params[:user_id])
    @item = Item.new
  end

  def edit
    @item = set_item
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = params[:user_id]
    respond_to do |format|
      if @item.save
        format.html {redirect_to user_path(params[:user_id]), notice: "Item Successfully Created"}
        format.json {render :show, status: :created, location: @item}
      else
        format.html {render :new}
        format.json {render json: @item.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html {redirect_to @item, notice: "Item Successfully Saved"}
        format.json {render :show, status: :ok, location: @item}
      else
        format.html {render :edit}
        format.json {render json: @item.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html {redirect_to items_url, notice: "Item Deleted"}
      format.json {head :no_content}
    end
  end

  private

    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name, :description, :date_purchased, :condition, :brand)
    end
end
