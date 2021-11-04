App is to allow someone to add their accounts and track their net worth (assets and liabilities)
A user will have many categories through accounts but accounts will also have many users so that the company knows what the best ads and services are that they should target to get the broadest audience to use services.



Models
----------------

User

	has many categories
	has many categories through accounts

Category (Investments, House, Crypto, Credit Card <= predefined by admin)

 	has many accounts
	has many users through accounts (use for data mining)

Account
	belongs_to user
	belongs_to category


  ------------------------
