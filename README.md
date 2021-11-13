# README
# NetWorth_Porfolio_Project_3

Net Worth Tracker

This program allows a user to track their net worth.  They can input account types, both assets and debts, to keep track of their accounts and total net worth.

Users are able to create an account and add financial accounts and assign them to categories.  All users and accounts are saved in a database so that a user can login and track their data.

Admins are able to create categories and view information from each category (total value for each category, number of users, and number of accounts). Admins can also delete accounts. This can be insightful for recommending services to help their users.  Note: If a category is deleted, the accounts associated with that category are reassigned to the "Uncategorized" category.

The application uses OmniAuth to allow for login with a valid Facebook account.

Database seed files are included with predefined users, categories, and accounts.  To implement seeding, in your console under this project folder, type rake db:drop (to ensure that no db is already in place), rake db:migrate, and then rake db:seed.

Built With: Atom 1.57.0 x64

Contributing: Please read CONTRIBUTING.md for details on our code of conduct, and the process for submitting pull requests to us.

Versioning: For the versions available, see the tags on this repository.

Author(s): Chris Baum

License: This project is licensed under the MIT License - see the LICENSE.md file for details
