-- Define a constant variable for the GitHub URL prefix
local GITHUB_PREFIX = "https://raw.githubusercontent.com/moverperfect/CCAPI/release/1.0/"

-- Download a file from a GitHub URL
function downloadFileFromGitHub(url, filename)
  shell.run("rm", filename)
  shell.run("wget", url, filename)
  print(filename .. " downloaded successfully")
end

-- Check if the user wants to update startup and murtle, and download them if so
function updateStartupAndMurtle()
  print("Would you like to update/download startup and murtle?")
  print("y/n")
  local resp = read()
  if resp == "y" then
    -- Remo ve existing startup script and download the latest version from GitHub
    downloadFileFromGitHub(GITHUB_PREFIX .. "startup.lua", "startup.lua")

    -- Create a directory for libraries and download murtle from GitHub
    shell.run("mkdir", "lib")
    downloadFileFromGitHub(GITHUB_PREFIX .. "lib/murtle.lua", "lib/murtle.lua")
    print("Library directory created and murtle downloaded successfully")
  end
end

-- Prompt the user to choose which program to download and download it if valid
function downloadPrograms()
  local programs = {
    ["eepyramid"] = "scripts/eepyramid.lua",
    ["pyramid"] = "scripts/pyramid.lua",
    ["floor"] = "scripts/floor.lua",
  }

  print("What programs would you like to download?")
  for programName, _ in pairs(programs) do
    print(programName)
  end

  local response = read()
  if response == "none" then
    -- If the user chooses "none", don't download any programs
    return
  elseif programs[response] ~= nil then
    -- If the user chooses a valid program, download it from GitHub
    downloadFileFromGitHub(GITHUB_PREFIX .. programs[response], response .. ".lua")
  else
    -- If the user chooses an invalid program, show an error message
    print("Invalid program name")
  end
end

-- Update startup and murtle, then download programs as specified by the user
updateStartupAndMurtle()
downloadPrograms()
