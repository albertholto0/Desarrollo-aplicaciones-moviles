# Sistema de Selección Aleatoria por Semestre

Aplicación para seleccionar aleatoriamente estudiantes de diferentes semestres académicos con animación visual.

## Características Principales

- **Selección por semestres**:
  - Soporte para 5 niveles académicos (2°, 4°, 6°, 8° y 10° semestre)
  - Cantidad variable de alumnos por semestre (desde 3 hasta 19)

- **Sistema de selección**:
  - Animación tipo "ruleta" que recorre las fotos de los alumnos
  - Selección final aleatoria con foto y nombre del ganador
  - Efecto visual destacado para el nombre del seleccionado

- **Navegación**:
  - Pantalla inicial con botones por semestre
  - Botón de regreso al inicio desde cualquier pantalla
  - Transiciones fluidas entre vistas

## Componentes Técnicos

- **Estructura de datos**:
  - Mapeo completo de alumnos por semestre (nombres y cantidades)
  - Sistema de archivos organizado por semestres (assets/images/semestreX/)
  - Gestión de estado para cambiar entre pantallas

- **Animación y lógica**:
  - Efecto de ruleta con velocidad configurable (80ms por imagen)
  - Prevención de múltiples activaciones simultáneas
  - Selección aleatoria basada en cantidad de alumnos por semestre

- **Interfaz de usuario**:
  - Diseño con temática académica (colores azules)
  - Marco decorativo para la foto del alumno
  - Tipografía clara y legible
  - Botones de acción destacados

## Flujo de la Aplicación

1. **Pantalla inicial**:
   - Muestra botones para cada semestre disponible
   - Al seleccionar semestre, carga la pantalla de selección

2. **Pantalla de selección**:
   - Botón "Seleccionar ganador" inicia la animación
   - Muestra foto y nombre del alumno seleccionado
   - Opción para regresar al inicio

## Personalización

Fácilmente adaptable para:
- Añadir más semestres o grupos
- Modificar la lista de alumnos
- Cambiar la velocidad de animación
- Personalizar el diseño visual
- Añadir más información por alumno

## Requisitos

- Flutter SDK instalado
- Estructura de archivos:
  - assets/images/semestreX/caraY.jpg (donde X es semestre, Y es número de alumno)
- Dependencias estándar de Flutter