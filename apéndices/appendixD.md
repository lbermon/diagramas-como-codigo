flowchart LR
    %% Layout general

    %% Columna izquierda: Buenas prácticas
    subgraph GOOD["Buenas prácticas"]
        direction TB
        G1[Modularizar diagrama]
        G2[Revisión periódica + PR]
        G3[Centralizar estilos y convenciones]
        G4[Automatizar: render + linters en CI]
        G5[Capacitación continua del equipo]
        G6[Archivar / deprecar obsoletos]
        G1 --> G2 --> G3 --> G4 --> G5 --> G6
    end

    %% Columna derecha: Errores comunes
    subgraph BAD["Errores comunes"]
        direction TB
        B1[Diagramas saturados]
        B2[Duplicar definiciones en varios archivos]
        B3[Sin control de versiones / commits pobres]
        B4[Sin propósito ni alcance documentado]
        B5[Estilos inconsistentes entre equipos]
        B6[Sin validación sintáctica automatizada]
        B1 --> B2 --> B3 --> B4 --> B5 --> B6
    end

    %% Estilos visuales (verde para buenas, rojo para errores)
    classDef good fill:#e9f7ef,stroke:#2e7d32,stroke-width:2;
    classDef bad fill:#ffebee,stroke:#c62828,stroke-width:2;

    class G1,G2,G3,G4,G5,G6,GOOD good;
    class B1,B2,B3,B4,B5,B6,BAD bad;

    %% Nota central
    NOTE((Objetivo: claridad, mantenibilidad y gobernanza))
    GOOD --- NOTE --- BAD