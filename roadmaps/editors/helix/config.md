- Config - Example

```markdown

# rustup component add rust-analyzer

theme = "catppuccin_mocha"

[editor]
#line-number = "relative"
mouse = false
auto-completion=true
auto-save=true
auto-format=true
text-width=80
gutters = [ "diagnostics", "spacer"] # line-numbers
soft-wrap.enable = true
soft-wrap.max-indent-retain=80
end-of-line-diagnostics= "hint"

[editor.inline-diagnostics]
cursor-line= "error"

[editor.file-picker]
hidden = false

[editor.statusline]
left = ["mode", "spinner", "file-modification-indicator", "read-only-indicator"]
center = ["file-name"]
right = ["diagnostics", "register", "selections", "position", "file-encoding", "file-line-ending", "file-type"]
separator = "│"
mode.normal = "LOCKED"
mode.insert = "WORKING"
mode.select = "VISUAL SEL"

[editor.lsp]
enable=true
auto-signature-help=true
display-messages = true

[editor.indent-guides]
render = false
character = "┊"
skip-levels = 1
  
```
