module CategoriesHelper

  def users_count(category)
    category.users.uniq.count
  end

  def total_value(category)
    total_value = 0
    category.accounts.uniq.each do |account|
      total_value = total_value + account.dollar_value
    end
    total_value
  end
end
