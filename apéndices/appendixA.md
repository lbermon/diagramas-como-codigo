graph TD
    ROOT[Herramientas para Diagramas como Código]
    A[1. Generadores de diagramas UML y estándares de modelado]
    A1[1.1 Herramientas UML textuales]
    A2[1.2 Herramientas para modelos C4]
    B[2. Herramientas de diagramación general y visualización]
    B1[2.1 Generadores de diagramas de flujo y secuencia]
    B2[2.2 Herramientas de gráficos y relaciones]
    C[3. Herramientas para arquitectura de software e infraestructura]

    ROOT --> A
    ROOT --> B
    ROOT --> C
    A --> A1
    A --> A2
    B --> B1
    B --> B2

    %% Enlaces opcionales a herramientas reales
    click A1 href "https://plantuml.com" "PlantUML"
    click A2 href "https://c4model.com" "C4Model"
    click B1 href "https://mermaid.js.org" "Mermaid.js"
    click B2 href "https://graphviz.org" "Graphviz"
    click C href "https://diagrams.mingrammer.com" "Diagrams (Mingrammer)"