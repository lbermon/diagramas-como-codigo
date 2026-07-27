flowchart LR
    subgraph A["Sin estilos (inconsistente)"]
        A1([userSvc]) --> A2[(dbMain)]
        A1 --> A3{Proc?}
        A3 -->|ok| A4([Srv-Pay])
        A3 -->|err| A5([S3])
    end

    subgraph B["Con estilos (estandarizado)"]
        B1[[API_Usuario]] --> B2[(DB_Usuarios)]
        B1 --> B3{Validador}
        B3 -->|éxito| B4[[API_Pagos]]
        B3 -->|error| B5[(Blob_Almacenamiento)]
    end

    classDef capa_api stroke-width:2;
    classDef capa_datos stroke-dasharray:4 2;
    classDef decision stroke:#333,stroke-width:2,fill:#eee;

    class A1,A4,B1,B4 capa_api;
    class A2,A5,B2,B5 capa_datos;
    class A3,B3 decision;