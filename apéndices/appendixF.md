flowchart TD
    inicio@{ shape: circle, label: "Inicio" }
    ingreso_credenciales@{ shape: rect, label: "Usuario ingresa nombre de usuario y contraseña" }
    validacion_credenciales@{ shape: rect, label: "Sistema valida credenciales" }
    decision_credenciales@{ shape: diam, label: "¿Credenciales correctas?" }
    acceso_panel@{ shape: rect, label: "Acceso al panel principal" }
    mensaje_error@{ shape: rect, label: "Mostrar mensaje de error" }
    reintento@{ shape: rect, label: "Permitir reintento" }
    fin@{ shape: circle, label: "Fin" }

    inicio --> ingreso_credenciales
    ingreso_credenciales --> validacion_credenciales
    validacion_credenciales --> decision_credenciales
    decision_credenciales -->|Sí| acceso_panel
    decision_credenciales -->|No| mensaje_error
    acceso_panel --> fin
    mensaje_error --> reintento
    reintento --> ingreso_credenciales