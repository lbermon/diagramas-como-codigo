flowchart LR
    Cliente([Cliente])

    subgraph Plataforma["Plataforma de banca en línea"]
        Portal["Portal Web"]
        Movil["Aplicación móvil"]
        Gateway["API Gateway"]
        Auth["Servicio de Autenticación"]
        Accounts["Servicio de Cuentas"]
        Transfers["Servicio de Transferencias"]
        Payments["Servicio de Pagos"]
        Audit["Servicio de Auditoría"]
        Database[("Base de datos central")]
    end

    Cliente --> Portal
    Cliente --> Movil

    Portal --> Gateway
    Movil --> Gateway

    Gateway --> Auth
    Gateway --> Accounts
    Gateway --> Transfers
    Gateway --> Payments

    Auth --> Database
    Accounts --> Database
    Transfers --> Database
    Payments --> Database

    Auth --> Audit
    Accounts --> Audit
    Transfers --> Audit
    Payments --> Audit

    Audit --> Database