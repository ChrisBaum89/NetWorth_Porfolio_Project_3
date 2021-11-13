module CategoriesHelper

  def users_count(category)
    category.users.uniq.count
  end

  def account_count(category)
    category.accounts.uniq.count
  end

  #calculates total value of a category
  def total_value(category)
    total_value = 0
    category.accounts.uniq.each do |account|
      total_value = total_value + account.dollar_value
    end
    total_value
  end

  def average_value(category)
    if users_count(category) > 0
      average_value = total_value(category) / users_count(category)
    else
      0
    end
  end

end
