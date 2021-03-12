class ItemPolicy < ApplicationPolicy
  def update?
    record.user == user
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end
  
  class Scope < Scope
    def resolve
      #if params[:query].present?
        #scope.search(params[:query])
      #else
      scope.all
      #end
    end
  end
end
