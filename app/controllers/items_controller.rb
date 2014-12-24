class ItemsController < ApplicationController
	before_action :set_item, only: [:show, :update, :destroy, :edit] # this is so that the set_item private method must be ran before other methods in the controller are so that the items id can be specified

	def index 
		@items = Item.all
	end

	def show

	end

	def edit
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)

		if @item.save
			redirect_to @item, notice: 'Item created'
		end
	end

	def update
		if @item.update(item_params)
			redirect_to @item, notice: 'Item Updated'
		end
	end

	def destroy

		if @item.destroy
		redirect_to items_url(@item), notice: 'Item Destroyed'
		end
	end

	private
		def set_item
			@item = Item.find(params[:id])  # specifies/looks up the item with a certain params id (in the url, a number)
		end

		def item_params
			params.require(:item).permit(:name)
		end
end

