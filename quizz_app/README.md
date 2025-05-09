# 🎮 Pokémon Quiz App - Aplicación de Preguntas y Respuestas

Una aplicación de cuestionario interactivo sobre Pokémon con sistema de puntuación y pantalla de resultados.

## Características Principales

- **Flujo completo del cuestionario**:
  - Pantalla de inicio con temática Pokémon
  - Secuencia de preguntas con respuestas mezcladas
  - Pantalla de resultados que muestra respuestas correctas vs seleccionadas

- **Contenido del cuestionario**:
  - 5 preguntas desafiantes sobre Pokémon
  - Sistema de respuestas múltiples
  - Aleatorización del orden de las respuestas

- **Experiencia de usuario**:
  - Diseño con temática Pokémon (colores, imágenes)
  - Transiciones entre pantallas fluidas
  - Feedback inmediato al seleccionar respuestas

## Componentes Técnicos

- **Estructura de la aplicación**:
  - Gestión de estado con StatefulWidget
  - Navegación entre 3 pantallas:
    - Inicio (HomeQuizz)
    - Preguntas (QuizzBody)
    - Resultados (ResultsScreen)

- **Lógica del cuestionario**:
  - Lista de preguntas con clase Question personalizada
  - Método shuffleAnswers() para aleatorizar opciones
  - Sistema de seguimiento de respuestas seleccionadas

- **Diseño UI**:
  - Tema personalizado con colores azules (similares a Pokéball)
  - Widgets personalizados para preguntas y respuestas
  - Diseño responsive centrado

## Cómo Funciona

1. **Pantalla de Inicio**:
   - Muestra imagen de Pokéball
   - Botón "Iniciar Quizz" comienza el cuestionario

2. **Pantalla de Preguntas**:
   - Muestra una pregunta a la vez
   - Opciones de respuesta en botones clickeables
   - Avance automático a la siguiente pregunta

3. **Pantalla de Resultados**:
   - Muestra pregunta, respuesta correcta y selección del usuario
   - Opción para volver al inicio

## Personalización

Fácilmente adaptable para:
- Añadir más preguntas (editar listQuestions)
- Cambiar temática (colores, imágenes)
- Modificar la pantalla de resultados
- Implementar sistema de puntuación

## Requisitos

- Flutter SDK instalado
- Dependencias:
  - google_fonts (opcional, si se desea añadir tipografía especial)
- Assets:
  - Imagen de Pokéball en assets/images/