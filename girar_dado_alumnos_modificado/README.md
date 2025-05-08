# Ruleta 603 - Selección de Ganador Aleatorio

Aplicación interactiva que selecciona un ganador aleatorio entre compañeros de clase con animación visual y muestra su nombre.

## Características Principales

- **Sistema de selección mejorado**:
  - Muestra tanto la foto como el nombre del ganador
  - Asignación de nombres mediante diccionario (índice → nombre)
  - Efecto visual especial en el nombre del ganador (sombra naranja)

- **Animación mejorada**:
  - Efecto "ruleta" con transición entre fotos (80ms por imagen)
  - Prevención de múltiples activaciones simultáneas
  - 17 pasos de animación para mayor dinamismo

- **Interfaz profesional**:
  - Diseño con gradiente radial blanco-naranja
  - Tipografía Nunito en todos los textos
  - Marco decorativo con sombra para la foto
  - Sección destacada para mostrar el ganador

## Funcionamiento

1. Al presionar "Escoger al azar":
   - Activa secuencia animada mostrando fotos rápidamente
   - Selecciona aleatoriamente un índice del 1 al 7
   - Muestra la foto correspondiente y el nombre asociado
   - Destaca el nombre con efecto visual

2. Datos de participantes:
   - 7 compañeros mapeados (Albert, Amelia, Diana, Sergio, Edén, Eltón, Kevin)
   - Sistema adaptable para añadir más participantes

## Tecnologías Utilizadas

- Flutter SDK
- Paquete google_fonts para tipografía Nunito
- Gestión de estado con StatefulWidget
- Animaciones asíncronas con Future.delayed
- Widgets personalizados:
  - Container con bordes, sombras y borderRadius
  - Row para mostrar etiqueta y nombre del ganador
  - Efectos de texto con sombra

## Personalización

Fácilmente configurable para:
- Cambiar lista de participantes (actualizar diccionario y assets)
- Modificar velocidad de animación (ajustar milliseconds)
- Editar paleta de colores y efectos visuales
- Añadir más campos de información por participante

## Requisitos

- Flutter SDK instalado
- Paquete google_fonts en pubspec.yaml
- Assets de imágenes en carpeta assets/companeros/
- Versión estable de Dart
