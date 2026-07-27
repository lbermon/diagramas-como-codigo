graph TD
    A([Inicio]) --> B[Ingresar número]
    B --> C{Número > 0}
    C -- Sí --> D[Seguir solicitando número]
    C -- No --> E[Imprimir Fin del programa]
    D --> B
    E --> F([Fin])