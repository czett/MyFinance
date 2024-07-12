package.path = package.path .. ';/home/raspi/.luarocks/share/lua/5.1/?.lua;/home/raspi/.luarocks/share/lua/5.1/?/init.lua'
package.cpath = package.cpath .. ';/home/raspi/.luarocks/lib/lua/5.1/?.so'

local json = require("dkjson")
local filename = "data.json"

local function writeJSONFile(filename, data)
    local jsonString = json.encode(data, { indent = true }) -- Pretty print for readability
    local file = io.open(filename, "w")
    if not file then
        return false, "File not found"
    end
    
    file:write(jsonString)
    file:close()
    return true
end

local function readJSONFile(filename)
    local file = io.open(filename, "r")
    if not file then
        return nil, "File not found"
    end
    
    local content = file:read("*a")
    file:close()
    
    local data, pos, err = json.decode(content)
    if err then
        return nil, "Error: " .. err
    end
    
    return data
end

local function addExpense(name, price)
    local data = readJSONFile(filename)
    if not data then
        return false, "Failed to read JSON file"
    end

    local expense = {
        name = name,
        price = tonumber(price) -- Convert price to number
    }

    table.insert(data.expenses, expense)

    -- Update the spent and balance
    data.info.spent = data.info.spent + expense.price
    data.info.balance = data.info.balance - expense.price

    local success, err = writeJSONFile(filename, data)
    if not success then
        return false, err
    end

    return true
end

local function addIncome(amount)
    local data = readJSONFile(filename)
    if not data then
        return false, "Failed to read JSON file"
    end

    local money = tonumber(amount) -- Convert amount to number

    data.info.balance = data.info.balance + money
    data.info.earned = data.info.earned + money

    local success, err = writeJSONFile(filename, data)
    if not success then
        return false, err
    end

    return true
end

local data = readJSONFile(filename)
if not data then
    print("Failed to read initial data.")
    os.exit(1)
end

while true do
    print("New expense (n)\nPay/money received (p)\nList expenses and info (l)\nExit program (e)\n")
    local action = io.read()

    if action == "n" then
        print("\nWhat did you buy/pay for?\n")
        local ename = io.read()
        print("\nHow much did you pay?\n")
        local eprice = io.read()
        local success, err = addExpense(ename, eprice)
        if not success then
            print("Failed to add new expense: " .. err)
        else
            print("Added new expense successfully.")
            data = readJSONFile(filename)
        end
    elseif action == "p" then
        print("\nHow much money did you get?\n")
        local income = io.read()
        local success, err = addIncome(income)
        if not success then
            print("Failed to add new income: " .. err)
        else
            print("Added new income successfully.")
            data = readJSONFile(filename)
        end
    elseif action == "l" then
        print("Expenses:")
        for index, value in pairs(data.expenses) do
            print("You bought " .. value.name .. " for " .. value.price)
        end

        print("\nInfo:")
        for key, value in pairs(data.info) do
            print(key .. ": " .. value)
        end

        print("\n")
    elseif action == "e" then
        break
    else
        print("Invalid action. Please try again.")
    end
end

-- some changes :)