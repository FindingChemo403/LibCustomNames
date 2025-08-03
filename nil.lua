local lib_name = "LibCustomNames"
local lib = _G[lib_name]

--- Returns a read-only proxy table
local function readOnly(t)
    local proxy = {}
    local metatable = {
        --__metatable = "no indexing allowed",
        __index = t,
        __newindex = function(_, k, v)
            d("attempt to update read-only table")
        end,
    }
    setmetatable(proxy, metatable)
    return proxy
end

-- remove GetNamesTable function so others addons can not alter the data anymore
lib.GetNamesTable = nil

-- make the Lib read-only
_G[lib_name] = readOnly(lib)