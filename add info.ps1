
$title = Read-host 'Title'
$searchterm = Read-host 'Search term #1 - hidden in html'
$searchterm2 = Read-host 'Search term #2 - hidden in html'
$Info = Read-host "Info to add?"
$link = Read-host "Paste URL"


$data="   

  <tr><td>
" + $title + "
<p hidden>" + $title +
	"</p><p hidden>" + $searchterm1 + "</p><p hidden>" + $searchterm2 + 
 "</p></td>" +    "<td>	</td>" +  " <td>" + $Info + "<br>" +	"<a href=" + "'" + $link + "'" + "target=_blank>" + "Link" + "</a>
  </td></tr>
  
  "

$DesktopPath = [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::Desktop)
# Change out file location below !!!
$file = Get-childitem -Path "C:\temp\Base.html"
$body = Get-Content -Path $file -Raw
$parts = $body -split '<!--TABLE-->', 2

$newcontent = $parts[0] + $data + "<!--TABLE-->" + $parts[1] | set-content $file


