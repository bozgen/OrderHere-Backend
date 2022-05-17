# frozen_string_literal: true

class ApplicationPolicy
  attr_reader :user, :record, :role_result

  def initialize(user, record, role_result = false)
    @user = user
    @record = record
    @role_result = role_result
  end

  def index?
    @user.shop.id === @record.shop_id && role_result
  end

  def show?
    @user.shop.id === @record.shop_id && role_result
  end

  def create?
    @user.shop.id === @record.shop_id && role_result
  end

  def new?
    create?
  end

  def update?
    @user.shop.id === @record.shop_id && role_result
  end

  def edit?
    update?
  end

  def destroy?
    @user.shop.id === @record.shop_id && role_result
  end

  class Scope
    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      raise NotImplementedError, "You must define #resolve in #{self.class}"
    end

    private

    attr_reader :user, :scope
  end
end
