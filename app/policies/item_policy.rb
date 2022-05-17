class ItemPolicy < AdminPolicy
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
