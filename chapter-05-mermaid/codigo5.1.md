graph LR
    A[Inicio] --> B{¿Usuario autenticado?}
    B -->|Sí| C[Pantalla principal]
    B -->|No| D[Formulario de acceso]
    C --> E[Fin]
    D --> E
