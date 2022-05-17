class TablePolicy < AdminPolicy
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
