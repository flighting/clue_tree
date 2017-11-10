class Admin::NodesController < Admin::BaseController
  def index
    @nodes = Node.includes(:region).order(id: :desc).page(params[:page]).per(10)
  end
  def show
    @node = Node.find(params[:id])

  end

  def new
    @node = Node.new
  end

  def create
    @node = Node.new(node_permitted)
    @node.creator = current_user
    if @node.save
      redirect_to action: :index
    else
      flash[:notice] = @node.error_messages
      redirect_back fallback_location: "/admin"
    end
  end

  def edit
    @node = Node.find(params[:id])
  end

  def update
    @node = Node.find(params[:id])
    @node.update node_permitted
  end

  def destroy
    @node = Node.find(params[:id])
    @node.destroy
  end



  private
  def node_permitted
    params.require(:node).permit!
  end
end
