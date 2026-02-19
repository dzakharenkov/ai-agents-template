PS D:\AI_agents> git branch -a
+ architecture-design
+ documentation
+ feature-implementation
* master
+ quality-assurance
+ security-audit
PS D:\AI_agents>
PS D:\AI_agents> Write-Host "`nDirectory Structure:" -ForegroundColor Cyan

Directory Structure:
PS D:\AI_agents> dir | Where-Object {`$_.PSIsContainer -and `$_.Name -like "*-work"} | ForEach-Object {
>>     Write-Host "  📁 `$(`$_.Name)" -ForegroundColor Green
>>     Get-ChildItem "`$(`$_.Name)" -Filter "*.md" | ForEach-Object {
>>         Write-Host "     📄 `$(`$_.Name)" -ForegroundColor Gray
>>     }
>> }
$_.PSIsContainer : The term '$_.PSIsContainer' is not recognized as the name of a cmdlet, function, script file, or
operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try
again.
At line:1 char:21
+ dir | Where-Object {`$_.PSIsContainer -and `$_.Name -like "*-work"} | ...
+                     ~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: ($_.PSIsContainer:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException

$_.PSIsContainer : The term '$_.PSIsContainer' is not recognized as the name of a cmdlet, function, script file, or
operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try
again.
At line:1 char:21
+ dir | Where-Object {`$_.PSIsContainer -and `$_.Name -like "*-work"} | ...
+                     ~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: ($_.PSIsContainer:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException

$_.PSIsContainer : The term '$_.PSIsContainer' is not recognized as the name of a cmdlet, function, script file, or
operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try
again.
At line:1 char:21
+ dir | Where-Object {`$_.PSIsContainer -and `$_.Name -like "*-work"} | ...
+                     ~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: ($_.PSIsContainer:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException

$_.PSIsContainer : The term '$_.PSIsContainer' is not recognized as the name of a cmdlet, function, script file, or
operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try
again.
At line:1 char:21
+ dir | Where-Object {`$_.PSIsContainer -and `$_.Name -like "*-work"} | ...
+                     ~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: ($_.PSIsContainer:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException

$_.PSIsContainer : The term '$_.PSIsContainer' is not recognized as the name of a cmdlet, function, script file, or
operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try
again.
At line:1 char:21
+ dir | Where-Object {`$_.PSIsContainer -and `$_.Name -like "*-work"} | ...
+                     ~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: ($_.PSIsContainer:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException

$_.PSIsContainer : The term '$_.PSIsContainer' is not recognized as the name of a cmdlet, function, script file, or
operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try
again.
At line:1 char:21
+ dir | Where-Object {`$_.PSIsContainer -and `$_.Name -like "*-work"} | ...
+                     ~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: ($_.PSIsContainer:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException

$_.PSIsContainer : The term '$_.PSIsContainer' is not recognized as the name of a cmdlet, function, script file, or
operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try
again.
At line:1 char:21
+ dir | Where-Object {`$_.PSIsContainer -and `$_.Name -like "*-work"} | ...
+                     ~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: ($_.PSIsContainer:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException

$_.PSIsContainer : The term '$_.PSIsContainer' is not recognized as the name of a cmdlet, function, script file, or
operable program. Check the spelling of the name, or if a path was included, verify that the path is correct and try
again.
At line:1 char:21
+ dir | Where-Object {`$_.PSIsContainer -and `$_.Name -like "*-work"} | ...
+                     ~~~~~~~~~~~~~~~~~
    + CategoryInfo          : ObjectNotFound: ($_.PSIsContainer:String) [], CommandNotFoundException
    + FullyQualifiedErrorId : CommandNotFoundException

PS D:\AI_agents> "@ | Out-File -FilePath setup-agents.ps1 -Encoding UTF8
>>
>> Write-Host "✅ setup-agents.ps1 создан!" -ForegroundColor Green