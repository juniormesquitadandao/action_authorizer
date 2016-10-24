# Authorize reference controller actions when return:
#   Present values different hash:
#     ex.:
#       true
#       'nil'
#       'false'
#       0
#       '0'
#       [0]
#   Empty requested params:
#     ex. to requested params {}:
#       { id: [1, 2] }
#       { id: ['1', '2'] }
#       { id: ['one', 'two'] }
#   A hash with key:values including requested params key:value:
#     ex. to requested params {id: 1, other: 3}:
#       { id: [1, 2] }
#       { id: ['1', '2'] }
#     ex. to requested params {id: 'one', other: 'three'}:
#       { id: ['one', 'two'] }
#   A hash with keys different requested params keys:
#     ex. to requested params {other: 3}:
#       { id: [1, 2] }
#       { id: ['1', '2'] }
#     ex. to requested params {other: 'three'}:
#       { id: ['one', 'two'] }

# Unauthorize reference controller actions when return:
#   Blank values different hash:
#     ex.:
#       nil
#       false
#       ''
#       ' '
#       []
#   A hash with key:values excluding requested params key:value:
#     ex. to requested params {id: 3, other: 3}:
#       { id: [1, 2] }
#       { id: ['1', '2'] }
#     ex. to requested params {id: 'three', other: 'three'}:
#       { id: ['one', 'two'] }
class <%= controller_class_name %>Authorizer < ApplicationAuthorizer
  # All actions automatically validating the need of user logged.
  # Skip this check for all actions:
  # skip_authentication
  # Or skip_authentication_only for some actions:
  # skip_authentication_only :index, :new, :destroy, ...

<% unless options[:singleton] -%>
  def index
    # true
  end
<% end -%>

  def show
    # true
    # <%= singular_table_name.classify %>.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.<%= singular_table_name %>_ids }
  end

  def new
    # true
  end

  def edit
    # true
    # <%= singular_table_name.classify %>.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.<%= singular_table_name %>_ids }
  end

  def create
    # true
  end

  def update
    # true
    # <%= singular_table_name.classify %>.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.<%= singular_table_name %>_ids }
  end

  def destroy
    # true
    # <%= singular_table_name.classify %>.where(user: authenticated).find(params[:id]).avaliable?
    # { id: authenticated.<%= singular_table_name %>_ids }
  end

end