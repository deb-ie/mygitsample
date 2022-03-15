Get-Item -Path C:\git\deb-firstgit
 #get inside that folder name
Get-ChildItem C:\git\deb-firstgit 
#getting the sum of foldername 
Get-ChildItem C:\git\deb-firstgit | Measure-Object -Property Length -Sum -Average
$folderItems = (Get-ChildItem C:\git\deb-firstgit | Measure-Object -Property Length -Sum)
$sum = "{0:N2}" -f ($folderItems.sum /1KB) + "KB"
Write-Output "Total file size of deb-testgit is: " ; $sum

Get-ChildItem C:\git\deb-firstgit\*.txt| Measure-Object -Property Length -Sum -Average
$folderItems = (Get-ChildItem C:\git\deb-firstgit\*.txt | Measure-Object -Property Length -Sum)
$sum = "{0:N2}" -f ($folderItems.sum /1KB) + "KB"
Write-Output "Total file size of deb-testgit.txt is: " ; $sum 
$thisFolder =  "C:\git\deb-firstgit" 

$folderItems = (Get-ChildItem $thisFolder -Recurse |Where-Object {$_.PSIsContainer -eq $True} | Sort-Object)
foreach ($Dire in $folderItems)
   {
        $subFolderItems = (Get-ChildItem $Dire.FullName | Measure-Object -property length -sum)
        $Dire.FullName + " -- " + "{0:N2}" -f ($subFolderItems.sum / 1KB) + " KB"
    }