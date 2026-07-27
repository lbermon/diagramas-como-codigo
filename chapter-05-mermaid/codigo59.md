graph TD
    A([Inicio]) --> B[Intentos = 0]
    B --> C{¿Intentos < 3?}
    C -- Sí --> D[Ingresar usuario y contraseña]
    D --> E{¿Datos correctos?}
    E -- Sí --> F[Mostrar Bienvenido]
    E -- No --> G[Intentos = Intentos + 1]
    G --> C
    C -- No --> H[Mostrar Acceso bloqueado]
    F --> I([Fin])
    H --> I([Fin])