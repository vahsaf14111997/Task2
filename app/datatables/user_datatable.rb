class UserDatatable < AjaxDatatablesRails::ActiveRecord
  extend Forwardable
  def_delegator :@view, :link_to
  def_delegator :@view, :edit_user_path
def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      id:          { source: "User.id" },
      name:        { source: "User.name" },
      phone:       { source: "User.phone" },
      location:    { source: "Place.location", searchable: false },
      actions: {source: "User.id"},
    }
  end

  def initialize(params, opts = {})
    @view = opts[:view_context]
    super
  end

  def data
    records.map do |record|
      {
          id:          record.id, 
          name:        link_to(record.name,record, class:'text-dark'),
          phone:       record.phone,
          location:    record.place.location,
          actions:     user_list_actions(record).html_safe,
          DT_RowId:    record.id,
      }
    end
  end
  def get_raw_records
    User.includes(:place)
  end


  def user_list_actions(user)
    edit_user_link(user)+delete_user_link(user)
  end

  def edit_user_link(user)
    link_to('Edit', edit_user_path(user), class:'btn btn-warning btn-sm',  data: {bs_toggle: 'modal', bs_target: '#editUserModal', remote: true} )
  end

  def delete_user_link(user)
    link_to('Delete', user, method: :delete, data: { confirm: 'Are you sure?' }, class:'btn btn-danger btn-sm')
  end
end
