# Proyecto de Ejercicios en MASM

> [!NOTE]
> **Proyecto creado en 2023**  
> Serie de ejercicios básicos en **ensamblador MASM** utilizando la librería `Irvine32.inc`.

---

## Descripción general

Este proyecto reúne varios ejercicios prácticos de programación en ensamblador.  
Cada ejercicio está disponible desde un **menú principal** y se ejecuta de forma independiente.

---

## Contenido de los ejercicios

| Ejercicio | Descripción breve |
|-----------|------------------|
| 1 | Mostrar en pantalla **"Hola Mundo"** |
| 2 | Verificar si el usuario presiona **Enter** |
| 3 | Determinar si un número es **par** o **impar** |
| 4 | Realizar una **suma o resta** entre dos enteros |
| 5 | Calcular si la diferencia es **positiva o negativa** |
| 6 | Guardar y mostrar un número de **dos cifras** |
| 7 | Contar **vocales** en la palabra `"Hola"` |
| 8 | Convertir una hora `HH:MM:SS` a **segundos** |
| 9 | **Salir** del programa |

---

## Requisitos técnicos

- Tener instalado **MASM32**  
- Librería **Irvine32** disponible  
- Windows de 32 bits o entorno compatible

---

## Instrucciones de compilación

```bash
ml /c /coff programa.asm
link /subsystem:console programa.obj Irvine32.lib
```

Ejecutar el binario resultante desde consola.

---

## Objetivo del proyecto

Este proyecto busca servir como **introducción práctica** al lenguaje ensamblador:

- Uso de estructuras de control (`cmp`, `jmp`, `je`, `loop`)  
- Operaciones aritméticas y lógicas  
- Manipulación de cadenas y enteros  
- Comprensión del flujo de ejecución a bajo nivel

---

## Autor

**Josue Matamoros Fernández**  
Proyecto académico desarrollado en 2023.
