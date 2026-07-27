graph TD
    A([Inicio]) --> B[Ingresar nota]
    B --> C{¿Nota >= 4.5?}
    C -- Sí --> D[Imprimir Excelente]
    C -- No --> E{¿Nota >= 4.0?}
    E -- Sí --> F[Imprimir Notable]
    E -- No --> G{¿Nota >= 3.0?}
    G -- Sí --> H[Imprimir Aprobado]
    G -- No --> I{¿Nota >= 2.0?}
    I -- Sí --> J[Imprimir Recuperación]
    I -- No --> K[Imprimir Reprobado]
    D --> L([Fin])
    F --> L
    H --> L
    J --> L
    K --> L