-- added by me 20.08.26 

-- Case-insensitive natural sort (numeric-aware), directories first,
-- mimicking VS Code's default explorer sort order.
-- TODO: analyze this code, algorithm and implement it by myself
local function natural_cmp(a, b)
    a = a:lower()
    b = b:lower()
    local ia, ib = 1, 1
    while ia <= #a and ib <= #b do
        local ca, cb = a:sub(ia, ia), b:sub(ib, ib)
        if ca:match("%d") and cb:match("%d") then
            local na = a:match("^%d+", ia)
            local nb = b:match("^%d+", ib)
            if tonumber(na) ~= tonumber(nb) then
                return tonumber(na) < tonumber(nb)
            end
            ia = ia + #na
            ib = ib + #nb
        else
            if ca ~= cb then
                return ca < cb
            end
            ia = ia + 1
            ib = ib + 1
        end
    end
    return #a < #b
end

local function vscode_sort(item_a, item_b)
    if item_a.type == item_b.type then
        return natural_cmp(item_a.path, item_b.path)
    else
        return item_a.type < item_b.type
    end
end

return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        opts = {
            sort_function = vscode_sort,
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_hidden = false,
                }
            },
            default_component_configs = {
                file_size = {
                    enabled = false,
                },
                type = {
                    enabled = false,
                },
                last_modified = {
                    enabled = false,
                },
                created = {
                    enabled = false,
                },
            }
        }
    }
}
