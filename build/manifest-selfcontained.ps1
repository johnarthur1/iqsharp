#!/usr/bin/env pwsh
#Requires -PSEdition Core

& "$PSScriptRoot/set-env.ps1"

@{
    Assemblies = @(
        ".\src\tool\bin\$Env:BUILD_CONFIGURATION\netcoreapp3.1\linux-x64\Microsoft.Quantum.IQSharp.dll",
        ".\src\tool\bin\$Env:BUILD_CONFIGURATION\netcoreapp3.1\linux-x64\Microsoft.Quantum.IQSharp.Core.dll",
        ".\src\tool\bin\$Env:BUILD_CONFIGURATION\netcoreapp3.1\linux-x64\Microsoft.Quantum.IQSharp.Jupyter.dll",
        ".\src\tool\bin\$Env:BUILD_CONFIGURATION\netcoreapp3.1\linux-x64\Microsoft.Quantum.IQSharp.Kernel.dll",
        ".\src\tool\bin\$Env:BUILD_CONFIGURATION\netcoreapp3.1\linux-x64\Microsoft.Quantum.IQSharp.Web.dll",
        ".\src\tool\bin\$Env:BUILD_CONFIGURATION\netcoreapp3.1\osx-x64\Microsoft.Quantum.IQSharp.dll",
        ".\src\tool\bin\$Env:BUILD_CONFIGURATION\netcoreapp3.1\osx-x64\Microsoft.Quantum.IQSharp.Core.dll",
        ".\src\tool\bin\$Env:BUILD_CONFIGURATION\netcoreapp3.1\osx-x64\Microsoft.Quantum.IQSharp.Jupyter.dll",
        ".\src\tool\bin\$Env:BUILD_CONFIGURATION\netcoreapp3.1\osx-x64\Microsoft.Quantum.IQSharp.Kernel.dll",
        ".\src\tool\bin\$Env:BUILD_CONFIGURATION\netcoreapp3.1\osx-x64\Microsoft.Quantum.IQSharp.Web.dll",
        ".\src\tool\bin\$Env:BUILD_CONFIGURATION\netcoreapp3.1\win10-x64\Microsoft.Quantum.IQSharp.dll",
        ".\src\tool\bin\$Env:BUILD_CONFIGURATION\netcoreapp3.1\win10-x64\Microsoft.Quantum.IQSharp.Core.dll",
        ".\src\tool\bin\$Env:BUILD_CONFIGURATION\netcoreapp3.1\win10-x64\Microsoft.Quantum.IQSharp.Jupyter.dll",
        ".\src\tool\bin\$Env:BUILD_CONFIGURATION\netcoreapp3.1\win10-x64\Microsoft.Quantum.IQSharp.Kernel.dll",
        ".\src\tool\bin\$Env:BUILD_CONFIGURATION\netcoreapp3.1\win10-x64\Microsoft.Quantum.IQSharp.Web.dll"
    ) | ForEach-Object { Get-Item (Join-Path $PSScriptRoot ".." $_) };
} | Write-Output;