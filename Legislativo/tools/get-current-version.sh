#!/bin/bash
# get-current-version.sh - Obtiene la versión actual de la Constitución dinámicamente
# Uso: $(./get-current-version.sh) para obtener solo la versión
# Uso: ./get-current-version.sh --full para obtener información completa

set -e

# Función para obtener versión desde CONSTITUTION.md
get_version_from_constitution() {
    if [ -f "../CONSTITUTION.md" ]; then
        # Buscar línea que contenga versión en el header
        version=$(grep -i "versión\|version" "../CONSTITUTION.md" | head -1 | grep -oE "v?[0-9]+\.[0-9]+\.[0-9]+" | head -1)
        if [ -n "$version" ]; then
            echo "$version"
            return 0
        fi
    fi
    return 1
}

# Función para obtener versión desde CHANGELOG.md
get_version_from_changelog() {
    if [ -f "../CHANGELOG.md" ]; then
        # Buscar la primera entrada de versión no unreleased
        version=$(grep -E "^## \[[0-9]+\.[0-9]+\.[0-9]+\]" "../CHANGELOG.md" | head -1 | grep -oE "[0-9]+\.[0-9]+\.[0-9]+" | head -1)
        if [ -n "$version" ]; then
            echo "v$version"
            return 0
        fi
    fi
    return 1
}

# Función para obtener versión desde git tags
get_version_from_git() {
    # Buscar el tag más reciente que siga el formato semver
    version=$(git tag --sort=-version:refname | grep -E "^v?[0-9]+\.[0-9]+\.[0-9]+$" | head -1 2>/dev/null || echo "")
    if [ -n "$version" ]; then
        echo "$version"
        return 0
    fi
    return 1
}

# Función para obtener versión desde /versions/
get_version_from_versions_dir() {
    if [ -d "../versions" ]; then
        # Buscar el archivo de versión más reciente
        latest_version=$(find ../versions -name "v*-CONSTITUTION.*" | grep -oE "v[0-9]+\.[0-9]+\.[0-9]+" | sort -V | tail -1)
        if [ -n "$latest_version" ]; then
            echo "$latest_version"
            return 0
        fi
    fi
    return 1
}

# Función principal
get_current_version() {
    local version=""
    
    # Intentar diferentes métodos en orden de prioridad
    version=$(get_version_from_constitution 2>/dev/null) || \
    version=$(get_version_from_changelog 2>/dev/null) || \
    version=$(get_version_from_git 2>/dev/null) || \
    version=$(get_version_from_versions_dir 2>/dev/null) || \
    version="v3.0.0"  # Fallback por defecto
    
    # Normalizar formato (asegurar que tenga 'v' al inicio)
    if [[ ! "$version" =~ ^v ]]; then
        version="v$version"
    fi
    
    echo "$version"
}

# Función para obtener información completa
get_full_info() {
    local version=$(get_current_version)
    local date=$(date +"%B %Y")
    local commit=$(git rev-parse --short HEAD 2>/dev/null || echo "unknown")
    
    echo "Versión: ${version#v}"
    echo "Versión completa: $version" 
    echo "Fecha: $date"
    echo "Commit: $commit"
    echo "Constitución vigente: $version"
}

# Verificar argumentos
if [ "$1" = "--full" ] || [ "$1" = "-f" ]; then
    get_full_info
elif [ "$1" = "--help" ] || [ "$1" = "-h" ]; then
    echo "Uso: $0 [opciones]"
    echo ""
    echo "Opciones:"
    echo "  (sin argumentos)    Obtiene solo el número de versión (ej: v3.0.0)"
    echo "  --full, -f         Muestra información completa"  
    echo "  --help, -h         Muestra esta ayuda"
    echo ""
    echo "Métodos de detección (en orden de prioridad):"
    echo "  1. Header de CONSTITUTION.md"
    echo "  2. Primera entrada de CHANGELOG.md" 
    echo "  3. Tags de Git (más reciente)"
    echo "  4. Archivos en /versions/"
    echo "  5. Fallback: v3.0.0"
else
    get_current_version
fi