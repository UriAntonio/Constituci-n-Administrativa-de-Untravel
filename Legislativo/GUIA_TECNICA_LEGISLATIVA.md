# 🏛️ Guía Técnica del Proceso Legislativo para el Alto Congreso Tlatocan

> **Versión:** 3.0.0  
> **Fecha:** Octubre 2025  
> **Dirigido a:** Miembros del Alto Congreso Tlatocan y legisladores autorizados

---

## 📋 **Índice**
1. [Tipos de Propuestas](#tipos-de-propuestas)
2. [Procesos según Origen](#procesos-según-origen)  
3. [Gestión de Issues](#gestión-de-issues)
4. [Votación y Seguimiento](#votación-y-seguimiento)
5. [Herramientas Legislativas](#herramientas-legislativas)
6. [Plantillas y Formatos](#plantillas-y-formatos)

---

## 🗳️ **Tipos de Propuestas**

### **REFORMA CONSTITUCIONAL** (Artículo 35)
- **Requiere:** Mayoría de 2/3 del Alto Congreso
- **Versionado:** Generalmente MAJOR o MINOR
- **Etiqueta:** `reforma-constitucional`
- **Revisión:** Suprema Corte (constitucionalidad)

### **NUEVA LEGISLACIÓN** (Artículo 16)
- **Requiere:** Mayoría simple 
- **Versionado:** MINOR o PATCH
- **Etiqueta:** `nueva-ley`
- **Revisión:** Comisión correspondiente

### **ENMIENDA TÉCNICA** (Correcciones menores)
- **Requiere:** Votación expedita
- **Versionado:** PATCH
- **Etiqueta:** `correccion-tecnica`
- **Revisión:** Secretario del Congreso

---

## 🔄 **Procesos según Origen**

### **A. PROPUESTA LEGISLATIVA INTERNA**
*Cuando un miembro del Alto Congreso Tlatocan propone directamente*

#### **Paso 1: Creación directa**
```bash
# Como legislador autorizado, puedes crear directamente
gh issue create --title "[LEGISLATIVO] Tu propuesta" \
                --label "legislativo,reforma-constitucional" \
                --assignee @tu-usuario
```

#### **Paso 2: Respaldo automático**
- ✅ **Tu membresía legislativa** actúa como respaldo automático
- ✅ **Proceso acelerado:** Mínimo debate de 3 días
- ✅ **Autorización directa** para crear PR sin aprobación previa

#### **Paso 3: Gestión privilegiada**
```markdown
## 🏛️ [PROPUESTA LEGISLATIVA INTERNA]

**Legislador proponente:** @tu-usuario  
**Autorización:** Miembro del Alto Congreso Tlatocan  
**Estado:** 🟢 AUTORIZADA DIRECTA

### 📋 Propuesta
[Tu contenido]

---
**Proceso acelerado habilitado** ⚡
```

---

### **B. PROPUESTA EXTERNA CON RESPALDO LEGISLATIVO**  
*Cuando un ciudadano propone pero tiene apoyo de legisladores*

#### **Paso 1: Identificación de respaldo**
```markdown
## 🏛️ [PROPUESTA EXTERNA - RESPALDO LEGISLATIVO]

**Ciudadano proponente:** @usuario-externo  
**Legisladores que respaldan:**
- @legislador1 - Especialidad: [Área]
- @legislador2 - Especialidad: [Área]  
- @legislador3 - Especialidad: [Área]

**Quórum de respaldo:** ✅ [X/Y legisladores necesarios]
```

#### **Paso 2: Proceso de validación**
**Los legisladores que respaldan deben:**

1. **Comentar formalmente su apoyo:**
```markdown
🏛️ **RESPALDO LEGISLATIVO FORMAL**

Como miembro del Alto Congreso Tlatocan, **respaldo oficialmente** esta propuesta.

**Justificación técnica:** [Por qué es viable]
**Área de especialidad:** [Tu competencia]  
**Recomendación:** [Modificaciones sugeridas]

---
@usuario-proponente tiene mi autorización para proceder con esta iniciativa.
```

2. **Aplicar etiquetas legislativas:**
   - `respaldo-legislativo` 
   - `revision-acelerada`
   - La etiqueta del tipo correspondiente

#### **Paso 3: Seguimiento conjunto**
- 👥 **Co-autoría:** Legislador + Ciudadano  
- 🔄 **Revisiones compartidas:** Ambos pueden editar
- ⚡ **Proceso semi-acelerado:** 5-7 días de debate

---

### **C. PROPUESTA EXTERNA SIN RESPALDO**
*Proceso estándar del Artículo 35*

#### **Seguimiento legislativo estándar:**
- 📅 **14 días de debate público mínimo**  
- 🔍 **Revisión completa por comisiones**
- 📊 **Evaluación de viabilidad técnica**
- 🗳️ **Votación formal tras análisis**

---

## 🛠️ **Gestión Técnica de Issues**

### **Etiquetas del Sistema Legislativo**

| Etiqueta | Uso | Autorización Requerida |
|----------|-----|----------------------|
| `legislativo` | Propuesta de miembro del Congreso | ✅ Auto |
| `respaldo-legislativo` | Externa con apoyo | 🏛️ Legislador |
| `revision-acelerada` | Proceso rápido | 🏛️ Legislador |
| `constitucion-critica` | Reforma sensible | ⚖️ Suprema Corte |
| `urgente` | Tratamiento prioritario | 👑 Huey Tlatoani |

### **Asignación Automática**
```yaml
# .github/ISSUE_TEMPLATE/config.yml
assignments:
  - if: has_label("legislativo")
    assign_to: "@Secretario-Congreso"
  
  - if: has_label("respaldo-legislativo")  
    assign_to: ["@legislador-responsable", "@Secretario-Congreso"]
    
  - if: has_label("constitucion-critica")
    assign_to: ["@Suprema-Corte", "@Secretario-Congreso"]
```

### **Comandos para Legisladores**

#### **Comandos básicos:**
```bash
# Crear propuesta legislativa
gh issue create --template propuesta-legislativa.yml

# Respaldar propuesta externa  
gh issue comment [número] --body "🏛️ RESPALDO LEGISLATIVO FORMAL..."

# Acelerar proceso
gh issue edit [número] --add-label "revision-acelerada"

# Marcar para votación
gh issue edit [número] --add-label "listo-votacion"
```

#### **Gestión de PR legislativo:**
```bash
# Crear PR desde propuesta
gh pr create --title "[LEGISLATIVO] Implementa Issue #[num]" \
             --body "Closes #[num]" \
             --label "implementacion-legislativa"

# Auto-aprobar si tienes autorización
gh pr review [número] --approve --body "✅ APROBACIÓN LEGISLATIVA"
```

---

## 🗳️ **Votación y Seguimiento**

### **Registro de Votos en Issues**

**Formato estándar para legisladores:**
```markdown
🏛️ **VOTO OFICIAL - [Tu nombre legislativo]**

**Decisión:** ✅ APRUEBO / ❌ RECHAZO / 🟡 ABSTENCIÓN  
**Justificación:** [Razón técnica de tu voto]  
**Observaciones:** [Modificaciones sugeridas]

**Especialidad consultada:** [Tu área de expertise]  
**Precedente:** [Casos similares si los hay]

---
*Voto registrado según Artículo 15 - [Fecha y hora]*
```

### **Seguimiento de Quórum**
```markdown
## 📊 REGISTRO DE VOTACIÓN

**Miembros del Alto Congreso presentes:** X/Y
**Quórum:** ✅ ALCANZADO / ❌ INSUFICIENTE

### Votos registrados:
✅ **A FAVOR (X votos):**
- @legislador1 - [Justificación breve]  
- @legislador2 - [Justificación breve]

❌ **EN CONTRA (Y votos):**  
- @legislador3 - [Justificación breve]

🟡 **ABSTENCIONES (Z votos):**
- @legislador4 - [Justificación breve]

**RESULTADO:** ✅ APROBADA (X%) / ❌ RECHAZADA (X%)  
**Mayoría requerida:** 2/3 para reformas / Simple para leyes
```

---

## 🛠️ **Herramientas Legislativas**

### **Scripts de Automatización**

#### **1. Validador de propuestas:**
```bash
#!/bin/bash
# validate-proposal.sh

issue_number=$1
echo "🔍 Validando propuesta legislativa #$issue_number..."

# Verificar formato
gh issue view $issue_number --json body | jq -r '.body' | grep -q "JUSTIFICACIÓN"
if [ $? -eq 0 ]; then
    echo "✅ Formato correcto"
else  
    echo "❌ Formato incompleto"
    exit 1
fi

# Verificar constitucionalidad
echo "⚖️ Revisión constitucional automática..."
# [Lógica de verificación]
```

#### **2. Generador de actas:**
```bash  
#!/bin/bash
# generate-acta.sh

issue_number=$1
echo "📝 Generando acta de votación para #$issue_number..."

gh issue view $issue_number --json comments \
| jq -r '.comments[] | select(.body | contains("VOTO OFICIAL"))' \
> acta-votacion-$issue_number.md

echo "📋 Acta generada: acta-votacion-$issue_number.md"
```

### **GitHub Actions para Legisladores**

#### **Workflow de validación:**
```yaml
# .github/workflows/legislativo-validation.yml
name: Validación Legislativa

on:
  issues:
    types: [opened, edited]
    
jobs:
  validate-proposal:
    if: contains(github.event.issue.labels.*.name, 'legislativo')
    runs-on: ubuntu-latest
    
    steps:
    - name: Validar formato legislativo
      run: |
        if [[ "${{ github.event.issue.body }}" =~ "JUSTIFICACIÓN" ]]; then
          echo "✅ Propuesta válida"
        else
          gh issue comment ${{ github.event.issue.number }} \
            --body "❌ Formato incompleto. Ver guía legislativa."
        fi
```

---

## 📋 **Plantillas y Formatos**

### **Plantilla para Reforma Constitucional**
```markdown
---
name: 🏛️ Propuesta Legislativa - Reforma Constitucional  
about: Para miembros del Alto Congreso Tlatocan
title: '[LEGISLATIVO] '
labels: 'legislativo, reforma-constitucional'
assignees: 'Secretario-Congreso'
---

## 🏛️ PROPUESTA LEGISLATIVA INTERNA

### 📋 Información del Legislador
- **Proponente:** @[tu-usuario]
- **Especialidad:** [Tu área de expertise]  
- **Antecedentes:** [Propuestas relacionadas anteriores]

### 🎯 Reforma Propuesta
**Artículos afectados:** [Lista específica]
**Tipo de cambio:** [MAJOR/MINOR/PATCH]

#### Situación actual:
```
[Texto constitucional actual]
```

#### Propuesta de reforma:  
```
[Nueva redacción propuesta]
```

### 💡 Justificación Legislativa
#### Análisis jurídico:
- [Fundamento constitucional]

#### Precedentes:
- [Casos similares o antecedentes]

#### Impacto estimado:
- [Análisis técnico del impacto]

### 🗓️ Cronograma Legislativo
- **Presentación:** [Fecha]
- **Debate:** [Período estimado]  
- **Votación:** [Fecha propuesta]
- **Implementación:** [Cronograma]

### ✅ Pre-validación Legislativa
- [ ] Revisión de constitucionalidad completada
- [ ] Consulta con especialistas realizada  
- [ ] Análisis de precedentes efectuado
- [ ] Evaluación de recursos necesarios
- [ ] Preparación de documentación técnica

---

**Autorización legislativa:** ✅ MIEMBRO DEL ALTO CONGRESO TLATOCAN  
**Proceso:** 🚀 ACELERADO (3 días mínimo de debate)
```

### **Plantilla para Respaldo Legislativo**
```markdown
## 🏛️ RESPALDO LEGISLATIVO OFICIAL

**Legislador:** @[tu-usuario]  
**Especialidad:** [Tu área]  
**Fecha:** [Fecha actual]

### 📋 Evaluación Técnica
**Propuesta evaluada:** #[número-issue]  
**Ciudadano proponente:** @[usuario-externo]

### ✅ Dictamen de Respaldo
**Decisión:** ✅ RESPALDO COMPLETO / 🟡 RESPALDO CON OBSERVACIONES

**Justificación técnica:**
- [Por qué consideras que es viable]
- [Aspectos positivos de la propuesta]  
- [Coherencia con marco constitucional]

**Modificaciones sugeridas:**
- [ ] [Cambio sugerido 1]
- [ ] [Cambio sugerido 2]

**Compromiso legislativo:**
- [ ] Seguimiento durante debate  
- [ ] Asesoría técnica al proponente
- [ ] Apoyo en votación final

### 🎯 Autorización
Como **miembro del Alto Congreso Tlatocan**, autorizo oficialmente esta propuesta para **proceso acelerado** según mis facultades legislativas.

**Co-responsabilidad:** Acepto co-responsabilidad técnica de esta iniciativa.

---
*Respaldo registrado según facultades del Artículo 16*
```

---

## 🔒 **Autorizations y Permisos**

### **Niveles de Autorización Técnica**

#### **🏛️ Nivel Legislador Pleno**
- ✅ Crear propuestas con proceso acelerado
- ✅ Respaldar propuestas externas  
- ✅ Aplicar etiquetas legislativas
- ✅ Auto-asignarse como revisor
- ✅ Acceso a herramientas de votación automática

#### **📋 Nivel Secretario del Congreso**  
- ✅ Todos los permisos de Legislador Pleno
- ✅ Gestión de quórum automático
- ✅ Generación de actas oficiales  
- ✅ Moderación de debates
- ✅ Scheduling de votaciones

#### **👑 Nivel Huey Tlatoani**
- ✅ Todos los permisos anteriores
- ✅ Declaración de urgencia constitucional
- ✅ Proceso de emergencia legislativa
- ✅ Override de requisitos temporales

### **Comandos según Autorización**

```bash
# Verificar tu nivel de autorización
gh api /repos/:owner/:repo/collaborators/:username/permission

# Comandos disponibles por nivel
gh extension install legislativo-tools
gh legislativo check-permissions
gh legislativo create-proposal [--accelerated]
gh legislativo backup-proposal [issue-number]
gh legislativo vote [issue-number] [approve|reject|abstain]
```

---

## 📞 **Contacto y Soporte Técnico**

### **Soporte Legislativo 24/7**
- **Canal Discord:** #legislativo-soporte
- **GitHub Teams:** @alto-congreso-tlatocan  
- **Email técnico:** legislativo@untravel.community

### **Escalación de Problemas**
1. **Nivel 1:** Secretario del Congreso
2. **Nivel 2:** Comisión de Constitución  
3. **Nivel 3:** Suprema Corte (casos constitucionales)
4. **Nivel 4:** Huey Tlatoani (emergencias)

### **Recursos Adicionales**
- [📖 Manual Completo del Legislador](./MANUAL_LEGISLADOR.md)
- [⚖️ Guía de Constitucionalidad](./GUIA_CONSTITUCIONALIDAD.md)  
- [🔧 Herramientas y Scripts](./tools/)
- [📊 Dashboard Legislativo](https://dashboard.untravel.community/legislativo)

---

**Última actualización:** Octubre 2025 - v3.0.0  
**Revisión:** Alto Congreso Tlatocan  
**Válido hasta:** Próxima reforma del proceso legislativo

---

*"La transparencia y eficiencia en el proceso legislativo fortalecen nuestra democracia digital"*  
— Principio del Artículo 4, Constitución de Untravel