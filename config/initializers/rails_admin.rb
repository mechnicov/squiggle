RailsAdmin.config do |config|

  ### Popular gems integration

  ## == Devise ==
  # config.authenticate_with do
  #   warden.authenticate! scope: :user
  # end
  # config.current_user_method(&:current_user)

  ## == Cancan ==
  # config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.authorize_with do |controller|
    unless current_user.try(:is_admin)
      flash[:alert] = I18n.t('not_authorized')
      redirect_to main_app.root_url
    end
  end

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    # export
    bulk_delete
    show
    edit
    delete
    # show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
    nestable
  end

  config.model Category do
    list do
      field :id
      field :name
      field :slug
      field :parent do
        formatted_value do
          value.name if value
        end
      end

      field :items
      field :created_at
      field :updated_at
      field :position
    end

    edit do
      field :name
      field :slug
      field :parent_id, :enum do
        enum do
          except = bindings[:object].id
          Category.where.not(id: except).map { |c| [c.name, c.id] }
        end
      end
      field :items
    end

    nestable_tree({
      position_field: :position,
      live_update: :only,
      max_depth: 20
    })
  end

  config.model User do
    list do
      field :id
      field :email
      field :is_admin
      field :created_at
      field :updated_at
    end

    edit do
      field :email
      field :password
      field :is_admin
    end
  end
end
