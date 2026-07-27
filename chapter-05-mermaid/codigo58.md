graph TD
    A([Inicio]) --> B[Inicializar suma = 0, contador = 1]
    B --> C{¿contador <= 5?}
    C -- Sí --> D[Ingresar nota]
    D --> E[suma = suma + nota]
    E --> F[contador = contador + 1]
    F --> C
    C -- No --> G[Calcular promedio = suma / 5]
    G --> H[Mostrar promedio]
    H --> I([Fin])