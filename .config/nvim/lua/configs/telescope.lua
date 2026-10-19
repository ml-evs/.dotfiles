-- git_status picker with syntax-highlighted diffs rendered by delta.
-- Falls back to the stock (plain diff) previewer if delta isn't installed.
local M = {}

local delta_previewer = require('telescope.previewers').new_termopen_previewer({
  get_command = function(entry)
    -- Paths from `git status` are relative to the repo root; untracked files
    -- have no HEAD version, so diff them against /dev/null instead.
    local diff = entry.status == '??'
      and 'git diff --no-index -- /dev/null "$1"'
      or 'git diff HEAD -- "$1"'
    return {
      'sh', '-c',
      'cd "$(git rev-parse --show-toplevel)" && ' .. diff .. ' | delta --paging=always',
      '_', entry.value,
    }
  end,
})

function M.git_status()
  local opts = {}
  if vim.fn.executable('delta') == 1 then
    opts.previewer = delta_previewer
  end
  require('telescope.builtin').git_status(opts)
end

return M
