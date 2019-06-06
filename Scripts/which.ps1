function which([string] $name) {
    gcm $name | Select-Object -ExpandProperty Definition
}