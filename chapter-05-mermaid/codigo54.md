graph TD
    A([Inicio]) --> B[Ingresar edad]
    B --> C{¿Edad >= 18?}
    C -- Sí --> D[Imprimir Mayor de edad]
    C -- No --> E[Imprimir Menor de edad]
    D --> F([Fin])
    E --> F([Fin])