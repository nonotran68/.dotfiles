return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {
    ignored_next_char = [=[[%w%%%'%[%"%.%`%$%<%>]]=],
  },
  -- use opts = {} for passing setup options
  -- this is equalent to setup({}) function
}
