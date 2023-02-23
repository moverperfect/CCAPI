-- Constants
local GITHUB_URL = "https://github.com/moverperfect/CCAPI/blob/master/API/murtle.txt"
local FILE_NAME = "mupdater"

-- Set the shell path
local path = shell.path() .. ":/disk/lib/:/lib/"
shell.setPath(path)

-- Ask the user if they want to update mupdater
print("Would you like to update mupdater?")
print("Enter 'y' for yes or 'n' for no.")
local update_choice = read()

-- Handle the user's input
if update_choice == "y" then
    -- Remove the old mupdater file and download the new one from GitHub
    shell.run("rm", FILE_NAME)
    result = shell.run("wget", "-f", GITHUB_URL, FILE_NAME)
    if not result then
        error("Failed to download new mupdater file from GitHub.")
    end
    print("mupdater updated successfully.")
elseif update_choice == "n" then
    -- Do nothing and exit
    return 1
else
    -- Handle unexpected input
    error("Invalid input. Please enter 'y' for yes or 'n' for no.")
end
