class <%= controller_class_name %>Authorizer < ApplicationAuthorizer
  # skip_authentication
  # skip_authentication only: :index
  # skip_authentication only: %i[:index, :show]

<% unless options[:singleton] -%>
  def index
    # true
  end
<% end -%>

  def show
    # current_user.<%= plural_table_name.classify %>.exists?(id: params[:id])
    # <%= singular_table_name.classify %>.exists?(id: params[:id])
  end

  def new
    # true
  end

  def edit
    # current_user.<%= plural_table_name.classify %>.exists?(id: params[:id])
  end

  def create
    # true
  end

  def update
    # current_user.<%= plural_table_name.classify %>.exists?(id: params[:id])
  end

  def destroy
    # current_user.<%= plural_table_name.classify %>.exists?(id: params[:id])
  end
end