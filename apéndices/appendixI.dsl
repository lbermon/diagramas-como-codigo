workspace {

    model {
        hospital = softwareSystem "Sistema Hospitalario Empresarial" {
            description "Plataforma para gestionar los procesos clínicos y administrativos de la institución."

            apiGateway = container "API de servicios" {
                description "Centraliza las solicitudes de las aplicaciones cliente y expone los servicios del sistema."
                technology "API REST"
            }

            clinicalService = container "Servicio de Historia Clínica Electrónica" {
                description "Gestiona historias clínicas, consultas, diagnósticos, tratamientos y órdenes médicas."
                technology "Microservicio"

                restController = component "Controlador de servicios REST" {
                    description "Recibe las solicitudes relacionadas con la historia clínica y expone las operaciones del servicio."
                    technology "REST API"
                }

                clinicalLogic = component "Lógica clínica" {
                    description "Implementa las reglas de negocio para consultas, diagnósticos, tratamientos y órdenes médicas."
                    technology "Servicio de dominio"
                }

                ehrRepository = component "Repositorio de historias clínicas" {
                    description "Gestiona el acceso y la persistencia de la información clínica."
                    technology "Repositorio de datos"
                }

                fhirAdapter = component "Adaptador HL7 FHIR" {
                    description "Transforma la información clínica al estándar HL7 FHIR y coordina su intercambio con sistemas externos."
                    technology "HL7 FHIR"
                }

                auditService = component "Servicio de auditoría" {
                    description "Registra las operaciones realizadas sobre la información clínica para garantizar su trazabilidad."
                    technology "Servicio de auditoría"
                }
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

        apiGateway -> restController "Envía solicitudes clínicas" "REST/JSON"
        restController -> clinicalLogic "Delega las operaciones clínicas"
        clinicalLogic -> ehrRepository "Consulta y actualiza historias clínicas"
        clinicalLogic -> fhirAdapter "Solicita intercambio de información clínica"
        clinicalLogic -> auditService "Registra las operaciones realizadas"
        ehrRepository -> database "Lee y almacena información clínica" "SQL"
        auditService -> database "Almacena registros de auditoría" "SQL"
        fhirAdapter -> interoperabilityService "Intercambia recursos clínicos" "HL7 FHIR"
    }

    views {
        component clinicalService {
            include *
            autolayout lr
        }

        styles {
            element "Software System" {
                background #999999
                color #ffffff
            }

            element "Container" {
                background #438dd5
                color #ffffff
            }

            element "Component" {
                background #85bbf0
                color #000000
            }

            element "Database" {
                shape Cylinder
                background #2e7d32
                color #ffffff
            }
        }
    }
}