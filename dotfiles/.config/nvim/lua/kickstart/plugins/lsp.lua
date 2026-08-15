return {
  'neovim/nvim-lspconfig',
  dependencies = {
    { 'williamboman/mason.nvim', config = true },
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc, mode)
          mode = mode or 'n'
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
        end
        map('grd', function()
          require('fzf-lua').lsp_definitions()
        end, '[G]oto [D]efinition')
        map('grr', function()
          require('fzf-lua').lsp_references()
        end, '[G]oto [R]eferences')
        map('gri', function()
          require('fzf-lua').lsp_implementations()
        end, '[G]oto [I]mplementation')
        map('grt', function()
          require('fzf-lua').lsp_typedefs()
        end, 'Type [D]efinition')
        map('gO', function()
          require('fzf-lua').lsp_document_symbols()
        end, '[D]ocument [S]ymbols')
        map('gW', function()
          require('fzf-lua').lsp_workspace_symbols()
        end, '[W]orkspace [S]ymbols')
        map('grn', vim.lsp.buf.rename, '[R]e[n]ame')
        map('gra', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
        map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

        ---@param client vim.lsp.Client
        ---@param method vim.lsp.protocol.Method
        ---@param bufnr? integer
        ---@return boolean
        local function client_supports_method(client, method, bufnr)
          if vim.fn.has 'nvim-0.11' == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })
        end

        if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          map('<leader>th', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          end, '[T]oggle Inlay [H]ints')
        end
      end,
    })

    vim.diagnostic.config {
      virtual_text = false,
      virtual_lines = false,
      flags = {
        debounce_text_changes = 50,
      },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focus = false,
        focusable = false,
        style = 'minimal',
        border = 'shadow',
        source = 'if_many',
        header = '',
        prefix = '',
      },
      signs = vim.g.have_nerd_font and {
        text = {
          [vim.diagnostic.severity.ERROR] = '',
          [vim.diagnostic.severity.WARN] = '',
          [vim.diagnostic.severity.INFO] = '',
          [vim.diagnostic.severity.HINT] = '',
        },
      } or nil,
    }

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
    -- capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())

    local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
    -- local workspace_dir = '/path/to/workspace-root/' .. project_name
    local workspace_dir = vim.fn.expand '~/jdtls_cache/' .. project_name
    -- -- local workspace_dir = vim.fn.expand '~/.cache' .. '/jdtls/workspace/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
    -- -- local workspace_dir = vim.fn.expand '~/.cache' .. '/jdtls/workspace'
    -- local workspace_dir = vim.fn.expand '~/jdtls_cache'
    if vim.fn.executable 'jdtls' == 1 then
      vim.lsp.config('jdtls', {
        name = 'jdtls',
        cmd = {
          'jdtls',
          '-data',
          workspace_dir,
          '--jvm-arg=-Xms50m', -- Tiny initial memory footprint
          '--jvm-arg=-Xmx256m', -- Strictly capped at 256MB (or 512m if you want zero lag)
          '--jvm-arg=-XX:+UseG1GC',
          '--jvm-arg=-XX:+UseStringDeduplication',
          '--jvm-arg=-XX:TieredStopAtLevel=1', -- level 4 for prod 1 for cp
          -- '-Declipse.application=org.eclipse.jdt.ls.core.id1',
          -- '-Dosgi.bundles.defaultStartLevel=4',
          -- '-Declipse.product=org.eclipse.jdt.ls.core.product',
          -- '-Dlog.level=ALL',
          --add-modules=ALL-SYSTEM \
          --add-opens java.base/java.util=ALL-UNNAMED \
          --add-opens java.base/java.lang=ALL-UNNAMED \
          -- '-jar /home/terminator/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.7.200.v20260619-2039.jar',
          -- '-configuration /home/terminator/.local/share/nvim/mason/packages/jdtls/config_linux',
        },
        -- cmd = { 'jdtls' },
        -- root_dir = function(fname)
        --   return require('lspconfig.util').root_pattern('mvnw', 'gradlew', 'pom.xml', 'build.gradle', '.git')(fname) or vim.fn.getcwd()
        -- end,
        settings = {
          java = {
            server = {
              launchMode = 'LightWeight',
            },
            -- Custom eclipse.jdt.ls options go here
            autobuild = { enabled = false },
          },
        },
      })
    end
    if vim.fn.executable 'clangd' == 1 then
      vim.lsp.config('clangd', {
        cmd = {
          'clangd',
          '--background-index=false',
          '--pch-storage=memory',
          '--clang-tidy=false',
          '--completion-style=detailed',
          '--all-scopes-completion=false',
          '--header-insertion=never',
          '--limit-results=20',
        },
        single_file_support = true,
        capabilities = capabilities,
      })

      -- vim.lsp.config.clangd = {
      --   cmd = {
      --     'clangd',
      --     '--background-index=false',
      --     '--pch-storage=memory',
      --     '--clang-tidy=false',
      --     '--completion-style=detailed',
      --     '--all-scopes-completion=false',
      --     '--header-insertion=never',
      --     '--limit-results=20',
      --   },
      --   single_file_support = true,
      --   capabilities = capabilities,
      -- }
    end

    if vim.fn.executable 'lua_ls' == 1 then
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            diagnostics = {
              disable = { 'missing-fields' },
            },
          },
        },
        capabilities = capabilities,
      })
      vim.lsp.config.lua_ls = {
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            diagnostics = {
              disable = { 'missing-fields' },
            },
          },
        },
        capabilities = capabilities,
      }
    end

    local ensure_installed = vim.tbl_keys {}
    vim.list_extend(ensure_installed, {
      'clangd',
      'lua_ls',
      'cssls',
      'jdtls',
      'html',
      'ts_ls',
      'clang-format',
      'stylua',
      'prettier',
    })
    -- require('mason-tool-installer').setup { ensure_installed = ensure_installed }
    -- require('mason-tool-installer').setup {}

    require('mason-lspconfig').setup {
      ensure_installed = {},
      automatic_enable = true,
    }
  end,
}
