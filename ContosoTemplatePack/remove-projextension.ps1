<#
function Get-ScriptDirectory
{
    $Invocation = (Get-Variable MyInvocation -Scope 1).Value
    Split-Path $Invocation.MyCommand.Path
}

$scriptDir = ((Get-ScriptDirectory) + "\")

# find all .csproj files and remove the Project.ProjectExtension element
Get-ChildItem -Path $scriptDir -Include *.csproj -Recurse | ForEach-Object{
    $currentProj = $_
    # open the file as an xml doc
    [xml]$proj = Get-Content $currentProj
    $pe = $proj.Project.ProjectExtensions
    if($pe){
        'Removing ProjectExtensions from {0}' -f $currentProj | Write-Host
        $proj.Project.RemoveChild($pe)
        $proj.Save($currentProj)
    }
}

#>