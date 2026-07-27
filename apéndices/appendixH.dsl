workspace {
    model {
        clinician = person "Personal asistencial" {
            description "Médicos, enfermeros y demás profesionales encargados de la atención clínica."
        }

        admin = person "Personal administrativo" {
            description "Personal responsable de los procesos administrativos y operativos."
        }

        patient = person "Paciente" {
            description "Usuario que consulta citas, resultados e información clínica."
        }

        lab = softwareSystem "Laboratorio Clínico" {
            description "Sistema externo que procesa y entrega resultados de laboratorio."
        }

        insurer = softwareSystem "Aseguradora" {
            description "Sistema externo para la validación de afiliaciones, autorizaciones y facturación."
        }

        fhir = softwareSystem "Servicios HL7 FHIR" {
            description "Plataforma externa para el intercambio interoperable de información clínica."
        }

        hospital = softwareSystem "Sistema Hospitalario Empresarial" {
            description "Plataforma para gestionar los procesos clínicos y administrativos de la institución."

            webPortal = container "Portal web" {
                description "Permite al personal asistencial y administrativo acceder a las funcionalidades del sistema."
                technology "Aplicación web"
            }

            mobileApp = container "Aplicación móvil" {
                description "Permite a los pacientes consultar citas, resultados e información clínica."
                technology "Aplicación móvil"
            }

            apiGateway = container "API de servicios" {
                description "Centraliza las solicitudes de las aplicaciones cliente y expone los servicios del sistema."
                technology "API REST"
            }

            clinicalService = container "Servicio de Historia Clínica Electrónica" {
                description "Gestiona historias clínicas, consultas, diagnósticos, tratamientos y órdenes médicas."
                technology "Servicio de aplicación"
            }

            administrativeService = container "Servicio de gestión administrativa" {
                description "Gestiona usuarios, autorizaciones, facturación y demás procesos administrativos."
                technology "Servicio de aplicación"
            }

            interoperabilityService = container "Servicio de interoperabilidad" {
                description "Gestiona el intercambio de información clínica y administrativa con sistemas externos."
                technology "HL7 FHIR / API REST"
            }

            database = container "Base de datos hospitalaria" {
                description "Almacena la información clínica, administrativa y de auditoría."
                technology "Base de datos relacional"
                tags "Database"
            }
        }

        clinician -> webPortal "Gestiona información clínica" "HTTPS"
        admin -> webPortal "Gestiona procesos administrativos" "HTTPS"
        patient -> mobileApp "Consulta citas, resultados e información clínica" "HTTPS"

        webPortal -> apiGateway "Envía solicitudes" "HTTPS/JSON"
        mobileApp -> apiGateway "Envía solicitudes" "HTTPS/JSON"

        apiGateway -> clinicalService "Solicita operaciones clínicas" "REST/JSON"
        apiGateway -> administrativeService "Solicita operaciones administrativas" "REST/JSON"

        clinicalService -> database "Consulta y almacena información clínica" "SQL"
        administrativeService -> database "Consulta y almacena información administrativa" "SQL"

        clinicalService -> interoperabilityService "Solicita intercambio de información clínica"
        administrativeService -> interoperabilityService "Solicita validaciones y autorizaciones"

        interoperabilityService -> lab "Solicita y recibe resultados" "API"
        interoperabilityService -> insurer "Intercambia autorizaciones y facturación" "API"
        interoperabilityService -> fhir "Intercambia recursos clínicos" "HL7 FHIR"
    }

    views {
        container hospital {
            include *
            autolayout lr
        }

        styles {
            element "Person" {
                shape Person
                background #08427b
                color #ffffff
            }

            element "Software System" {
                background #999999
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
        }
    }
}