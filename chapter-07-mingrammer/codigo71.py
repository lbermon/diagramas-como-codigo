def capa_aplicacion():
    from diagrams.aws.compute import EC2
    from diagrams.aws.database import RDS

    app = EC2("Servidor Web")
    db = RDS("Base de Datos")

    app >> db

    return app, db