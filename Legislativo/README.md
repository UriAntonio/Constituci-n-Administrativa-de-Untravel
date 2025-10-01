# 🏛️ Sistema Legislativo del Alto Congreso Tlatocan

> **Versión:** 3.0.0 | **Última actualización:** Octubre 2025  
> **Dirigido a:** Miembros del Alto Congreso Tlatocan, legisladores autorizados y ciudadanos

---

## 📋 **Descripción General**

Este directorio contiene toda la infraestructura técnica y documentación para la gestión del proceso legislativo de la **Unión Untravel**, según lo establecido en la Constitución v3.0.0.

El sistema está diseñado para manejar tanto **propuestas legislativas internas** (de miembros del Alto Congreso) como **propuestas ciudadanas con respaldo legislativo**, garantizando transparencia, eficiencia y cumplimiento constitucional.

---

## 📁 **Estructura del Directorio**

```
Legislativo/
├── README.md                        # Este archivo
├── GUIA_TECNICA_LEGISLATIVA.md     # Manual técnico completo
├── tools/                          # Herramientas de automatización
│   ├── validate-proposal.sh        # Validador automático de propuestas
│   ├── generate-acta.sh            # Generador de actas de votación
│   └── actas-votacion/             # Directorio de actas generadas
└── .github/ISSUE_TEMPLATE/         # Plantillas de GitHub Issues
    ├── propuesta-legislativa.yml   # Para legisladores del Alto Congreso
    ├── propuesta-respaldada.yml    # Para ciudadanos con respaldo
    ├── reforma-urgente.yml         # Para emergencias constitucionales
    └── config.yml                  # Configuración de plantillas
```

---

## 🚀 **Inicio Rápido**

### **Para Legisladores del Alto Congreso Tlatocan:**

1. **Crear propuesta legislativa directa:**
   ```bash
   # Usar plantilla oficial en GitHub Issues
   # Ir a: GitHub > Issues > New Issue > 🏛️ Propuesta Legislativa Interna
   ```

2. **Sistema automático GitHub Actions:**
   - ✅ **Validación automática** al crear/editar Issues
   - ✅ **Generación de actas** mediante GitHub Actions  
   - ✅ **Gestión de versiones** completamente automatizada
   - ✅ **Sin scripts locales** requeridos

3. **Acciones manuales opcionales:**
   ```bash
   # Solo si necesitas ejecutar localmente (no recomendado)
   ./Legislativo/tools/validate-proposal.sh [número-issue]
   ./Legislativo/tools/generate-acta.sh [número-issue]
   ```

### **Para Ciudadanos con Respaldo Legislativo:**

1. **Crear propuesta con respaldo:**
   ```bash
   # Usar plantilla en GitHub Issues  
   # Ir a: GitHub > Issues > New Issue > 📝 Propuesta Ciudadana con Respaldo
   ```

2. **Solicitar respaldo formal de legisladores**
3. **Seguir proceso semi-acelerado (5-7 días)**

---

## 📚 **Documentación Disponible**

### 📖 **Guías Principales**
- **[GUIA_TECNICA_LEGISLATIVA.md](./GUIA_TECNICA_LEGISLATIVA.md)**: Manual técnico completo con todos los procesos
- **[CONTRIBUTING.md](../CONTRIBUTING.md)**: Guía general de contribución constitucional
- **[CONSTITUTION.md](../CONSTITUTION.md)**: Texto completo de la Constitución v3.0.0

### � **Sistema GitHub Actions (Sin Scripts)**
- **🔍 [SISTEMA_GITHUB_ACTIONS.md](./SISTEMA_GITHUB_ACTIONS.md)**: Documentación técnica completa
- **⚡ Validación automática**: Workflow `legislative-tools-replacement.yml`
- **📋 Generación de actas**: Activación automática al detectar 5+ votos
- **🏛️ Soporte legislativo**: Análisis de tendencias y precedentes automático

### 📋 **Plantillas de Issues (YAML Forms)**
- **🏛️ [Propuesta Legislativa](../.github/ISSUE_TEMPLATE/propuesta-legislativa.yml)**: Alto Congreso (3 días)
- **🤝 [Propuesta Respaldada](../.github/ISSUE_TEMPLATE/propuesta-respaldada.yml)**: Ciudadanos con apoyo (5-7 días)  
- **🚨 [Reforma Urgente](../.github/ISSUE_TEMPLATE/reforma-urgente.yml)**: Emergencias (24-48h)

### 🚫 **Scripts Deprecados** 
> ❌ Los siguientes scripts han sido **completamente reemplazados** por GitHub Actions:
> - ~~`validate-proposal.sh`~~ → GitHub Actions workflow
> - ~~`generate-acta.sh`~~ → GitHub Actions workflow  
> - ~~`compare-versions.sh`~~ → Dynamic version detection

---

## 🔧 **Configuración Técnica**

### **✅ Requisitos del Sistema**
- **GitHub Actions** - ✅ Incluido nativamente
- **GitHub Issues** - ✅ Para formularios legislativos  
- **Repositorio público** - ✅ Para transparencia total

### **🚫 YA NO se requiere:**
- ~~GitHub CLI (gh)~~ 
- ~~jq para JSON~~
- ~~bash scripts~~
- ~~Dependencias locales~~
- **Permisos de escritura** en el repositorio (para legisladores)

### **Instalación de Dependencias**
```bash
# GitHub CLI
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update && sudo apt install gh

# jq (procesamiento JSON)
sudo apt install jq

# Autenticación
gh auth login
```

### **Verificación de Permisos**
```bash
# Verificar nivel de autorización
gh api /repos/:owner/:repo/collaborators/:username/permission

# Verificar herramientas
./Legislativo/tools/validate-proposal.sh --help
./Legislativo/tools/generate-acta.sh --help
```

---

## 🗳️ **Tipos de Procesos Legislativos**

### 🏛️ **Proceso Acelerado (Legisladores)**
- **Quién puede usar:** Miembros del Alto Congreso Tlatocan
- **Tiempo mínimo:** 3 días de debate
- **Autorización:** Automática por membresía legislativa
- **Etiqueta:** `legislativo`

### ⚡ **Proceso Semi-acelerado (Con Respaldo)**
- **Quién puede usar:** Ciudadanos con respaldo de legisladores
- **Tiempo mínimo:** 5-7 días de debate
- **Autorización:** Requiere respaldo formal de legisladores
- **Etiqueta:** `respaldo-legislativo`

### 📅 **Proceso Estándar (Ciudadano)**
- **Quién puede usar:** Cualquier miembro de la comunidad
- **Tiempo mínimo:** 14 días de debate
- **Autorización:** Según Artículo 35 (proceso completo)
- **Etiqueta:** `propuesta-ciudadana`

### 🚨 **Proceso de Emergencia (Urgente)**
- **Quién puede usar:** Huey Tlatoani, Suprema Corte, mayoría del Congreso
- **Tiempo mínimo:** 24-48 horas
- **Autorización:** Requiere declaración de urgencia
- **Etiqueta:** `urgente`

---

## 🤖 **Sistema GitHub Actions (Automatización Moderna)**

### **🎯 Filosofía del Sistema**
> **"GitHub Actions First"** - Priorizar automatización en la nube sobre scripts locales

El sistema legislativo ha migrado a **GitHub Actions** para proporcionar:
- ✅ **Ejecución en la nube** sin dependencias locales
- ✅ **Integración nativa** con GitHub Issues y API
- ✅ **Historial auditable** e inmutable
- ✅ **Escalabilidad automática** y alta disponibilidad

### **🚀 Workflows Principales**

#### **1. 🏛️ Validación Legislativa Automática** 
**Archivo:** `.github/workflows/legislativo-automation.yml`
- **Trigger:** Issues creados/editados con etiquetas legislativas
- **Funciones:** 
  - Detección automática del tipo de propuesta
  - Validación de estructura y constitucionalidad
  - Verificación de autorización legislativa
  - Seguimiento de votación en tiempo real
- **Output:** Comentarios automáticos con validación detallada

#### **2. 📊 Gestión Automática de Versiones**
**Archivo:** `.github/workflows/version-management.yml`
- **Trigger:** Cambios en CONSTITUTION.md o CHANGELOG.md
- **Funciones:**
  - Detección automática de cambios de versión
  - Actualización de referencias hardcodeadas
  - Archivo automático de versiones MAJOR
  - Creación de releases con notas generadas
- **Output:** Sistema de versionado completamente dinámico

#### **3. 🧹 Migración GitHub Actions Puros**
**Archivo:** `.github/workflows/github-actions-migration.yml`
- **Trigger:** Manual (workflow_dispatch)
- **Funciones:**
  - Validación de propuestas sin scripts .sh
  - Generación de actas como GitHub Issues
  - Verificación de sistema de versiones dinámico
- **Output:** Funcionalidad completa sin dependencias externas

### **⚡ Ventajas sobre Scripts Tradicionales**

| Característica | Scripts .sh | GitHub Actions |
|----------------|-------------|----------------|
| **Ejecución** | Local | ☁️ En la nube |
| **Dependencias** | gh CLI, jq, bash | ✅ Nativas |
| **Historial** | Sin registro | 📊 Completo |
| **Escalabilidad** | Manual | 🚀 Automática |
| **Integración** | Limitada | 🔗 Nativa |
| **Auditabilidad** | Básica | 🔒 Inmutable |

---

## 🔍 **Sistema de Validación**

### **Validación Automática**
El script `validate-proposal.sh` evalúa automáticamente:

1. **Formato del título** (prefijos correctos)
2. **Etiquetas requeridas** (según tipo de propuesta)
3. **Estructura del contenido** (secciones obligatorias)
4. **Tipo de versionado** (MAJOR/MINOR/PATCH)
5. **Justificación constitucional** (referencias a artículos)
6. **Checklist de pre-validación** (completitud)
7. **Autorización legislativa** (según origen)
8. **Coherencia constitucional** (principios del Artículo 4)

### **Niveles de Aprobación**
- **100%**: ✅ Totalmente válida (proceso acelerado)
- **75-99%**: ⚠️ Parcialmente válida (revisión adicional)
- **<75%**: ❌ Requiere mejoras (no puede proceder)

---

## 📊 **Sistema de Votación y Actas**

### **Registro de Votos**
Los votos se registran mediante **comentarios oficiales** en los Issues:

```markdown
🏛️ **VOTO OFICIAL - [Nombre Legislador]**

**Decisión:** ✅ APRUEBO / ❌ RECHAZO / 🟡 ABSTENCIÓN
**Justificación:** [Razón técnica]
**Especialidad consultada:** [Área de expertise]

---
*Voto registrado según Artículo 15*
```

### **Generación de Actas**
El script `generate-acta.sh` genera automáticamente:

- **Acta oficial** con formato institucional
- **Estadísticas detalladas** de votación
- **Análisis de quórum** y mayorías
- **Certificación técnica** con hash de verificación
- **Próximos pasos** según resultado

---

## 🏷️ **Sistema de Etiquetas GitHub**

| Etiqueta | Propósito | Autorización |
|----------|-----------|--------------|
| `legislativo` | Propuesta de miembro del Congreso | ✅ Automática |
| `respaldo-legislativo` | Ciudadana con apoyo legislativo | 🏛️ Legislador |
| `reforma-constitucional` | Modifica artículos existentes | ⚖️ Según impacto |
| `nueva-ley` | Legislación nueva | 📝 Proceso estándar |
| `urgente` | Tratamiento de emergencia | 👑 Huey Tlatoani |
| `revision-acelerada` | Proceso rápido habilitado | 🏛️ Legislador |
| `listo-votacion` | Preparado para votación | 📋 Secretario |

---

## 🔧 **Comandos Útiles**

### **GitHub CLI - Legisladores**
```bash
# Crear propuesta legislativa
gh issue create --template propuesta-legislativa.yml

# Respaldar propuesta ciudadana
gh issue comment [número] --body "🏛️ RESPALDO LEGISLATIVO FORMAL..."

# Aplicar etiquetas legislativas
gh issue edit [número] --add-label "revision-acelerada"

# Crear PR desde propuesta aprobada
gh pr create --title "[LEGISLATIVO] Implementa Issue #[num]" \
             --body "Closes #[num]" \
             --label "implementacion-legislativa"
```

### **Herramientas de Validación**
```bash
# Validar propuesta completa
./Legislativo/tools/validate-proposal.sh [número-issue]

# Generar acta de votación
./Legislativo/tools/generate-acta.sh [número-issue]

# Comparar versiones constitucionales
./versions/compare-versions.sh compare v3.0.0 nueva-version
```

---

## 📞 **Soporte y Contacto**

### **Canales de Soporte**
- **📞 Soporte Legislativo 24/7:** Discord #legislativo-soporte
- **👥 GitHub Teams:** @alto-congreso-tlatocan
- **✉️ Email técnico:** legislativo@untravel.community

### **Escalación de Problemas**
1. **Nivel 1:** Secretario del Congreso (asuntos técnicos)
2. **Nivel 2:** Comisión de Constitución (interpretación legal)
3. **Nivel 3:** Suprema Corte (casos constitucionales)
4. **Nivel 4:** Huey Tlatoani (emergencias críticas)

### **Recursos de Ayuda**
- 🔧 [Troubleshooting técnico](./GUIA_TECNICA_LEGISLATIVA.md#troubleshooting)
- 📚 [Ejemplos prácticos](./GUIA_TECNICA_LEGISLATIVA.md#ejemplos)
- 🎥 [Tutoriales en video](#) *(próximamente)*
- 💬 [Preguntas frecuentes](./GUIA_TECNICA_LEGISLATIVA.md#faq)

---

## 🔒 **Seguridad y Permisos**

### **Niveles de Autorización**
- **🏛️ Legislador Pleno:** Todos los permisos legislativos
- **📋 Secretario del Congreso:** + Gestión de quórum y moderación
- **👑 Huey Tlatoani:** + Declaración de emergencia y override

### **Protecciones Implementadas**
- ✅ **Validación automática** antes del proceso
- ✅ **Registro inmutable** de votos en GitHub
- ✅ **Certificación criptográfica** de actas
- ✅ **Auditoría completa** de cambios constitucionales
- ✅ **Respaldo automático** en sistema de versiones

---

## 📈 **Estadísticas y Métricas**

### **Dashboard Legislativo** *(en desarrollo)*
- 📊 Propuestas por mes/trimestre
- 🗳️ Estadísticas de votación por legislador
- ⏱️ Tiempo promedio de proceso
- 📈 Tendencias y análisis

### **Métricas de Calidad**
- ✅ **Tasa de aprobación** de propuestas legislativas
- 🔍 **Puntuación promedio** en validación automática
- 💬 **Participación** en debates públicos
- 📋 **Completitud** de documentación

---

## 🎯 **Próximas Mejoras**

### **Roadmap Técnico Q4 2025**
- [ ] **Dashboard web** para seguimiento en tiempo real
- [ ] **API REST** para integración externa
- [ ] **Notificaciones automáticas** por Discord/email
- [ ] **Análisis de sentimientos** en debates
- [ ] **Integración con IA** para pre-revisión

### **Mejoras de Proceso**
- [ ] **Votación electrónica** con múltiples factores
- [ ] **Simulador de impacto** constitucional
- [ ] **Feedback predictivo** basado en histórico
- [ ] **Internacionalización** para múltiples idiomas

---

## 📄 **Versión y Changelog**

### **Versión Actual: v3.0.0**
- ✅ Sistema completo de gestión legislativa
- ✅ Validación automática con 8 criterios
- ✅ Generación de actas oficiales
- ✅ Plantillas especializadas por tipo de propuesta
- ✅ Integración completa con GitHub Issues/PR

### **Historial de Versiones**
- **v3.0.0** (Oct 2025): Sistema legislativo completo
- **v2.0.0** (2024): Proceso básico con GitHub Issues
- **v1.0.0** (2020): Proceso manual documentado

---

## 🏛️ **Sello Oficial**

**Sistema desarrollado por y para el Alto Congreso Tlatocan**  
**Unión Untravel - Constitución v3.0.0**

*"Transparencia, Eficiencia y Democracia Digital"*

---

### 📝 **Información del Documento**
- **Creado:** Octubre 2025
- **Última actualización:** $(date +"%d de %B de %Y")
- **Versión:** 3.0.0
- **Mantenido por:** Alto Congreso Tlatocan
- **Licencia:** Según términos de la Constitución de Untravel

---

### 🔗 **Enlaces Útiles**
- [📜 Constitución completa](../CONSTITUTION.md)
- [📚 Guía técnica completa](./GUIA_TECNICA_LEGISLATIVA.md)
- [📊 Historial de cambios](../CHANGELOG.md)
- [🔧 Herramientas de comparación](../versions/)
- [🏛️ Repositorio principal](https://github.com/UriAntonio/Constituci-n-Administrativa-de-Untravel)

---

*¿Tienes preguntas? Crea un Issue con la etiqueta `consulta-legislativa` o únete al canal #legislativo-soporte en Discord.*