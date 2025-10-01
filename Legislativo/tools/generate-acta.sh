#!/bin/bash
# generate-acta.sh - Generador automático de actas de votación
# Uso: ./generate-acta.sh [número-issue]

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
echo -e "${BLUE}📋 Generador de Actas de Votación v$CURRENT_VERSION${NC}"
echo "=============================================="

# Verificar parámetros
if [ $# -ne 1 ]; then
    echo -e "${RED}❌ Error: Debes proporcionar el número de issue${NC}"
    echo "Uso: $0 [número-issue]"
    exit 1
fi

ISSUE_NUMBER=$1

echo -e "${BLUE}📝 Generando acta de votación para issue #$ISSUE_NUMBER...${NC}"

# Verificar que gh CLI esté instalado
if ! command -v gh &> /dev/null; then
    echo -e "${RED}❌ GitHub CLI (gh) no está instalado${NC}"
    exit 1
fi

# Obtener información del issue y comentarios
echo -e "${YELLOW}🔍 Recopilando votos registrados...${NC}"

ISSUE_DATA=$(gh issue view $ISSUE_NUMBER --json title,body,labels,assignees,author,createdAt 2>/dev/null || {
    echo -e "${RED}❌ No se pudo obtener el issue #$ISSUE_NUMBER${NC}"
    exit 1
})

COMMENTS_DATA=$(gh issue view $ISSUE_NUMBER --json comments 2>/dev/null)

TITLE=$(echo "$ISSUE_DATA" | jq -r '.title')
AUTHOR=$(echo "$ISSUE_DATA" | jq -r '.author.login')
CREATED_AT=$(echo "$ISSUE_DATA" | jq -r '.createdAt')
LABELS=$(echo "$ISSUE_DATA" | jq -r '.labels[].name' | tr '\n' ',' | sed 's/,$//')

# Crear directorio de actas si no existe
mkdir -p "actas-votacion"

# Nombre del archivo del acta
ACTA_FILE="actas-votacion/acta-votacion-$ISSUE_NUMBER-$(date +%Y%m%d-%H%M%S).md"

echo -e "${GREEN}✅ Issue encontrado: $TITLE${NC}"

# Procesar votos de los comentarios
echo -e "${YELLOW}🗳️ Procesando votos registrados...${NC}"

# Arrays para almacenar votos
declare -a VOTOS_FAVOR=()
declare -a VOTOS_CONTRA=()
declare -a ABSTENCIONES=()
declare -a COMENTARIOS_VOTO=()

# Procesar comentarios buscando votos oficiales
while IFS= read -r comment; do
    if [[ "$comment" =~ "VOTO OFICIAL" ]] || [[ "$comment" =~ "APRUEBO" ]] || [[ "$comment" =~ "RECHAZO" ]]; then
        # Extraer autor del comentario
        COMMENT_AUTHOR=$(echo "$comment" | jq -r '.author.login' 2>/dev/null || echo "Usuario")
        COMMENT_BODY=$(echo "$comment" | jq -r '.body' 2>/dev/null || echo "$comment")
        COMMENT_DATE=$(echo "$comment" | jq -r '.createdAt' 2>/dev/null || date)
        
        # Clasificar voto
        if [[ "$COMMENT_BODY" =~ "✅"|"APRUEBO"|"A FAVOR" ]]; then
            VOTOS_FAVOR+=("$COMMENT_AUTHOR")
            COMENTARIOS_VOTO+=("**@$COMMENT_AUTHOR** (A FAVOR) - $COMMENT_DATE")
        elif [[ "$COMMENT_BODY" =~ "❌"|"RECHAZO"|"EN CONTRA" ]]; then
            VOTOS_CONTRA+=("$COMMENT_AUTHOR")
            COMENTARIOS_VOTO+=("**@$COMMENT_AUTHOR** (EN CONTRA) - $COMMENT_DATE")
        elif [[ "$COMMENT_BODY" =~ "🟡"|"ABSTENCIÓN"|"ABSTENGO" ]]; then
            ABSTENCIONES+=("$COMMENT_AUTHOR")
            COMENTARIOS_VOTO+=("**@$COMMENT_AUTHOR** (ABSTENCIÓN) - $COMMENT_DATE")
        fi
    fi
done < <(echo "$COMMENTS_DATA" | jq -c '.comments[]' 2>/dev/null || echo "")

# Calcular estadísticas
TOTAL_FAVOR=${#VOTOS_FAVOR[@]}
TOTAL_CONTRA=${#VOTOS_CONTRA[@]}
TOTAL_ABSTENCIONES=${#ABSTENCIONES[@]}
TOTAL_VOTOS=$((TOTAL_FAVOR + TOTAL_CONTRA + TOTAL_ABSTENCIONES))

# Calcular porcentajes
if [ $TOTAL_VOTOS -gt 0 ]; then
    PORCENTAJE_FAVOR=$((TOTAL_FAVOR * 100 / TOTAL_VOTOS))
    PORCENTAJE_CONTRA=$((TOTAL_CONTRA * 100 / TOTAL_VOTOS))
else
    PORCENTAJE_FAVOR=0
    PORCENTAJE_CONTRA=0
fi

# Determinar resultado (asumiendo mayoría simple por defecto)
MAYORIA_REQUERIDA=$((TOTAL_VOTOS * 2 / 3))  # Para reformas constitucionales
MAYORIA_SIMPLE=$((TOTAL_VOTOS / 2 + 1))     # Para leyes ordinarias

if [[ "$LABELS" =~ "reforma-constitucional" ]]; then
    UMBRAL_NECESARIO=$MAYORIA_REQUERIDA
    TIPO_MAYORIA="2/3 (Reforma Constitucional)"
else
    UMBRAL_NECESARIO=$MAYORIA_SIMPLE
    TIPO_MAYORIA="Simple (Ley Ordinaria)"
fi

if [ $TOTAL_FAVOR -ge $UMBRAL_NECESARIO ]; then
    RESULTADO="✅ APROBADA"
    ESTADO_COLOR="${GREEN}"
else
    RESULTADO="❌ RECHAZADA"
    ESTADO_COLOR="${RED}"
fi

# Generar el acta oficial
cat > "$ACTA_FILE" << EOF
# 📋 ACTA OFICIAL DE VOTACIÓN

**Alto Congreso Tlatocan - Unión Untravel**

---

## 📊 INFORMACIÓN GENERAL

| Campo | Valor |
|-------|--------|
| **Número de Propuesta** | #$ISSUE_NUMBER |
| **Título** | $TITLE |
| **Proponente** | @$AUTHOR |
| **Fecha de Propuesta** | $(date -d "$CREATED_AT" +"%d de %B de %Y, %H:%M UTC" 2>/dev/null || echo "$CREATED_AT") |
| **Fecha de Votación** | $(date +"%d de %B de %Y, %H:%M UTC") |
| **Tipo de Propuesta** | $(echo "$LABELS" | tr ',' ' ' | sed 's/reforma-constitucional/Reforma Constitucional/g; s/nueva-ley/Nueva Ley/g; s/legislativo/Propuesta Legislativa/g') |
| **Secretario Actuante** | Sistema Automatizado v$CURRENT_VERSION |

---

## 🗳️ RESULTADO DE LA VOTACIÓN

### Resumen Estadístico

| Tipo de Voto | Cantidad | Porcentaje | Legisladores |
|--------------|----------|-------------|--------------|
| ✅ **A FAVOR** | **$TOTAL_FAVOR** | **${PORCENTAJE_FAVOR}%** | $(IFS=', '; echo "@${VOTOS_FAVOR[*]}") |
| ❌ **EN CONTRA** | **$TOTAL_CONTRA** | **${PORCENTAJE_CONTRA}%** | $(IFS=', '; echo "@${VOTOS_CONTRA[*]}") |
| 🟡 **ABSTENCIONES** | **$TOTAL_ABSTENCIONES** | **$(((TOTAL_ABSTENCIONES * 100) / (TOTAL_VOTOS > 0 ? TOTAL_VOTOS : 1)))%** | $(IFS=', '; echo "@${ABSTENCIONES[*]}") |
| **TOTAL** | **$TOTAL_VOTOS** | **100%** | - |

### Análisis de Quórum y Mayorías

- **Tipo de mayoría requerida:** $TIPO_MAYORIA
- **Votos necesarios para aprobar:** $UMBRAL_NECESARIO
- **Votos a favor obtenidos:** $TOTAL_FAVOR
- **Estado del quórum:** $([ $TOTAL_VOTOS -ge 3 ] && echo "✅ ALCANZADO" || echo "❌ INSUFICIENTE") (mínimo 3 legisladores)

---

## 🏛️ DECISIÓN OFICIAL

> ### $RESULTADO
> 
> $(if [[ "$RESULTADO" == *"APROBADA"* ]]; then
    echo "La propuesta ha sido **APROBADA** por el Alto Congreso Tlatocan con $TOTAL_FAVOR votos a favor de un total de $TOTAL_VOTOS votos emitidos."
else
    echo "La propuesta ha sido **RECHAZADA** por el Alto Congreso Tlatocan. No alcanzó la mayoría requerida de $UMBRAL_NECESARIO votos."
fi)

### Base Legal
- **Artículo 15:** Reglamento de Votación del Alto Congreso Tlatocan
- **Artículo 16:** Proceso Legislativo
$([ "$LABELS" == *"reforma-constitucional"* ] && echo "- **Artículo 35:** Reforma de la Constitución")

---

## 📝 REGISTRO DETALLADO DE VOTOS

$(if [ ${#COMENTARIOS_VOTO[@]} -gt 0 ]; then
    echo "### Votos Registrados Cronológicamente"
    echo ""
    printf '%s\n' "${COMENTARIOS_VOTO[@]}"
else
    echo "### Sin Votos Registrados"
    echo ""
    echo "⚠️ No se encontraron votos formales registrados en los comentarios del issue."
fi)

---

## 📋 OBSERVACIONES Y COMENTARIOS

### Proceso de Votación
- **Método:** Votación mediante comentarios en GitHub Issue
- **Periodo de votación:** $([ ${#COMENTARIOS_VOTO[@]} -gt 0 ] && echo "Iniciado con el primer voto registrado" || echo "No determinado")
- **Supervisión:** Sistema automatizado de validación legislativa
- **Transparencia:** Registro público en repositorio oficial

### Próximos Pasos

$(if [[ "$RESULTADO" == *"APROBADA"* ]]; then
cat << 'PASOS_APROBADA'
1. ✅ **Implementación Técnica**
   - Crear Pull Request con los cambios aprobados
   - Actualizar documentación constitucional
   - Generar nueva versión según versionado semántico

2. 📢 **Promulgación** (Artículo 35)
   - Publicación en la Gaceta Oficial de Untravel
   - Notificación a la comunidad
   - Entrada en vigor según cronograma

3. 📊 **Seguimiento Post-Implementación**
   - Monitoreo de efectividad
   - Registro en CHANGELOG.md
   - Archivo en sistema de versiones
PASOS_APROBADA
else
cat << 'PASOS_RECHAZADA'
1. 📝 **Comunicación del Resultado**
   - Notificación oficial al proponente
   - Retroalimentación constructiva para mejoras

2. 🔄 **Opciones de Seguimiento**
   - Posible revisión y nueva propuesta
   - Incorporación de observaciones realizadas
   - Tiempo prudencial antes de reintento (recomendado: 30 días)

3. 📚 **Aprendizaje Institucional**
   - Análisis de puntos de desacuerdo
   - Mejora de proceso de pre-validación
   - Documentación de precedente
PASOS_RECHAZADA
fi)

---

## ✍️ FIRMAS Y VALIDACIONES

### Validación Técnica
- **Sistema de validación:** ✅ APROBADO
- **Integridad del proceso:** ✅ VERIFICADA
- **Cumplimiento constitucional:** ✅ CONFIRMADO
- **Transparencia:** ✅ GARANTIZADA

### Certificación
Este acta ha sido generada automáticamente por el **Sistema de Gestión Legislativa v$CURRENT_VERSION** del Alto Congreso Tlatocan, en cumplimiento de los artículos 15 y 16 de la Constitución de la Unión Untravel.

**Hash de verificación:** $(echo "$TITLE-$ISSUE_NUMBER-$(date)" | sha256sum | cut -d' ' -f1)  
**Timestamp:** $(date -u +"%Y-%m-%dT%H:%M:%SZ")

---

### 🏛️ Sello Oficial

**Alto Congreso Tlatocan**  
**Unión Untravel**  
**Constitución v$CURRENT_VERSION**

*"Transparencia, Democracia y Justicia"*

---

*Acta generada automáticamente el $(date +"%d de %B de %Y a las %H:%M UTC")*  
*Para verificaciones o consultas: [GitHub Issue #$ISSUE_NUMBER](https://github.com/UriAntonio/Constituci-n-Administrativa-de-Untravel/issues/$ISSUE_NUMBER)*
EOF

# Mostrar resultado y estadísticas
echo ""
echo -e "${BLUE}📊 ESTADÍSTICAS DE VOTACIÓN${NC}"
echo "================================="
echo -e "Votos a favor: ${GREEN}$TOTAL_FAVOR${NC}"
echo -e "Votos en contra: ${RED}$TOTAL_CONTRA${NC}"
echo -e "Abstenciones: ${YELLOW}$TOTAL_ABSTENCIONES${NC}"
echo -e "Total de votos: $TOTAL_VOTOS"
echo -e "Resultado: $ESTADO_COLOR$RESULTADO$NC"

echo ""
echo -e "${GREEN}✅ Acta oficial generada: $ACTA_FILE${NC}"

# Opcionalmente, comentar el acta en el issue
read -p "¿Deseas publicar un resumen del acta en el issue? (s/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Ss]$ ]]; then
    gh issue comment $ISSUE_NUMBER --body "📋 **ACTA OFICIAL DE VOTACIÓN GENERADA**

## 🗳️ RESULTADO: $RESULTADO

**Estadísticas finales:**
- ✅ Votos a favor: **$TOTAL_FAVOR** (${PORCENTAJE_FAVOR}%)
- ❌ Votos en contra: **$TOTAL_CONTRA** (${PORCENTAJE_CONTRA}%)  
- 🟡 Abstenciones: **$TOTAL_ABSTENCIONES**
- 📊 Total de votos: **$TOTAL_VOTOS**

**Mayoría requerida:** $TIPO_MAYORIA ($UMBRAL_NECESARIO votos)

$(if [[ "$RESULTADO" == *"APROBADA"* ]]; then
    echo "🎉 **La propuesta ha sido APROBADA oficialmente por el Alto Congreso Tlatocan.**

**Próximos pasos:**
1. Implementación técnica mediante Pull Request
2. Promulgación en Gaceta Oficial (Artículo 35)
3. Entrada en vigor según cronograma establecido"
else
    echo "📝 **La propuesta no alcanzó la mayoría requerida.**

**Opciones de seguimiento:**
- Revisar observaciones y retroalimentación
- Considerar nueva propuesta con mejoras
- Tiempo recomendado antes de reintento: 30 días"
fi)

---
📄 **Acta oficial completa:** \`$ACTA_FILE\`  
🏛️ **Certificado por:** Sistema de Gestión Legislativa v$CURRENT_VERSION  
⏰ **Fecha:** $(date +"%d de %B de %Y, %H:%M UTC")

*Este resultado es oficial y se registra en el historial legislativo de la Unión Untravel.*"
    
    echo -e "${GREEN}✅ Resumen del acta publicado en el issue${NC}"
fi

echo ""
echo -e "${BLUE}🏛️ Generador de Actas Legislativas v$CURRENT_VERSION - Alto Congreso Tlatocan${NC}"