-- created by me 19.07.26
-- based on the instruction from here https://docs.astronvim.com/recipes/dap/#setting-up-custom-debuggers

return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    local mason_registry = require("mason-registry")

    local js_debug_adapter = mason_registry.get_package("js-debug-adapter")
    -- dap.adapters.python = {
      -- type = "executable",
      -- command = "path/to/virtualenvs/debugpy/bin/python",
      -- args = { "-m", "debugpy.adapter" },
    -- }
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "127.0.0.1",
      port = "${port}",
      executable = {
       command = "node",
        args = {
         -- NOTE that we don't need to hardcode the path, but can instead use the location from the Mason-installed version via `:MasonInstall js-debug-adapter`
         -- vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
         js_debug_adapter:get_install_path() .. "/js-debug/src/dapDebugServer.js",
         -- NOTE that there's an issue with nvim-dap calling this if you DO NOT specify a port and the host as `127.0.0.1`
         "${port}",
         "127.0.0.1",
        },
      },
    }

    -- docs of avaialbe options here https://github.com/microsoft/vscode-js-debug/blob/main/OPTIONS.md
    dap.configurations.typescript = {
      {
        -- The first three options are required by nvim-dap
        type = "pwa-node", -- the type here established the link to the adapter definition: `dap.adapters.python`
        request = "launch",
        name = "Launch",
        -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
        program = "${file}", -- This configuration will launch the current file if used.
      },
      {
				type = "pwa-node",
				request = "attach",
				name = "Attach",
				cwd = "${workspaceFolder}",
				continueOnAttach = true,
				restart = true,
			  -- for node_modules I don't want to resolve source maps
			  -- (I want to debug thier source code)
			  resolveSourceMapLocations = {
          "${workspaceFolder}/**",
          "!**/node_modules/**"
        },
			},
    }
  end,
}
