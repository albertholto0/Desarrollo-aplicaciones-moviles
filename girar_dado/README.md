# Aplicación de Dado Animado en Flutter

Una aplicación simple que simula el lanzamiento de un dado con una animación visual antes de mostrar el resultado final.

## Características

- Animación realista del dado girando antes de detenerse
- Generación aleatoria de números del 1 al 6
- Interfaz intuitiva con un botón para lanzar el dado
- Diseño atractivo con gradiente radial de fondo

## Cómo funciona

1. Al presionar el botón "Girar dado":
   - Se inicia una secuencia animada que muestra diferentes caras del dado
   - Después de la animación, se selecciona aleatoriamente un número final
   - Se muestra la cara correspondiente al número obtenido

## Tecnologías utilizadas

- Flutter SDK
- Dart
- Widgets: StatefulWidget, Scaffold, Image.asset, ElevatedButton
- Animación asíncrona con Future.delayed

## Requisitos

- Flutter SDK instalado
- Dispositivo o emulador para ejecutar la aplicación

## Personalización

Puedes modificar:
- La secuencia de animación editando `listaDados`
- La duración de la animación cambiando `duracion`
- El diseño visual ajustando el `RadialGradient` y los estilos del botón
