graph TD
    A([Inicio]) --> B[Inicializar i = 1]
    B --> C{i <= 10}
    C -- Sí --> D[Imprimir i]
    D --> E[i = i + 1]
    E --> C
    C -- No --> F([Fin])