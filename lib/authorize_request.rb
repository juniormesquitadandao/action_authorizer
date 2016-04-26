module AuthorizeRequest
  extend ActiveSupport::Concern

  included do
    attr_reader :unauthorized_params

    def initialize(params)
      @params = params

      skip_params
      set_action_name
      set_model_name
      set_attribute_names
      set_authorized_params

      set_unauthorized
    end

    def can?
      @unauthorized_params.empty?
    end

    def cannot?
      !can?
    end

    def skiped_params
      []
    end

    def authorized_params
      {}
    end

    private

    def skip_default_params
      [:utf8, :_method, :authenticity_token, :commit]
    end

    def authorize_default_params
      {
        index: @attribute_names,
        show: {
          id: {}
        },
        new: {},
        edit: {
          id: {}
        },
        create: {
          id: [],
          @model_name => @attribute_names
        },
        update: {
          id: [],
          @model_name => @attribute_names.except(:id)
        },
        destroy: {
          id: {}
        }
      }
    end

    def skip_params
      skiped_params.each do |skip_param_name|
        @params.extract! skip_param_name
      end
    end

    def set_action_name
      @action_name = @params[:action].to_sym
    end

    def set_model_name
      @model_name = @params[:controller].singularize.to_sym
    end

    def set_attribute_names
      @attribute_names = {}
      attribute_names = controller_path.to_s.classify.constantize.attribute_names rescue []
      (attribute_names - %w(created_at updated_at)).each do |attribute_name|
        @attribute_names[attribute_name.to_sym] = []
      end
      @attribute_names
    end

    def set_authorized_params
      @authorized_params = authorized_params
    end

    def set_unauthorized
      @checked_params = @params.extract!(:controller)
      @unauthorized_params = {}

      authorize_action
      authorize_attribute_names if can?

      @unauthorized_params.merge! @params
    end

    def authorize_action
      @checked_params.merge! @params.extract!(:action)
      @authorized_params = @authorized_params[@action_name]
      @unauthorized_params = @checked_params unless @authorized_params
    end

    def authorize_attribute_names
      @authorized_attributes = {}
      @authorized_params.keys.each do |authorized_param_name|
        @authorized_attributes.merge! @params.extract!(authorized_param_name)
      end
    end
  end

  module ClassMethods
    def can? request
      authorize_request = "#{params[:controller]}_authorizer".classify.constantize

      params = request.params.dup

      authorize_request.new( params, user_by_ request ).can?
    end

    def cannot? request
      !can? request
    end

    def user_by_ request
      request.env["warden"].user
    end

    def skip_default_params
      define_method :skiped_params do
        skip_default_params
      end
    end

    def authorize_default_params
      define_method :authorized_params do
        authorize_default_params
      end
    end


  end

end