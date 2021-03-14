class BatchPolicy < ApplicationPolicy

  def create?
    return true
  end

  #def update?
   # record.user == user
  #end

  def destroy?
    record.purchase.user == user
  end

  def index?
    record.user == user
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end

end
