# 🏛️ Sistema Legislativo GitHub Actions

> **Reemplazo completo de scripts .sh con automatización GitHub Actions**

## 🚀 Visión General

El Alto Congreso Tlatocan opera mediante un **sistema 100% automatizado** basado en **GitHub Actions**, eliminando por completo la dependencia de scripts shell locales. Este sistema ofrece:

- ✅ **Validación automática** de propuestas legislativas
- 🗳️ **Detección inteligente** de votos en comentarios
- 📋 **Generación automática** de actas oficiales
- 🏛️ **Soporte legislativo** con análisis de tendencias
- 🔐 **Certificación criptográfica** automática
- 📊 **Transparencia total** con historial inmutable

## 📊 Arquitectura del Sistema

### 🔄 Workflows Principales

| Workflow | Propósito | Trigger | Reemplaza |
|----------|-----------|---------|-----------|
| `legislativo-automation.yml` | Procesamiento automático de propuestas | Issue abierto con labels legislativos | Validación manual |
| `legislative-tools-replacement.yml` | Herramientas específicas (validar/generar actas) | Dispatch manual o automático | `validate-proposal.sh`<br>`generate-acta.sh` |
| `auto-voting-detection.yml` | Detección automática de votos | Comentario con voto | Conteo manual |
| `version-management.yml` | Gestión dinámica de versiones | Push a main | Versionado manual |

### 🏷️ Tipos de Propuesta Soportados

#### 1. 🏛️ **[LEGISLATIVO]** - Alto Congreso Tlatocan
- **Proponente:** Miembros del Alto Congreso exclusivamente
- **Proceso:** Acelerado (3 días mínimo)
- **Template:** `propuesta-legislativa.yml`
- **Mayoría:** Simple o 2/3 según tipo de reforma

#### 2. 🤝 **[RESPALDADA]** - Propuesta Ciudadana con Respaldo
- **Proponente:** Cualquier ciudadano con respaldo legislativo
- **Proceso:** Semi-acelerado (5-7 días)  
- **Template:** `propuesta-respaldada.yml`
- **Validación:** Requiere confirmación del legislador respaldante

#### 3. 🚨 **[URGENTE]** - Reforma de Emergencia
- **Proponente:** Alto Congreso en situaciones críticas
- **Proceso:** Inmediato (24-48 horas)
- **Template:** `reforma-urgente.yml`
- **Mayoría:** 2/3 obligatorio

#### 4. 📝 **[ESTÁNDAR]** - Propuesta General
- **Proponente:** Cualquier ciudadano
- **Proceso:** Estándar (14 días mínimo)
- **Template:** Formulario GitHub básico
- **Validación:** Proceso completo de revisión

## 🛠️ Herramientas Disponibles

### 🔍 Validador de Propuestas
**Comando:** `workflow_dispatch` → `validate-proposal`

```yaml
inputs:
  action: validate-proposal
  issue_number: "123"
  additional_params: "opciones-extra"
```

**Funciones:**
- ✅ Validación estructural completa (8 criterios)
- 📊 Análisis estadístico detallado  
- 🏛️ Verificación constitucional
- 📝 Reporte automático con recomendaciones
- 🔐 Hash de verificación criptográfica

**Criterios de Validación:**
1. **Formato del título** - `[TIPO] Descripción`
2. **Etiquetas requeridas** - Labels legislativos apropiados
3. **Estructura del contenido** - Secciones Propuesta/Justificación/Análisis
4. **Tipo de versionado** - MAJOR/MINOR/PATCH especificado
5. **Justificación constitucional** - Referencias a artículos
6. **Checklist de validación** - Items de pre-validación completados
7. **Autorización legislativa** - Validación del proponente
8. **Coherencia constitucional** - Alineación con Artículo 4

### 📋 Generador de Actas
**Comando:** `workflow_dispatch` → `generate-acta`

```yaml
inputs:
  action: generate-acta
  issue_number: "123"
  additional_params: "auto-generated-after-voting"
```

**Funciones:**
- 🗳️ Conteo automático de votos en comentarios
- 📊 Estadísticas detalladas (favor/contra/abstenciones)
- ⚖️ Cálculo de mayorías (simple/2/3 según tipo)
- 📄 Creación de Issue oficial de acta
- 🔐 Certificación con timestamp y hash
- 📤 Notificaciones automáticas de resultado

**Formato de Votos Reconocidos:**
- ✅ **A favor:** `✅`, `apruebo`, `a favor`, `voto oficial: ✅`
- ❌ **En contra:** `❌`, `rechazo`, `en contra`, `voto oficial: ❌`  
- 🟡 **Abstención:** `🟡`, `abstención`, `abstengo`, `voto oficial: 🟡`

### 🏛️ Soporte Legislativo
**Comando:** `workflow_dispatch` → `legislative-support`

```yaml
inputs:
  action: legislative-support
  issue_number: "123"
  additional_params: "analisis-completo"
```

**Funciones:**
- 📊 Análisis de tendencias legislativas
- 📚 Búsqueda de precedentes relacionados
- 🔍 Recomendaciones automáticas
- 📋 Enlaces a recursos legislativos
- 📈 Estadísticas del repositorio

## 🔄 Flujos de Trabajo Automáticos

### 📥 Nueva Propuesta Legislativa

1. **Detección automática** al crear Issue con labels legislativos
2. **Validación inicial** con `legislativo-automation.yml`  
3. **Procesamiento avanzado** con `legislative-tools-replacement.yml`
4. **Comentario de confirmación** con estado y próximos pasos

### 🗳️ Proceso de Votación

1. **Detección automática** de votos en comentarios via `auto-voting-detection.yml`
2. **Confirmación inmediata** del voto registrado con estadísticas actuales
3. **Generación automática de acta** al alcanzar umbral (5+ votos)
4. **Notificación del resultado** con certificación oficial

### 📋 Generación de Actas

1. **Activación automática** o manual via workflow dispatch
2. **Recopilación completa** de votos desde comentarios
3. **Cálculo de mayorías** según tipo de propuesta (simple/2/3)
4. **Creación de Issue oficial** con acta completa
5. **Certificación criptográfica** con hash de verificación

## 🔧 Ventajas del Sistema GitHub Actions

### ✅ **Versus Scripts Shell (.sh)**

| Aspecto | Scripts .sh | GitHub Actions |
|---------|-------------|----------------|
| **Dependencias** | `gh`, `jq`, `bash`, `git` | ✅ Ninguna (nativo) |
| **Ejecución** | Local o CI/CD externo | ✅ Nativo GitHub |
| **Logs** | Archivos locales | ✅ Persistentes e inmutables |
| **Integración** | API calls manuales | ✅ GitHub API nativa |
| **Escalabilidad** | Configuración manual | ✅ Automática |
| **Auditabilidad** | Logs locales | ✅ Historial público |
| **Certificación** | Hash manual | ✅ Automática |
| **Mantenimiento** | Scripts personalizados | ✅ GitHub mantiene infraestructura |

### 🚀 **Beneficios Técnicos**

- **🔐 Seguridad:** Ejecución en runners seguros de GitHub
- **📊 Transparencia:** Logs públicos en pestaña Actions  
- **⚡ Performance:** Ejecución paralela y optimizada
- **🔄 Confiabilidad:** Infrastructure-as-Code mantenida por GitHub
- **📈 Escalabilidad:** Se ajusta automáticamente a la carga
- **🛠️ Mantenibilidad:** Código YAML estándar vs scripts personalizados

## 📚 Guías de Uso

### Para Legisladores

#### 🏛️ Crear Propuesta Legislativa
1. Ir a **Issues** → **New Issue**
2. Seleccionar **"Propuesta Legislativa (Alto Congreso)"**
3. Completar formulario estructurado
4. El sistema validará automáticamente

#### 🗳️ Votar en Propuesta
1. Comentar en el Issue con formato:
   ```
   ## Voto Oficial
   ✅ Apruebo esta propuesta
   
   **Justificación:** [razones del voto]
   ```
2. El sistema registrará automáticamente
3. Al alcanzar umbral, se genera acta automática

### Para Ciudadanos

#### 🤝 Propuesta con Respaldo Legislativo
1. Contactar miembro del Alto Congreso
2. Usar template **"Propuesta Respaldada"**
3. Incluir información del legislador respaldante
4. Sistema validará el respaldo automáticamente

#### 📝 Propuesta Estándar
1. Crear Issue normal con etiquetas apropiadas
2. Seguir estructura recomendada (Propuesta/Justificación/Análisis)
3. Sistema proporcionará feedback automático

## 🔍 Monitoreo y Observabilidad

### 📊 Dashboards Disponibles
- **Actions Tab:** Historial completo de ejecuciones
- **Issues:** Estados de propuestas legislativas  
- **Pull Requests:** Implementaciones aprobadas
- **Insights:** Estadísticas de actividad legislativa

### 🔔 Notificaciones
- **GitHub Notifications:** Automáticas para participantes
- **Comments:** Actualizaciones en tiempo real
- **Labels:** Cambios de estado visibles
- **Milestones:** Progreso de reformas importantes

## 🏗️ Arquitectura Técnica

### 🌐 Integración de Sistemas

```
┌─────────────────────────────────────────┐
│           GitHub Issues                 │
│  (Interface de Propuestas Legislativas) │
└─────────────┬───────────────────────────┘
              │
              ▼
┌─────────────────────────────────────────┐
│         GitHub Actions                  │
│     (Motor de Procesamiento)            │
├─────────────────────────────────────────┤
│ • legislativo-automation.yml            │
│ • legislative-tools-replacement.yml     │  
│ • auto-voting-detection.yml             │
│ • version-management.yml                │
└─────────────┬───────────────────────────┘
              │
              ▼
┌─────────────────────────────────────────┐
│       Outputs Automatizados             │
├─────────────────────────────────────────┤
│ • Comentarios de validación             │
│ • Issues de actas oficiales             │
│ • Artifacts de reportes                 │
│ • Logs inmutables                       │
│ • Certificaciones criptográficas        │
└─────────────────────────────────────────┘
```

### 🔐 Modelo de Seguridad

- **Autenticación:** GitHub native (GITHUB_TOKEN)
- **Autorización:** Repository permissions + CODEOWNERS
- **Auditabilidad:** Logs inmutables en Actions
- **Integridad:** Hash SHA-256 automáticos  
- **Transparencia:** Todo el proceso es público

## 🎯 Próximos Desarrollos

### 📋 Backlog Técnico
- [ ] **Dashboard legislativo** con métricas avanzadas
- [ ] **Webhooks** para integración con sistemas externos  
- [ ] **API REST** para acceso programático
- [ ] **Notifications** personalizadas por tipo de usuario
- [ ] **Templates** adicionales para casos especiales

### 🔮 Visión Futura
- **🤖 IA Integration:** Análisis automático de coherencia constitucional
- **📊 Analytics:** Predicciones de éxito de propuestas
- **🌐 Multi-repo:** Federación con otros sistemas legislativos
- **📱 Mobile:** Aplicación nativa para legisladores

## 🏛️ Conclusión

El **Sistema Legislativo GitHub Actions** representa la **evolución completa** del proceso legislativo digital, eliminando dependencias externas y proporcionando un marco **100% automatizado, transparente y auditable** para el Alto Congreso Tlatocan.

### ✅ **Logros Clave:**
- **🚫 Scripts .sh eliminados** completamente
- **⚡ Automatización total** del proceso legislativo  
- **🔐 Certificación criptográfica** automática
- **📊 Transparencia máxima** con logs públicos
- **🛠️ Mantenimiento cero** de infraestructura

---

**🏛️ Alto Congreso Tlatocan - Unión Untravel**  
*Sistema GitHub Actions - Transparencia, Democracia y Justicia Digital*  

📋 **Documentación técnica completa**  
⚡ **Sin dependencias de scripts externos**  
🎉 **100% automatizado con GitHub Actions**