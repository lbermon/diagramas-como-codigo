flowchart TD
    A["Desarrollador edita diagramas (/diagrams/)"] --> B["git add (preparar cambios)"]
    B --> C["git commit (commit atómico + mensaje claro)"]
    C --> D["git push (enviar al repositorio remoto)"]
    D --> E["Pull Request (revisión visual)"]
    E --> F["Merge en main + etiquetas (versiones)"]