graph TD
    Diagrama --> Structure_Diagram
    Diagrama --> Behavior_Diagram

    Structure_Diagram --> Class_Diagram
    Structure_Diagram --> Component_Diagram
    Structure_Diagram --> Object_Diagram
    Structure_Diagram --> Package_Diagram
    Component_Diagram --> Composite_Structure_Diagram
    Component_Diagram --> Deployment_Diagram

    Behavior_Diagram --> Activity_Diagram
    Behavior_Diagram --> Use_Case_Diagram
    Behavior_Diagram --> State_Machine_Diagram
    Behavior_Diagram --> Interaction_Diagram

    Interaction_Diagram --> Sequence_Diagram
    Interaction_Diagram --> Communication_Diagram
    Interaction_Diagram --> Interaction_Overview_Diagram
    Interaction_Diagram --> Timing_Diagram

    %% Labels
    Structure_Diagram["Diagramas Estructurales"]
    Behavior_Diagram["Diagramas de Comportamiento"]
    Class_Diagram["Diagramas de Clase"]
    Component_Diagram["Diagrama de Componentes"]
    Object_Diagram["Diagramas de Objeto"]
    Package_Diagram["Diagramas de Paquetes"]
    Composite_Structure_Diagram["Diagramas de Estructura Compuesta"]
    Deployment_Diagram["Diagramas de Despliegue"]
    Activity_Diagram["Diagramas de Actividad"]
    Use_Case_Diagram["Diagramas de Casos de Uso"]
    State_Machine_Diagram["Diagramas de Estado"]
    Interaction_Diagram["Diagramas de Interacción"]
    Sequence_Diagram["Diagramas de Secuencia"]
    Communication_Diagram["Diagramas de Comunicación"]
    Interaction_Overview_Diagram["Diagramas de Visión General de las Interacciones"]
    Timing_Diagram["Diagramas de Tiempo"]