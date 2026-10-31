param(
    [Parameter(Mandatory)][Alias('i')][string]$Url,
    [Parameter(Mandatory)][Alias('o')][string]$Name
)

$outDir = 'C:\Users\Patrick\Desktop\studel_samples\fun_noises'
New-Item -ItemType Directory -Force -Path $outDir | Out-Null

# Strip a trailing .wav (any case) so the extension is never doubled
$base = $Name -replace '\.wav$', ''

yt-dlp -x --audio-format wav -o "$outDir\$base.%(ext)s" $Url
