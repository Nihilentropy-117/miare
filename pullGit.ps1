# Define the repository URL
$repoURL = "https://github.com/nihilentropy-117/miare.git"

# Get the current working directory (CWD)
$cwd = Get-Location

# Define the destination directory to clone the repository (the same as 
CWD in this case)
$destinationPath = $cwd.Path

# Check if git repository already exists in the destination path
if(!(Test-Path -Path "$destinationPath\.git"))
{
    # If not, clone the repository
    git clone $repoURL $destinationPath
}
else
{
    # If yes, navigate to the directory
    Set-Location -Path $destinationPath

    # Fetch the changes from remote repository
    git fetch origin

    # Merge the changes from remote repository
    git merge origin/main

    # Navigate back to the original directory
    Set-Location -Path $cwd.Path
}

