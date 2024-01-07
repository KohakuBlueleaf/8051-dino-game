$compress = @{
    Path = "image", "src", "Makefile", "typescript", "README.md", "ppc5.pdf"
    CompressionLevel = "Fastest"
    DestinationPath = "./110062119-ppc5.zip"
}
Compress-Archive -Force @compress
$compress = @{
    Path = "./110062119-ppc5.zip"
    CompressionLevel = "Fastest"
    DestinationPath = "./110062119_final.zip"
}
Compress-Archive -Force @compress