# Guía de Contribución - Constitución de la Unión Untravel

**Versión:** 3.0.0 - Actualizada para la Tercera Revisión Constitucional  
**Última actualización:** 1 de octubre de 2025

¡Gracias por tu interés en contribuir a la Constitución de la Unión Untravel! Este documento es un contrato social vivo que puede mejorar con la participación de toda la comunidad según el **Artículo 35** de la Constitución vigente.

## 📋 Tabla de Contenidos

1. [Código de Conducta](#código-de-conducta)
2. [¿Cómo Puedo Contribuir?](#cómo-puedo-contribuir)
3. [Proceso de Reforma Constitucional](#proceso-de-reforma-constitucional)
4. [Guías de Estilo](#guías-de-estilo)
5. [Proceso de Revisión](#proceso-de-revisión)
6. [Comunidad y Comunicación](#comunidad-y-comunicación)

---

## Código de Conducta

Al participar en este proyecto, te comprometes a mantener un ambiente respetuoso y constructivo. Esperamos que todos los contribuyentes:

- 🤝 Sean respetuosos con diferentes puntos de vista
- 💬 Mantengan debates constructivos y fundamentados
- 🎯 Se enfoquen en lo que es mejor para la comunidad
- 🙏 Muestren empatía hacia otros miembros
- ⚖️ Acepten críticas constructivas con gracia
- 🚫 No usen lenguaje ofensivo o discriminatorio

Las violaciones al código de conducta pueden resultar en restricciones temporales o permanentes para contribuir.

---

## ¿Cómo Puedo Contribuir?

Hay varias formas de contribuir a nuestra Constitución:

### 🐛 Reportar Errores o Inconsistencias

Si encuentras errores tipográficos, inconsistencias lógicas o problemas técnicos:

1. **Busca primero**: Verifica que no exista un Issue similar
2. **Crea un Issue**: Usa la plantilla "Reporte de Error Constitucional"
3. **Sé específico**: Indica el artículo, la línea y describe el problema
4. **Sugiere solución**: Si es posible, propón cómo corregirlo

### 💡 Proponer Mejoras

Para sugerir mejoras sin cambiar la estructura fundamental:

1. **Crea un Issue**: Usa la plantilla "Propuesta de Mejora"
2. **Explica el contexto**: ¿Qué problema resuelve tu propuesta?
3. **Describe la solución**: ¿Cómo mejoraría la Constitución?
4. **Considera el impacto**: ¿A quiénes afecta y cómo?

### 🏛️ Proponer Reformas Constitucionales

Para cambios significativos a la estructura o principios según el **Artículo 35** de la Constitución:

1. **Revisa los requisitos**: Cualquier miembro de la comunidad puede proponer reformas
2. **Crea un Issue**: Usa la plantilla "Propuesta de Reforma Constitucional"
3. **Debate público**: Participa activamente en la discusión (mínimo 3 días según **Artículo 16**)
4. **Crea un Pull Request**: Una vez haya consenso preliminar
5. **Proceso legislativo**: Sigue el procedimiento oficial del **Artículo 35** y **Artículo 16**

### 📚 Mejorar Documentación

También puedes contribuir mejorando:

- README.md (claridad, instrucciones, enlaces)
- Este archivo CONTRIBUTING.md
- Plantillas de Issues y Pull Requests
- Documentación del proceso de reforma

---

## Proceso de Reforma Constitucional

El proceso formal para reformar la Constitución sigue el **Artículo 35** y **Artículo 16** de la Constitución vigente:

### Fase 1: Iniciativa (Artículo 35)

**Requisitos previos según la Constitución actual:**
- **Cualquier miembro de la comunidad** puede proponer reformas a la Constitución
- Las reformas deben ser presentadas **por escrito al Alto Congreso Tlatocan**
- No hay restricciones de antigüedad o apoyo previo (más democrático que versiones anteriores)

**Acciones:**
1. Crea un **Issue** con etiqueta `reforma-constitucional`
2. Usa la plantilla de reforma constitucional
3. Incluye:
   - **Título claro**: Ej. "Reforma: Ampliar mandato del Huey Tlatoani"
   - **Títulos/Artículos afectados**: Lista de disposiciones a modificar (ej: "Artículo 12: Elección y Mandato")
   - **Texto propuesto**: Redacción exacta de los cambios
   - **Justificación**: Por qué es necesaria esta reforma
   - **Impacto**: A quién y cómo afecta
   - **Tipo de cambio**: ¿Es MAJOR, MINOR o PATCH según versionado semántico?

### Fase 2: Debate Público (Mínimo 3 días - Artículo 16)

**Discusión abierta según Artículo 16:**
- Todos los miembros pueden comentar en el Issue durante el **debate público**
- **Mínimo 3 días** para discusión comunitaria (según proceso legislativo)
- Se busca construir consenso y mejorar la propuesta
- El autor debe responder dudas y considerar sugerencias
- Pueden hacerse ajustes a la propuesta basados en feedback

**Indicadores de viabilidad:**
- ✅ Apoyo de la comunidad durante el debate
- ✅ Coherencia con los **Valores y Principios Rectores** (**Artículo 4**)
- ✅ Respeto a la **Supremacía Constitucional** (**Artículo 37**)
- ✅ No contradice principios fundamentales del **Título I**
- ✅ Factibilidad de implementación

### Fase 3: Formalización (Pull Request)

**Una vez completado el debate público:**

1. **Fork del repositorio** (si no tienes acceso directo)
2. **Crea una rama** descriptiva: `reforma/ampliar-mandato-huey-tlatoani`
3. **Realiza los cambios**:
   - Modifica `CONSTITUTION.md` con los cambios exactos en los artículos correspondientes
   - Actualiza `CHANGELOG.md` con la nueva versión y descripción detallada
   - Si hay cambios MAJOR, actualiza `versions/` con nueva versión histórica
   - Si es necesario, actualiza `README.md`
   - Incrementa la versión según versionado semántico
4. **Crea el Pull Request**:
   - Usa la plantilla de PR para reformas
   - Enlaza al Issue de discusión
   - Marca como "Draft" si aún hay debate activo

### Fase 4: Revisión Legislativa (Artículo 16)

**Comisión Especializada del Alto Congreso Tlatocan:**
- **Revisión técnica por comisión especializada** según el proceso legislativo
- Revisa compatibilidad con la Constitución existente
- Verifica que el texto sea claro y sin ambigüedades
- Evalúa el impacto en otros artículos del sistema de Títulos
- Puede solicitar cambios o aclaraciones

**Primera Lectura:**
- **Presentación en sesión plenaria** del Alto Congreso Tlatocan
- Discusión formal entre legisladores

**Recomendaciones:**
- ✅ Aprobar para votación
- ⚠️ Aprobar con modificaciones
- ❌ Rechazar con justificación fundamentada

### Fase 5: Votación (Artículos 15 y 35)

**Votación en el Alto Congreso Tlatocan (Artículo 16):**
- Sigue el **reglamento de votación** establecido en el **Artículo 15**
- **Quórum mínimo**: Mayoría simple de los miembros
- **Tiempo de intervención**: 3 minutos máximo por participación
- **Mayoría requerida**: 
  - **Mayoría simple** para leyes ordinarias
  - **2/3** para reformas constitucionales
- **Proceso**:
  - Los miembros presentan asistencia 15 minutos antes
  - El Secretario verifica quórum suficiente
  - Tiempo límite de 3 minutos para expresar postura en voto
  - El Secretario da constancia de votos (a favor, en contra, abstenciones)

**Aprobación Final (Artículo 35):**
- Requiere **mayoría absoluta** del Alto Congreso Tlatocan
- La **Suprema Corte** revisa la enmienda para asegurar constitucionalidad
- Si pasa, se procede a promulgación

### Fase 6: Promulgación (Artículo 35)

**Publicación oficial:**
- Las reformas aprobadas serán **publicadas en la Gaceta Oficial de Untravel** (según **Artículo 29**)
- Los miembros de la comunidad serán **notificados** de cualquier reforma
- **El Vocero del Alto Congreso** es responsable de la publicación oficial

**Entrada en vigor:**
- Las reformas **entran en vigor inmediatamente después de su publicación**
- Las reformas **no afectarán los derechos adquiridos** por los miembros

**Acciones técnicas finales:**
1. El Pull Request es aprobado y mergeado en GitHub
2. Se crea un **Release** con la nueva versión (si es MAJOR, se archiva en `/versions`)
3. Se actualiza el sistema de versiones históricas si aplica
4. Se publica anuncio oficial en canales comunitarios

---

## Guías de Estilo

Para mantener la consistencia y profesionalismo del documento:

### Estilo de Redacción

- ✅ **Lenguaje formal pero accesible**: Evita jerga innecesaria
- ✅ **Oraciones claras y concisas**: Preferir frases cortas
- ✅ **Voz activa**: "El Legislativo aprueba" en vez de "Es aprobado por el Legislativo"
- ✅ **Género inclusivo**: Usar construcciones neutras cuando sea posible
- ✅ **Términos consistentes**: Mantener el mismo vocabulario a lo largo del texto

### Estructura Constitucional v3.0.0

La Constitución actual usa un **sistema de Títulos y Capítulos** organizado jerárquicamente:

```markdown
## TÍTULO X: NOMBRE DEL TÍTULO

### Capítulo Y: Nombre del Capítulo (si aplica)

### Artículo Z: Título Descriptivo
Texto principal del artículo que establece la norma o principio.

**Categoría específica:**
- Primer punto específico
- Segundo punto específico  
- Tercer punto específico
```

**Ejemplo de la estructura actual:**
```markdown
## TÍTULO III: ORGANIZACIÓN DEL PODER PÚBLICO

### Capítulo I: Poder Ejecutivo - Huey Tlatoani

### Artículo 8: Naturaleza y Objetivos
El Poder Ejecutivo, encabezado por el Huey Tlatoani...
```

### Formato Markdown

- Usa `###` para títulos de artículos
- Usa `####` para subdivisiones de artículos
- Usa listas numeradas para secuencias o requisitos
- Usa listas con viñetas para enumeraciones sin orden
- Usa **negritas** para términos clave o énfasis
- Usa `código` para referencias técnicas (ej: versiones)

### Versionado Semántico

Al actualizar CHANGELOG.md, sigue este formato:

```markdown
## [X.Y.Z] - AAAA-MM-DD

### Añadido
- Nuevos elementos introducidos

### Modificado
- Artículo X: Descripción del cambio (PR #123)

### Justificación
- Razón del cambio

### Votación
- Legislativo: XX votos a favor, YY en contra
- Comunidad: XX% participación, YY% a favor
```

---

## Proceso de Revisión

### Para Revisores

Si eres parte del Legislativo o Comisión Constitucional:

**Checklist de revisión:**
- [ ] ¿El cambio es coherente con los principios fundamentales?
- [ ] ¿El texto es claro y sin ambigüedades?
- [ ] ¿Se respeta el formato y estilo establecido?
- [ ] ¿Se actualizó correctamente el CHANGELOG?
- [ ] ¿El versionado semántico es apropiado?
- [ ] ¿Se consideró el impacto en otros artículos?
- [ ] ¿Hay suficiente apoyo de la comunidad?
- [ ] ¿No contradice artículos irreformables?

**Tipos de feedback:**
- 💬 **Comentarios generales**: Observaciones no bloqueantes
- ⚠️ **Cambios solicitados**: Modificaciones necesarias antes de aprobar
- ✅ **Aprobación**: El cambio está listo para votación
- ❌ **Rechazo**: Razones fundamentadas por las que no debe proceder

### Para Autores

Al recibir feedback:

- 📝 Responde a todos los comentarios
- 🔄 Realiza los cambios solicitados
- 💭 Explica decisiones cuando no implementes una sugerencia
- ✨ Agradece el tiempo y esfuerzo de los revisores
- 🔔 Notifica cuando hayas actualizado el PR

---

## Comunidad y Comunicación

### Canales de Comunicación

- **GitHub Issues**: Para propuestas, debates y seguimiento oficial
- **Pull Requests**: Para revisión técnica de cambios
- **Discord/Servidor**: Para discusiones informales y coordinación
- **Reuniones Legislativas**: Para votaciones y decisiones formales

### Etiquetas de Issues

- `reforma-constitucional`: Propuestas de reforma formal
- `mejora`: Sugerencias de mejora no estructural
- `error`: Errores tipográficos o técnicos
- `debate`: Temas en discusión sin propuesta concreta
- `documentación`: Mejoras a documentación auxiliar
- `proceso`: Sobre el proceso de reforma en sí

### Mejores Prácticas

1. **Sé paciente**: Los procesos democráticos toman tiempo
2. **Documenta todo**: La transparencia es fundamental
3. **Acepta el resultado**: Respeta las decisiones mayoritarias
4. **Aprende y mejora**: Usa feedback para futuras propuestas
5. **Colabora**: Busca construir consenso, no imponer ideas

---

## Preguntas Frecuentes

**¿Puedo proponer una reforma si soy nuevo en la comunidad?**
Sí, según el **Artículo 35** cualquier miembro de la comunidad puede proponer reformas constitucionales sin restricciones de antigüedad o apoyo previo. Solo debe presentar la propuesta por escrito al Alto Congreso Tlatocan.

**¿Cuánto tiempo toma el proceso completo?**
Típicamente 2-4 semanas desde la propuesta inicial hasta la promulgación, dependiendo de la complejidad y consenso.

**¿Qué pasa si mi reforma es rechazada?**
Puedes revisar el feedback, mejorar la propuesta y reintentarlo después de un tiempo prudencial (recomendado: 1 mes).

**¿Puedo retirar mi propuesta?**
Sí, en cualquier momento antes de la votación final puedes cerrar el Issue/PR si decides que no debe proceder.

**¿Necesito saber Git para contribuir?**
No necesariamente. Para propuestas simples, puedes crear Issues sin usar Git. Para cambios técnicos, miembros con experiencia pueden ayudarte.

**¿Cómo funciona el sistema de versiones?**
Utilizamos **versionado semántico** (MAJOR.MINOR.PATCH):
- **MAJOR** (ej: v3.0.0): Cambios estructurales profundos, nueva organización constitucional
- **MINOR** (ej: v3.1.0): Nuevos artículos, títulos o modificaciones importantes
- **PATCH** (ej: v3.0.1): Correcciones menores, clarificaciones de redacción

**¿Dónde puedo ver versiones anteriores?**
En la carpeta `/versions/` se archivan todas las versiones MAJOR. Cada archivo histórico incluye la fecha de vigencia y está marcado como "ARCHIVO HISTÓRICO" para evitar confusiones.

---

## Sistema de Versiones

### Archivo Histórico

Todas las versiones MAJOR de la Constitución se archivan en la carpeta `/versions/`:
- `v1.0.0-CONSTITUTION.txt` - **Constitución original** (2020, documento histórico auténtico)
- `v2.0.0-CONSTITUTION.md` - Primera versión estructurada en Markdown
- `v3.0.0-CONSTITUTION.md` - **Versión actual** con sistema de Títulos y Capítulos

### Herramienta de Comparación

Utiliza `compare-versions.sh` para analizar diferencias:
```bash
# Ver todas las versiones disponibles
./versions/compare-versions.sh list

# Comparar dos versiones específicas
./versions/compare-versions.sh compare v2.0.0 v3.0.0

# Ver estadísticas de una versión
./versions/compare-versions.sh stats v3.0.0
```

---

## Recursos Adicionales

- [Constitución completa](./CONSTITUTION.md) - **Versión vigente v3.0.0**
- [Archivo de versiones](./versions/) - **Historial completo de versiones MAJOR**
- [Historial de cambios](./CHANGELOG.md) - **Documentación detallada de todas las modificaciones**
- [Guía de Markdown](https://guides.github.com/features/mastering-markdown/)
- [Versionado Semántico](https://semver.org/lang/es/)
- [Guía de GitHub Flow](https://guides.github.com/introduction/flow/)

---

## Agradecimientos

Gracias a todos los miembros de la Unión Untravel que contribuyen a mantener y mejorar nuestro marco constitucional. Cada contribución, grande o pequeña, fortalece nuestra comunidad democrática.

**¡Tu voz importa! ¡Tu participación hace la diferencia!**

---

*Última actualización: Enero 2025 - Versión 3.0.0*
*¿Preguntas? Abre un Issue con la etiqueta `pregunta`*
