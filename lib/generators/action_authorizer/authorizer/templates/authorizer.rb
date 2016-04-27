<% if namespaced? -%>
require_dependency "<%= namespaced_file_path %>/application_authorizer"

<% end -%>
<% module_namespacing do -%>
class <%= controller_class_name %>Controller < ApplicationAuthorizer

<% unless options[:singleton] -%>
  def index
    # true
  end
<% end -%>

  def show
    # true
    # { id: authenticated.<%= singular_table_name %>_ids }
  end

  def new
    # true
  end

  def edit
    # true
    # { id: authenticated.<%= singular_table_name %>_ids }
  end

  def create
    # true
  end

  def update
    # true
    # { id: authenticated.<%= singular_table_name %>_ids }
  end

  def destroy
    # true
    # { id: authenticated.<%= singular_table_name %>_ids }
  end

end
<% end -%>