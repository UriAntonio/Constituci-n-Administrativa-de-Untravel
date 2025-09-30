#!/bin/bash

# 📊 Script de Comparación de Versiones Constitucionales
# Uso: ./compare-versions.sh [version1] [version2]
# Ejemplo: ./compare-versions.sh v2.0.0 v3.0.0

set -e

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Función de ayuda
show_help() {
    echo "🏛️ Comparador de Versiones Constitucionales de Untravel"
    echo ""
    echo "Uso: $0 [version1] [version2]"
    echo ""
    echo "Ejemplos:"
    echo "  $0 v1.0.0 v2.0.0    # Comparar versión 1.0.0 con 2.0.0"
    echo "  $0 v2.0.0 current   # Comparar v2.0.0 con versión actual"
    echo "  $0 list             # Listar versiones disponibles"
    echo ""
    echo "Versiones disponibles:"
    if [ -d "versions" ]; then
        ls versions/v*.0.0-CONSTITUTION.md 2>/dev/null | sed 's|versions/v||g' | sed 's|-CONSTITUTION.md||g' | sed 's/^/  - /'
    fi
    echo "  - current (versión actual en CONSTITUTION.md)"
}

# Función para listar versiones
list_versions() {
    echo -e "${BLUE}📚 Versiones Históricas Disponibles:${NC}"
    echo ""
    
    if [ -d "versions" ]; then
        for file in versions/v*.0.0-CONSTITUTION.md; do
            if [ -f "$file" ]; then
                version=$(basename "$file" | sed 's/v\(.*\)-CONSTITUTION.md/\1/')
                date=$(grep -m 1 "revisión:" "$file" | tail -1 | sed 's/.*revisión:\*\* //' | sed 's/ .*//')
                
                echo -e "  🏛️ ${GREEN}v$version${NC} - $date"
                
                # Mostrar primera línea del preámbulo para contexto
                if grep -q "Preámbulo" "$file"; then
                    preview=$(sed -n '/## Preámbulo/,/^$/p' "$file" | head -3 | tail -1 | cut -c1-60)
                    echo -e "      ${YELLOW}\"$preview...\"${NC}"
                fi
                echo ""
            fi
        done
    fi
    
    echo -e "  🔄 ${GREEN}current${NC} - $(date '+%d %b %Y') (versión actual)"
    echo ""
}

# Función para mostrar estadísticas de una versión
show_stats() {
    local file="$1"
    local name="$2"
    
    if [ ! -f "$file" ]; then
        echo -e "${RED}❌ Archivo no encontrado: $file${NC}"
        return 1
    fi
    
    echo -e "${BLUE}📊 Estadísticas de $name:${NC}"
    
    # Contar artículos
    articulos=$(grep -c "^## ARTÍCULO\|^### Artículo\|^## Artículo" "$file" 2>/dev/null || echo "0")
    titulos=$(grep -c "^## TÍTULO" "$file" 2>/dev/null || echo "0")
    secciones=$(grep -c "### Sección\|#### Sección" "$file" 2>/dev/null || echo "0")
    lineas=$(wc -l < "$file")
    palabras=$(wc -w < "$file")
    
    echo "  📜 Artículos: $articulos"
    if [ "$titulos" -gt 0 ]; then
        echo "  📑 Títulos: $titulos"
    fi
    echo "  📝 Secciones: $secciones"
    echo "  📏 Líneas: $lineas"
    echo "  🔤 Palabras: $palabras"
    echo ""
}

# Función principal de comparación
compare_versions() {
    local ver1="$1"
    local ver2="$2"
    
    # Determinar archivos a comparar
    if [ "$ver1" = "current" ]; then
        file1="CONSTITUTION.md"
        name1="Versión Actual"
    else
        file1="versions/v$ver1-CONSTITUTION.md"
        name1="v$ver1"
    fi
    
    if [ "$ver2" = "current" ]; then
        file2="CONSTITUTION.md"
        name2="Versión Actual"
    else
        file2="versions/v$ver2-CONSTITUTION.md"
        name2="v$ver2"
    fi
    
    # Verificar que ambos archivos existen
    if [ ! -f "$file1" ]; then
        echo -e "${RED}❌ No se encontró: $file1${NC}"
        return 1
    fi
    
    if [ ! -f "$file2" ]; then
        echo -e "${RED}❌ No se encontró: $file2${NC}"
        return 1
    fi
    
    echo -e "${BLUE}🔍 Comparando $name1 vs $name2${NC}"
    echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
    echo ""
    
    # Mostrar estadísticas de ambas versiones
    show_stats "$file1" "$name1"
    show_stats "$file2" "$name2"
    
    echo -e "${YELLOW}📋 Diferencias Estructurales:${NC}"
    
    # Comparar estructura de títulos/artículos
    echo ""
    echo -e "${GREEN}Estructura en $name1:${NC}"
    grep "^## TÍTULO\|^## ARTÍCULO\|^### Artículo" "$file1" | head -10
    
    echo ""
    echo -e "${GREEN}Estructura en $name2:${NC}"
    grep "^## TÍTULO\|^## ARTÍCULO\|^### Artículo" "$file2" | head -10
    
    echo ""
    echo -e "${YELLOW}💡 Para ver diferencias detalladas, use:${NC}"
    echo "  git diff --no-index $file1 $file2"
    echo ""
}

# Main script
case "${1:-}" in
    "help"|"-h"|"--help")
        show_help
        ;;
    "list"|"-l"|"--list")
        list_versions
        ;;
    "")
        echo -e "${YELLOW}⚠️ Se requieren parámetros${NC}"
        echo ""
        show_help
        exit 1
        ;;
    *)
        if [ $# -ne 2 ]; then
            echo -e "${RED}❌ Se requieren exactamente 2 versiones para comparar${NC}"
            echo ""
            show_help
            exit 1
        fi
        compare_versions "$1" "$2"
        ;;
esac