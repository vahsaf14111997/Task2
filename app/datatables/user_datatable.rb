class UserDatatable < AjaxDatatablesRails::ActiveRecord

  # private
  
  # def data
  #   users.map do |user|
  #     [].tap do |column|
  #       column << user.id
  #       column << user.name
  #       column << user.phone
  #       column << user.location
  #     end
  #   end
  # end

  # def count 
  #   User.count
  # end
  
  # def total_entries
  #   users.total_count
  # end

  # def users
  #   @users ||= fetch_users
  # end
  
  # def fetch_users
  #   search_string = []
  #   columns.each do |term|
  #     search_string << "#{term} like :search"
  #   end
  #   users = User.page(page).per(per_page)
  #   users = users.where(search_string.join(' or '), search: "%#{params[:search][:value]}%")
  # end
  
  # def columns
  #   %w(id name phone location)
  # end
end
