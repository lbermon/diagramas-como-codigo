workspace {

    model {
        customer = person "Cliente" {
            description "Usuario de los servicios bancarios digitales."
        }

        banking = softwareSystem "Plataforma de banca en línea" {
            description "Sistema que permite consultar cuentas, realizar transferencias, pagar servicios y administrar productos financieros."

            web = container "Portal web" {
                description "Permite al cliente acceder a los servicios bancarios mediante un navegador."
                technology "Aplicación web"
            }

            mobile = container "Aplicación móvil" {
                description "Permite al cliente acceder a los servicios bancarios desde un dispositivo móvil."
                technology "Aplicación móvil"
            }

            gateway = container "API Gateway" {
                description "Centraliza, protege y enruta las solicitudes procedentes de las aplicaciones cliente."
                technology "API REST"
            }

            auth = container "Servicio de autenticación" {
                description "Gestiona la autenticación, autorización y emisión de tokens de acceso."
                technology "OAuth 2.0 / OpenID Connect"
                tags "Security"
            }

            accounts = container "Servicio de cuentas" {
                description "Gestiona cuentas, saldos, movimientos y productos financieros."
                technology "Microservicio"
            }

            transfers = container "Servicio de transferencias" {
                description "Gestiona transferencias entre cuentas y valida las condiciones de la operación."
                technology "Microservicio"
            }

            payments = container "Servicio de pagos" {
                description "Gestiona el pago de servicios y obligaciones."
                technology "Microservicio"
            }

            audit = container "Servicio de auditoría" {
                description "Registra accesos, consultas y transacciones para garantizar su trazabilidad."
                technology "Microservicio"
                tags "Audit"
            }

            database = container "Base de datos bancaria" {
                description "Almacena cuentas, saldos, movimientos, pagos y demás información financiera."
                technology "Base de datos relacional"
                tags "Database"
            }

            auditdb = container "Base de datos de auditoría" {
                description "Almacena de forma independiente los eventos y registros de auditoría."
                technology "Base de datos de registros"
                tags "AuditDatabase"
            }
        }

        customer -> web "Utiliza" "HTTPS"
        customer -> mobile "Utiliza" "HTTPS"

        web -> gateway "Envía solicitudes" "HTTPS/JSON"
        mobile -> gateway "Envía solicitudes" "HTTPS/JSON"

        gateway -> auth "Autentica y autoriza solicitudes" "OAuth 2.0"
        gateway -> accounts "Consulta saldos y productos" "REST/JSON"
        gateway -> transfers "Solicita transferencias" "REST/JSON"
        gateway -> payments "Solicita pagos" "REST/JSON"

        auth -> database "Consulta usuarios y permisos" "SQL"

        accounts -> database "Consulta y actualiza cuentas" "SQL"
        transfers -> database "Consulta y actualiza saldos" "SQL"
        payments -> database "Registra pagos" "SQL"

        auth -> audit "Registra accesos y autenticaciones"
        accounts -> audit "Registra consultas y modificaciones"
        transfers -> audit "Registra todas las transferencias"
        payments -> audit "Registra todas las operaciones de pago"

        audit -> auditdb "Almacena eventos de auditoría" "SQL"
    }

    views {
        container banking {
            include *
            autolayout lr
        }

        styles {
            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }

            element "Container" {
                background #438dd5
                color #ffffff
            }

            element "Database" {
                shape Cylinder
                background #2e7d32
                color #ffffff
            }

            element "Security" {
                background #8e44ad
                color #ffffff
            }

            element "Audit" {
                background #d35400
                color #ffffff
            }

            element "AuditDatabase" {
                shape Cylinder
                background #b03a2e
                color #ffffff
            }
        }
    }
}