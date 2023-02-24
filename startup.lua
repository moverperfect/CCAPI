-- Constants
local GITHUB_URL = "https://raw.githubusercontent.com/moverperfect/CCAPI/release/1.0/mupdater.lua"
local FILE_NAME = "mupdater.lua"

-- Set the shell path
local path = shell.path() .. ":/disk/lib/:/lib/"
shell.setPath(path)

-- Check if there is a new version of the file on GitHub
local github_file = http.get(GITHUB_URL)
if not github_file then
    error("Failed to download latest version of mupdater file from GitHub.")
end

local github_content = github_file.readAll()
github_file.close()

local local_file = fs.open(FILE_NAME, "r")
if local_file then
    local local_content = local_file.readAll()
    local_file.close()

    if github_content == local_content then
        print("mupdater is up to date.")
        return nil
    end
end

-- Download the latest version of the file from GitHub
shell.run("rm", FILE_NAME)
local result = shell.run("wget", GITHUB_URL, FILE_NAME)
if not result then
    error("Failed to download latest version of mupdater file from GitHub.")
end

print("mupdater updated successfully.")
