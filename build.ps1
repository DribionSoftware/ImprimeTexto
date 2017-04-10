 $rootDir = $env:APPVEYOR_BUILD_FOLDER
 $buildNumber = $env:APPVEYOR_BUILD_NUMBER
 $solutionFile = "$rootDir\CDSImprimeTexto.sln"
 $srcDir = "$rootDir\nuget\CDSImprimeTexto.net"
 $slns = ls "$rootDir\*.sln"
 $packagesDir = "$rootDir\packages"
 $nuspecPath = "$rootDir\CDSImprimeTexto.nuspec"
 $nugetExe = "$packagesDir\NuGet.CommandLine.3.5.0\tools\NuGet.exe"
 $nupkgPath = "$rootDir\NuGet\CDSImprimeTexto.{0}.nupkg"

foreach($sln in $slns) {
   nuget restore $sln
}

[xml]$xml = cat $nuspecPath
$xml.package.metadata.version+=".$buildNumber"
$xml.Save($nuspecPath)

[xml]$xml = cat $nuspecPath
$nupkgPath = $nupkgPath -f $xml.package.metadata.version

nuget pack $nuspecPath -properties "Configuration=$env:configuration;Platform=AnyCPU;Version=$($env:appveyor_build_version)" -OutputDirectory $srcDir 
appveyor PushArtifact $nupkgPath
