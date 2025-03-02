if true then
  return {};
end;

return {
  "chaozwn/im-select.nvim",
  lazy = false,
  opts = {
    default_main_select = "com.apple.inputmethod.SCIM.ITABC",
    set_previous_events = { "InsertEnter", "FocusLost" },
  },
}
