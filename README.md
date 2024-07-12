# MyFinance CLI

MyFinance CLI is a command-line application written in Lua for managing personal finances. It allows users to record expenses, add income, and view financial summaries using JSON files for data storage.

## Prerequisites

Before running the application, ensure you have Lua and the following Lua libraries installed:

- `dkjson`: Lua library for JSON encoding and decoding.

You can install `dkjson` using LuaRocks:
```
luarocks install dkjson
```
Getting Started
Clone the repository:
```
git clone https://github.com/yourusername/myfinance-cli.git
cd myfinance-cli
```

Ensure dkjson is installed as mentioned in the prerequisites.

Run the application:

```
lua myfinance.lua
```

## Usage

```
Add Expense (n): Record a new expense by entering the name and price.
Add Income (p): Add money received by entering the amount.
List Expenses and Info (l): View the list of expenses and financial information.
Exit Program (e): Terminate the application.
```

## Example Usage

```
$ lua myfinance.lua
New expense (n)
Pay/money received (p)
List expenses and info (l)
Exit program (e)

n

What did you buy/pay for?

Groceries

How much did you pay?

50
Added new expense successfully.

New expense (n)
Pay/money received (p)
List expenses and info (l)
Exit program (e)

l

Expenses:
You bought Groceries for 50

Info:
spent: 50
balance: 950
earned: 0

New expense (n)
Pay/money received (p)
List expenses and info (l)
Exit program (e)

e
```

## Contributing
Contributions are welcome! If you have suggestions, bug reports, or want to add features, please open an issue or submit a pull request.

## License
This project is licensed under the MIT License. See the LICENSE file for details.
