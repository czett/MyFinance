# MyFinance CLI

MyFinance CLI is a command-line application written in Lua for managing personal finances. It allows users to record expenses, add income, and view financial summaries using JSON files for data storage.

## Prerequisites

Before running the application, ensure you have Lua and the following Lua libraries installed:

- `dkjson`: Lua library for JSON encoding and decoding.

You can install `dkjson` using LuaRocks:
```bash
luarocks install dkjson
Getting Started
Clone the repository:

bash
Copy code
git clone https://github.com/yourusername/myfinance-cli.git
cd myfinance-cli
Ensure dkjson is installed as mentioned in the prerequisites.

Run the application:

bash
Copy code
lua myfinance.lua
Usage
Add Expense (n): Record a new expense by entering the name and price.
Add Income (p): Add money received by entering the amount.
List Expenses and Info (l): View the list of expenses and financial information.
Exit Program (e): Terminate the application.
