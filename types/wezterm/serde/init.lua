---@meta

---@class Serde
---@field json_decode fun(t: string): table<string, ANY>
---@field json_encode fun(t: table<string, ANY>): string
---@field toml_decode fun(t: string): table<string, ANY>
---@field toml_encode fun(t: table<string, ANY>): string
---@field yaml_decode fun(t: string): table<string, ANY>
---@field yaml_encode fun(t: table<string, ANY>): string
