class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(params[:post])
		
		# Если пост сохранен и прошел валидацию то перенаправлять на показ добавленного поста
		# Иначе отображать форму создания поста вновь
		# Было бы неплохо чтобы при добавлении поста если он не прошел валидацию то отображалось сообщение
		if @post.save
			redirect_to :action => :show, :id => @post.id
		else
			render 'new'
		end
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		  @post = Post.find(params[:id])
		 
		  if @post.update_attributes(params[:post])
		    redirect_to :action => :index
		  else
		    render 'edit'
		  end
	end

	def show
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		redirect_to :action => :index
	end
end
