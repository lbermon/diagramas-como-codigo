workspace {
    model {
        egresado = person "Egresado"
        administrador = person "Administrador de Programa"

        PEBE = softwareSystem "PEBE - Plataforma de Egresados y Bolsa de Empleo" {
            web = container "Web App"
            mobile = container "Mobile App"

            api = container "API Application" {
                controladorPerfil = component "Controlador de perfiles"
                controladorTrabajo = component "Controlador de Tablero de Trabajo"

                seguridad = component "Componente de seguridad"
                adaptadorI = component "Adaptador de identidad"
                adaptadorA = component "Adaptador de analítica"
                servicioN = component "Servicio de notificación"
                repositorio = component "Repositorio de egresados"

                controladorPerfil -> repositorio "Consulta y actualiza datos de egresados"
                controladorTrabajo -> repositorio "Consulta ofertas y postulaciones"

                controladorPerfil -> seguridad "Verifica permisos"
                controladorTrabajo -> seguridad "Verifica permisos"

                seguridad -> adaptadorI "Autentica usuarios"

                controladorPerfil -> servicioN "Envía notificaciones"
                controladorTrabajo -> adaptadorA "Publica eventos de uso"
            }

            db = container "Database Schema" {
                tags "Database"
            }
        }

        email = softwareSystem "Sistema de Email"
        analitica = softwareSystem "Analytics"
        proveedor = softwareSystem "Proveedor de Identidad (SSO)"

        egresado -> PEBE "Usa"
        administrador -> PEBE "Usa"

        PEBE -> email "Envía notificaciones"
        PEBE -> analitica "Publica eventos"
        PEBE -> proveedor "Autentica usuarios"

        web -> api "Consume"
        mobile -> api "Consume"
        api -> db "Lee/Escribe"

        api -> analitica "Envía notificaciones"
        api -> analitica "Envía eventos"

        web -> analitica "Dispara eventos de uso"
        mobile -> analitica "Dispara eventos de uso"

        api -> proveedor "Autentica usuarios"
    }

    views {
        systemContext PEBE "Diagram1" {
            include *
        }

        container PEBE "Diagram2" {
            include *
            autolayout lr
        }

        component api "Diagram3" {
            include *
            autolayout lr
        }

        styles {
            element "Element" {
                color #0773af
                stroke #0773af
                strokeWidth 7
                shape roundedbox
            }

            element "Person" {
                shape person
            }

            element "Database" {
                shape cylinder
            }

            element "Boundary" {
                strokeWidth 5
            }

            relationship "Relationship" {
                thickness 4
            }
        }
    }

    configuration {
        scope softwaresystem
    }
}