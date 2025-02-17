function Get-ScriptDirectory {
	    Split-Path -Parent $PSCommandPath
}

$script_dir = Get-ScriptDirectory
# token not necessary for small requests
$token = 'DEMO_KEY'

$date = Get-Date -Format 'yyyy-MM-dd'

$hdurl=(Invoke-WebRequest -Uri "https://api.nasa.gov/planetary/apod?api_key=$token&date=$date&concept_tags=True" | ConvertFrom-Json ).'hdurl'
Invoke-WebRequest $hdurl -Outfile "$script_dir/APOD.jpg"

# -WindowStyle Hidden -NoProfile -NonInteractive -file C:\Users\non-admin\Desktop\A\MRL\LEARN\gitRepos\APOD-desktop\downloadAPOD.ps1