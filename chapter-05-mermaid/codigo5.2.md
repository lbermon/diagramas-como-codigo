graph TD
    A([Inicio]) --> B[Buscar producto]
    B --> C{¿Producto disponible?}
    C -- Sí --> D[Realizar pago]
    C -- No --> E[Informar sin stock]
    D --> F[Confirmar compra]
    F --> G([Fin])
    E --> G([Fin])