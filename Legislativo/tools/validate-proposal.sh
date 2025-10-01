#!/bin/bash
# validate-proposal.sh - Validador automático de propuestas legislativas
# Uso: ./validate-proposal.sh [número-issue]

set -e

# Función para obtener versión actual dinámicamente
get_current_version() {
    if [ -f "../../CHANGELOG.md" ]; then
        grep -m 1 "^## \[" ../../CHANGELOG.md | sed 's/## \[\([^]]*\)\].*/\1/'
    elif [ -f "../CHANGELOG.md" ]; then
        grep -m 1 "^## \[" ../CHANGELOG.md | sed 's/## \[\([^]]*\)\].*/\1/'
    elif [ -f "CHANGELOG.md" ]; then
        grep -m 1 "^## \[" CHANGELOG.md | sed 's/## \[\([^]]*\)\].*/\1/'
    else
        echo "3.0.0"  # fallback
    fi
}

# Colores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

CURRENT_VERSION=$(get_current_version)
echo -e "${BLUE}🔍 Validador de Propuestas Legislativas v$CURRENT_VERSION${NC}"
echo "=================================================="

# Verificar parámetros
if [ $# -ne 1 ]; then
    echo -e "${RED}❌ Error: Debes proporcionar el número de issue${NC}"
    echo "Uso: $0 [número-issue]"
    exit 1
fi

ISSUE_NUMBER=$1

echo -e "${BLUE}📋 Validando propuesta legislativa #$ISSUE_NUMBER...${NC}"

# Verificar que gh CLI esté instalado
if ! command -v gh &> /dev/null; then
    echo -e "${RED}❌ GitHub CLI (gh) no está instalado${NC}"
    echo "Instalar con: curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg"
    exit 1
fi

# Verificar autenticación
if ! gh auth status &> /dev/null; then
    echo -e "${RED}❌ No estás autenticado en GitHub CLI${NC}"
    echo "Ejecutar: gh auth login"
    exit 1
fi

# Obtener información del issue
echo -e "${YELLOW}🔍 Obteniendo información del issue...${NC}"

ISSUE_DATA=$(gh issue view $ISSUE_NUMBER --json title,body,labels,assignees,author 2>/dev/null || {
    echo -e "${RED}❌ No se pudo obtener el issue #$ISSUE_NUMBER${NC}"
    echo "Verificar que el issue existe y tienes permisos"
    exit 1
})

TITLE=$(echo "$ISSUE_DATA" | jq -r '.title')
BODY=$(echo "$ISSUE_DATA" | jq -r '.body')
LABELS=$(echo "$ISSUE_DATA" | jq -r '.labels[].name' | tr '\n' ',' | sed 's/,$//')
AUTHOR=$(echo "$ISSUE_DATA" | jq -r '.author.login')

echo -e "${GREEN}✅ Issue encontrado: $TITLE${NC}"
echo -e "${BLUE}📝 Autor: @$AUTHOR${NC}"
echo -e "${BLUE}🏷️  Etiquetas: $LABELS${NC}"

# Validaciones
VALIDATIONS_PASSED=0
TOTAL_VALIDATIONS=8

echo ""
echo -e "${BLUE}🔎 Ejecutando validaciones...${NC}"
echo "================================="

# 1. Validar formato del título
echo -n "1. Formato del título... "
if [[ "$TITLE" =~ ^\[(LEGISLATIVO|RESPALDADA|URGENTE)\] ]]; then
    echo -e "${GREEN}✅ VÁLIDO${NC}"
    ((VALIDATIONS_PASSED++))
else
    echo -e "${RED}❌ INVÁLIDO${NC}"
    echo -e "   ${YELLOW}⚠️  El título debe comenzar con [LEGISLATIVO], [RESPALDADA] o [URGENTE]${NC}"
fi

# 2. Validar etiquetas requeridas
echo -n "2. Etiquetas requeridas... "
if [[ "$LABELS" =~ legislativo|respaldo-legislativo|urgente ]]; then
    echo -e "${GREEN}✅ VÁLIDO${NC}"
    ((VALIDATIONS_PASSED++))
else
    echo -e "${RED}❌ INVÁLIDO${NC}"
    echo -e "   ${YELLOW}⚠️  Falta etiqueta: legislativo, respaldo-legislativo o urgente${NC}"
fi

# 3. Validar estructura del contenido
echo -n "3. Estructura del contenido... "
REQUIRED_SECTIONS=("PROPUESTA" "Justificación" "Análisis")
STRUCTURE_VALID=true

for section in "${REQUIRED_SECTIONS[@]}"; do
    if ! echo "$BODY" | grep -qi "$section"; then
        STRUCTURE_VALID=false
        break
    fi
done

if [ "$STRUCTURE_VALID" = true ]; then
    echo -e "${GREEN}✅ VÁLIDO${NC}"
    ((VALIDATIONS_PASSED++))
else
    echo -e "${RED}❌ INVÁLIDO${NC}"
    echo -e "   ${YELLOW}⚠️  Falta alguna sección requerida: ${REQUIRED_SECTIONS[*]}${NC}"
fi

# 4. Validar tipo de versionado
echo -n "4. Tipo de versionado... "
if echo "$BODY" | grep -qi "MAJOR\|MINOR\|PATCH"; then
    echo -e "${GREEN}✅ VÁLIDO${NC}"
    ((VALIDATIONS_PASSED++))
else
    echo -e "${RED}❌ INVÁLIDO${NC}"
    echo -e "   ${YELLOW}⚠️  Debe especificar tipo de versionado (MAJOR/MINOR/PATCH)${NC}"
fi

# 5. Validar justificación constitucional
echo -n "5. Justificación constitucional... "
if echo "$BODY" | grep -qi "Artículo\|constitucional\|principio"; then
    echo -e "${GREEN}✅ VÁLIDO${NC}"
    ((VALIDATIONS_PASSED++))
else
    echo -e "${YELLOW}⚠️  PARCIAL${NC}"
    echo -e "   ${YELLOW}⚠️  Recomendado: Incluir referencias constitucionales específicas${NC}"
fi

# 6. Validar checklist de pre-validación
echo -n "6. Checklist de validación... "
CHECKLIST_COUNT=$(echo "$BODY" | grep -c "\[ \]" || echo "0")
if [ "$CHECKLIST_COUNT" -gt 3 ]; then
    echo -e "${GREEN}✅ VÁLIDO${NC}"
    ((VALIDATIONS_PASSED++))
else
    echo -e "${YELLOW}⚠️  PARCIAL${NC}"
    echo -e "   ${YELLOW}⚠️  Recomendado: Incluir más elementos en checklist de validación${NC}"
fi

# 7. Validar autorización para propuestas legislativas
echo -n "7. Autorización legislativa... "
if [[ "$LABELS" =~ legislativo ]] && echo "$BODY" | grep -qi "MIEMBRO DEL ALTO CONGRESO"; then
    echo -e "${GREEN}✅ VÁLIDO${NC}"
    ((VALIDATIONS_PASSED++))
elif [[ "$LABELS" =~ respaldo-legislativo ]]; then
    echo -e "${GREEN}✅ VÁLIDO (con respaldo)${NC}"
    ((VALIDATIONS_PASSED++))
else
    echo -e "${YELLOW}⚠️  REVISAR${NC}"
    echo -e "   ${YELLOW}⚠️  Verificar autorización legislativa del autor${NC}"
fi

# 8. Validar coherencia con principios constitucionales
echo -n "8. Coherencia constitucional... "
if echo "$BODY" | grep -qi "Artículo 4\|principios\|valores"; then
    echo -e "${GREEN}✅ VÁLIDO${NC}"
    ((VALIDATIONS_PASSED++))
else
    echo -e "${YELLOW}⚠️  PARCIAL${NC}"
    echo -e "   ${YELLOW}⚠️  Recomendado: Verificar coherencia con Artículo 4 (Principios)${NC}"
fi

# Resultado final
echo ""
echo "================================="
PERCENTAGE=$((VALIDATIONS_PASSED * 100 / TOTAL_VALIDATIONS))

if [ $VALIDATIONS_PASSED -eq $TOTAL_VALIDATIONS ]; then
    echo -e "${GREEN}🎉 PROPUESTA TOTALMENTE VÁLIDA${NC}"
    echo -e "${GREEN}✅ $VALIDATIONS_PASSED/$TOTAL_VALIDATIONS validaciones pasadas ($PERCENTAGE%)${NC}"
    echo ""
    echo -e "${GREEN}🚀 La propuesta está lista para proceso acelerado${NC}"
    
    # Agregar comentario automático de aprobación
    gh issue comment $ISSUE_NUMBER --body "🤖 **VALIDACIÓN AUTOMÁTICA COMPLETADA**

✅ **RESULTADO:** PROPUESTA VÁLIDA ($PERCENTAGE% de validaciones pasadas)

La propuesta cumple con todos los requisitos técnicos y puede proceder al proceso legislativo correspondiente.

**Próximos pasos:**
1. ⏱️ Período de debate público (mínimo 3 días para propuestas legislativas)
2. 🗳️ Votación del Alto Congreso Tlatocan
3. 📋 Implementación técnica

---
*Validación automática realizada el $(date) por el sistema legislativo v$CURRENT_VERSION*"

elif [ $VALIDATIONS_PASSED -ge 6 ]; then
    echo -e "${YELLOW}⚠️  PROPUESTA PARCIALMENTE VÁLIDA${NC}"
    echo -e "${YELLOW}✅ $VALIDATIONS_PASSED/$TOTAL_VALIDATIONS validaciones pasadas ($PERCENTAGE%)${NC}"
    echo ""
    echo -e "${YELLOW}🔧 Se recomienda hacer mejoras antes del proceso legislativo${NC}"
    
    # Agregar comentario con sugerencias
    gh issue comment $ISSUE_NUMBER --body "🤖 **VALIDACIÓN AUTOMÁTICA COMPLETADA**

⚠️ **RESULTADO:** PROPUESTA PARCIALMENTE VÁLIDA ($PERCENTAGE% de validaciones pasadas)

La propuesta es viable pero se recomienda hacer algunas mejoras para optimizar el proceso legislativo.

**Sugerencias de mejora:**
- Revisar estructura y formato según plantillas oficiales
- Agregar más detalle en justificación constitucional
- Completar checklist de pre-validación

**Puede proceder al proceso, pero con revisión adicional.**

---
*Validación automática realizada el $(date) por el sistema legislativo v$CURRENT_VERSION*"

else
    echo -e "${RED}❌ PROPUESTA NECESITA MEJORAS${NC}"
    echo -e "${RED}✅ $VALIDATIONS_PASSED/$TOTAL_VALIDATIONS validaciones pasadas ($PERCENTAGE%)${NC}"
    echo ""
    echo -e "${RED}🔧 Se requieren mejoras significativas antes del proceso legislativo${NC}"
    
    # Agregar comentario con requerimientos
    gh issue comment $ISSUE_NUMBER --body "🤖 **VALIDACIÓN AUTOMÁTICA COMPLETADA**

❌ **RESULTADO:** PROPUESTA REQUIERE MEJORAS ($PERCENTAGE% de validaciones pasadas)

La propuesta necesita mejoras significativas antes de proceder al proceso legislativo.

**Requerimientos para aprobar:**
- Corregir formato del título y estructura
- Añadir etiquetas legislativas apropiadas  
- Completar secciones obligatorias
- Incluir justificación constitucional adecuada

**Recursos de ayuda:**
- [Guía Técnica Legislativa](../GUIA_TECNICA_LEGISLATIVA.md)
- [Plantillas de Issues](.github/ISSUE_TEMPLATE/)
- Canal #legislativo-soporte en Discord

---
*Validación automática realizada el $(date) por el sistema legislativo v$CURRENT_VERSION*"
fi

# Generar reporte detallado
REPORT_FILE="validation-report-$ISSUE_NUMBER-$(date +%Y%m%d-%H%M%S).md"

cat > "$REPORT_FILE" << EOF
# 📋 Reporte de Validación Legislativa

**Issue:** #$ISSUE_NUMBER  
**Título:** $TITLE  
**Autor:** @$AUTHOR  
**Fecha:** $(date)  
**Validaciones pasadas:** $VALIDATIONS_PASSED/$TOTAL_VALIDATIONS ($PERCENTAGE%)

## 🔍 Detalles de Validación

| Validación | Estado | Observaciones |
|------------|---------|---------------|
| Formato del título | $([ "$TITLE" =~ ^\[(LEGISLATIVO\|RESPALDADA\|URGENTE)\] ] && echo "✅" || echo "❌") | Debe comenzar con [LEGISLATIVO], [RESPALDADA] o [URGENTE] |
| Etiquetas requeridas | $(echo "$LABELS" | grep -q "legislativo\|respaldo-legislativo\|urgente" && echo "✅" || echo "❌") | Necesita etiqueta legislativa apropiada |
| Estructura de contenido | $(echo "$BODY" | grep -qi "PROPUESTA.*Justificación.*Análisis" && echo "✅" || echo "❌") | Debe incluir secciones obligatorias |
| Tipo de versionado | $(echo "$BODY" | grep -qi "MAJOR\|MINOR\|PATCH" && echo "✅" || echo "❌") | Especificar impacto del versionado |
| Justificación constitucional | $(echo "$BODY" | grep -qi "Artículo\|constitucional" && echo "✅" || echo "⚠️") | Incluir referencias constitucionales |
| Checklist de validación | $([ "$(echo "$BODY" | grep -c "\[ \]")" -gt 3 ] && echo "✅" || echo "⚠️") | Completar checklist de pre-validación |
| Autorización legislativa | $(echo "$BODY" | grep -qi "MIEMBRO DEL ALTO CONGRESO\|respaldo" && echo "✅" || echo "⚠️") | Verificar autorización del proponente |
| Coherencia constitucional | $(echo "$BODY" | grep -qi "Artículo 4\|principios" && echo "✅" || echo "⚠️") | Alinear con principios constitucionales |

## 📊 Resumen Ejecutivo

$(if [ $VALIDATIONS_PASSED -eq $TOTAL_VALIDATIONS ]; then
    echo "✅ **APROBADA:** La propuesta cumple todos los requisitos y puede proceder al proceso legislativo acelerado."
elif [ $VALIDATIONS_PASSED -ge 6 ]; then
    echo "⚠️ **CONDICIONAL:** La propuesta es viable con mejoras menores. Se recomienda optimización antes del proceso."
else
    echo "❌ **REQUIERE MEJORAS:** La propuesta necesita correcciones significativas antes de proceder."
fi)

---
*Reporte generado automáticamente por el sistema de validación legislativa v3.0.0*
EOF

echo ""
echo -e "${BLUE}📄 Reporte detallado guardado en: $REPORT_FILE${NC}"

# Estadísticas finales
echo ""
echo -e "${BLUE}📊 ESTADÍSTICAS DE VALIDACIÓN${NC}"
echo "================================="
echo -e "Total de validaciones: $TOTAL_VALIDATIONS"
echo -e "Validaciones pasadas: ${GREEN}$VALIDATIONS_PASSED${NC}"
echo -e "Porcentaje de éxito: ${GREEN}$PERCENTAGE%${NC}"
echo -e "Estado: $([ $VALIDATIONS_PASSED -eq $TOTAL_VALIDATIONS ] && echo -e "${GREEN}COMPLETAMENTE VÁLIDA${NC}" || 
                 [ $VALIDATIONS_PASSED -ge 6 ] && echo -e "${YELLOW}PARCIALMENTE VÁLIDA${NC}" || 
                 echo -e "${RED}REQUIERE MEJORAS${NC}")"

echo ""
echo -e "${BLUE}🏛️ Sistema de Validación Legislativa v3.0.0 - Alto Congreso Tlatocan${NC}"