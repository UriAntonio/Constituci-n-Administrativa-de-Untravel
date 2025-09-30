# Guía de Contribución - Constitución Administrativa de Untravel

¡Gracias por tu interés en contribuir a la Constitución de la Unión Untravel! Este documento es un contrato social vivo que puede mejorar con la participación de toda la comunidad.

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

Para cambios significativos a la estructura o principios:

1. **Revisa los requisitos**: Asegúrate de cumplir los criterios del Artículo 19
2. **Crea un Issue**: Usa la plantilla "Propuesta de Reforma Constitucional"
3. **Debate público**: Participa activamente en la discusión (mínimo 7 días)
4. **Crea un Pull Request**: Una vez haya consenso preliminar
5. **Proceso legislativo**: Sigue el procedimiento oficial del Artículo 20

### 📚 Mejorar Documentación

También puedes contribuir mejorando:

- README.md (claridad, instrucciones, enlaces)
- Este archivo CONTRIBUTING.md
- Plantillas de Issues y Pull Requests
- Documentación del proceso de reforma

---

## Proceso de Reforma Constitucional

El proceso formal para reformar la Constitución sigue estos pasos:

### Fase 1: Iniciativa (Semana 1)

**Requisitos previos:**
- Ser miembro activo de la comunidad
- Cumplir uno de los criterios del Artículo 19:
  - 1/3 del Legislativo
  - Poder Ejecutivo
  - 20% de firmas de la comunidad activa
  - Recomendación del Tribunal Supremo

**Acciones:**
1. Crea un **Issue** con etiqueta `reforma-constitucional`
2. Usa la plantilla de reforma constitucional
3. Incluye:
   - **Título claro**: Ej. "Reforma: Ampliar mandato presidencial a 4 meses"
   - **Artículos afectados**: Lista de artículos a modificar
   - **Texto propuesto**: Redacción exacta de los cambios
   - **Justificación**: Por qué es necesaria esta reforma
   - **Impacto**: A quién y cómo afecta
   - **Versionado**: ¿Es MAJOR, MINOR o PATCH?

### Fase 2: Debate Público (7-14 días)

**Discusión abierta:**
- Todos los miembros pueden comentar en el Issue
- Se busca construir consenso y mejorar la propuesta
- El autor debe responder dudas y considerar sugerencias
- Pueden hacerse ajustes a la propuesta basados en feedback

**Indicadores de viabilidad:**
- ✅ Apoyo significativo de la comunidad
- ✅ Coherencia con principios fundamentales
- ✅ Factibilidad de implementación
- ✅ No contradice artículos irreformables (Art. 21)

### Fase 3: Formalización (Pull Request)

**Una vez haya suficiente apoyo:**

1. **Fork del repositorio** (si no tienes acceso directo)
2. **Crea una rama** descriptiva: `reforma/ampliar-mandato-presidencial`
3. **Realiza los cambios**:
   - Modifica CONSTITUTION.md con los cambios exactos
   - Actualiza CHANGELOG.md con la nueva versión y descripción
   - Si es necesario, actualiza README.md
   - Incrementa la versión según versionado semántico
4. **Crea el Pull Request**:
   - Usa la plantilla de PR para reformas
   - Enlaza al Issue de discusión
   - Marca como "Draft" si aún hay debate activo

### Fase 4: Revisión Legislativa

**Comisión Constitucional:**
- Revisa compatibilidad con la Constitución existente
- Verifica que el texto sea claro y sin ambigüedades
- Evalúa el impacto en otros artículos
- Puede solicitar cambios o aclaraciones

**Recomendaciones:**
- ✅ Aprobar para votación
- ⚠️ Aprobar con modificaciones
- ❌ Rechazar con justificación

### Fase 5: Votación

**Primera Votación Legislativa:**
- Requiere 2/3 de votos a favor del Legislativo
- Si no pasa, vuelve a debate o se archiva
- Si pasa, continúa el proceso

**Consulta Comunitaria (opcional pero recomendada):**
- Para reformas MAJOR o que afecten derechos fundamentales
- Votación abierta a toda la comunidad activa
- Período de votación: 3-5 días
- Vinculante si más del 50% de la comunidad vota

**Segunda Votación Legislativa:**
- Mínimo 3 días después de primera votación
- Ratificación final por 2/3 del Legislativo
- Si pasa, se procede a promulgación

### Fase 6: Promulgación

**Acciones finales:**
1. El Pull Request es aprobado y mergeado
2. Se crea un **Release** en GitHub con la nueva versión
3. Se publica anuncio oficial en canales comunitarios
4. La reforma entra en vigor según lo establecido en ella

---

## Guías de Estilo

Para mantener la consistencia y profesionalismo del documento:

### Estilo de Redacción

- ✅ **Lenguaje formal pero accesible**: Evita jerga innecesaria
- ✅ **Oraciones claras y concisas**: Preferir frases cortas
- ✅ **Voz activa**: "El Legislativo aprueba" en vez de "Es aprobado por el Legislativo"
- ✅ **Género inclusivo**: Usar construcciones neutras cuando sea posible
- ✅ **Términos consistentes**: Mantener el mismo vocabulario a lo largo del texto

### Estructura de Artículos

```markdown
### Artículo X: Título Descriptivo
Texto principal del artículo que establece la norma o principio.

Si es necesario detallar:
1. Primer punto específico
2. Segundo punto específico
3. Tercer punto específico
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
Sí, aunque para que sea formalmente considerada necesitas cumplir los requisitos del Artículo 19 (como tener apoyo del 20% de la comunidad).

**¿Cuánto tiempo toma el proceso completo?**
Típicamente 2-4 semanas desde la propuesta inicial hasta la promulgación, dependiendo de la complejidad y consenso.

**¿Qué pasa si mi reforma es rechazada?**
Puedes revisar el feedback, mejorar la propuesta y reintentarlo después de un tiempo prudencial (recomendado: 1 mes).

**¿Puedo retirar mi propuesta?**
Sí, en cualquier momento antes de la votación final puedes cerrar el Issue/PR si decides que no debe proceder.

**¿Necesito saber Git para contribuir?**
No necesariamente. Para propuestas simples, puedes crear Issues sin usar Git. Para cambios técnicos, miembros con experiencia pueden ayudarte.

---

## Recursos Adicionales

- [Constitución completa](./CONSTITUTION.md)
- [Historial de cambios](./CHANGELOG.md)
- [Guía de Markdown](https://guides.github.com/features/mastering-markdown/)
- [Versionado Semántico](https://semver.org/lang/es/)
- [Guía de GitHub Flow](https://guides.github.com/introduction/flow/)

---

## Agradecimientos

Gracias a todos los miembros de la Unión Untravel que contribuyen a mantener y mejorar nuestro marco constitucional. Cada contribución, grande o pequeña, fortalece nuestra comunidad democrática.

**¡Tu voz importa! ¡Tu participación hace la diferencia!**

---

*Última actualización: 2024*
*¿Preguntas? Abre un Issue con la etiqueta `pregunta`*
