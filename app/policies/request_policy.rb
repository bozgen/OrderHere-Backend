class RequestPolicy < AdminPolicy
  
  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
