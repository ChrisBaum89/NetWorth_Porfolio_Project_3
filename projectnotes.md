App is to allow someone to add their accounts and track their net worth (assets and liabilities)
A user will have many categories through accounts but accounts will also have many users so that the company knows what the best ads and services are that they should target to get the broadest audience to use services.



Models
----------------

User
  username
  email
  password_digest
  net_worth
  timestamps

	has many accounts
	has many categories through accounts

Category (Investments, House, Crypto, Credit Card <= predefined by admin)
  name
  dollar_value
  users

 	has many accounts
	has many users through accounts

Account
  Name
  Type (Asset or Liability)
  dollar_value
  user_id
  category_id

	belongs_to user
	belongs_to category


  ------------------------

  Possible Blog Entries:
  Why render :new doesn't display the user/new URL
