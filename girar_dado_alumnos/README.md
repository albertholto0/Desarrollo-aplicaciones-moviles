# Ruleta 603 - Selección Aleatoria de Compañeros

Una aplicación interactiva que selecciona aleatoriamente un compañero del grupo 603 de Informática mediante una animación visual.

## Características Principales

- Animación estilo "ruleta" que muestra fotos de compañeros en rápida sucesión
- Selección final aleatoria entre 7 opciones (compañero1.jpeg a compañero7.jpeg)
- Diseño atractivo con:
  - Gradiente radial naranja/blanco
  - Tipografía personalizada con Google Fonts (Nunito)
  - Marco con sombra para la foto seleccionada
- Interfaz intuitiva con botón de acción

## Cómo Funciona

1. Al presionar "Escoger al azar":
   - Se inicia una animación que muestra fotos en secuencia rápida (80ms por imagen)
   - Tras completar la secuencia, selecciona una foto final aleatoriamente
   - La animación previene activaciones múltiples simultáneas

## Tecnologías Utilizadas

- Flutter SDK
- Paquete google_fonts para tipografía personalizada
- Widgets avanzados:
  - Container con decoración compleja (border, shadow, borderRadius)
  - StatefulWidget para manejo de estado
  - Animación asíncrona con Future.delayed

## Personalización

Fácilmente adaptable para:
- Cambiar las imágenes (actualizar assets/companeros/)
- Modificar la velocidad de animación (ajustar milliseconds)
- Editar el diseño (colores, fuentes, efectos)
- Añadir más participantes

## Requisitos

- Flutter SDK instalado
- Assets de imágenes en la carpeta especificada
- Dependencia google_fonts en pubspec.yaml
