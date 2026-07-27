workspace {
    model {
        clinician = person "Personal asistencial"
        admin = person "Personal administrativo"
        patient = person "Paciente"

        hospital = softwareSystem "Sistema Hospitalario Empresarial"
        lab = softwareSystem "Laboratorio Clínico"
        insurer = softwareSystem "Aseguradora"
        fhir = softwareSystem "Servicios HL7 FHIR"

        clinician -> hospital "Gestiona información clínica"
        admin -> hospital "Gestiona procesos administrativos"
        patient -> hospital "Consulta información"

        hospital -> lab "Solicita resultados"
        hospital -> insurer "Intercambia información"
        hospital -> fhir "Interoperabilidad clínica"
    }

    views {
        systemContext hospital {
            include *
            autolayout lr
        }
    }
}