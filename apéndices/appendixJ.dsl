workspace {

    model {
        customer = person "Cliente" {
            description "Usuario de los servicios bancarios."
        }

        banking = softwareSystem "Plataforma Bancaria" {
            description "Sistema que ofrece servicios bancarios digitales."

            web = container "Portal Web" {
                description "Permite acceder a los servicios bancarios desde un navegador."
                technology "Aplicación web"
            }

            mobile = container "Aplicación móvil" {
                description "Permite acceder a los servicios bancarios desde dispositivos móviles."
                technology "Aplicación móvil"
            }

            gateway = container "API Gateway" {
                description "Centraliza las solicitudes de las aplicaciones cliente."
                technology "API REST"
            }

            auth = container "Servicio de Autenticación" {
                description "Gestiona la autenticación y autorización de los usuarios."
                technology "Microservicio"
            }

            accounts = container "Servicio de Cuentas" {
                description "Gestiona cuentas, saldos y movimientos."
                technology "Microservicio"
            }

            transfers = container "Servicio de Transferencias" {
                description "Gestiona transferencias entre cuentas."
                technology "Microservicio"
            }
        }

        customer -> web "Utiliza" "HTTPS"
        customer -> mobile "Utiliza" "HTTPS"

        web -> gateway "Envía solicitudes" "HTTPS/JSON"
        mobile -> gateway "Envía solicitudes" "HTTPS/JSON"

        gateway -> auth "Valida identidad" "REST/JSON"
        gateway -> accounts "Consulta cuentas y movimientos" "REST/JSON"
        gateway -> transfers "Solicita transferencias" "REST/JSON"

        transfers -> accounts "Consulta y actualiza saldos" "REST/JSON"
    }

    views {
        container banking {
            include *
            autolayout lr
        }
    }
}