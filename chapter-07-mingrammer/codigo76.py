# diagrama_nube_basico.py

from diagrams import Diagram, Cluster
from diagrams.aws.network import ELB
from diagrams.aws.compute import EC2
from diagrams.aws.database import RDS
from diagrams.aws.storage import S3
from diagrams.aws.general import User


# Creación del diagrama de despliegue
with Diagram("Despliegue en la Nube - AWS", show=True, direction="TB"):

    usuario = User("Usuario Final")

    with Cluster("AWS Cloud"):

        # Capa de presentación: balanceador
        balanceador = ELB("Elastic Load Balancer")

        # Capa de aplicación: instancias EC2
        with Cluster("Capa de Aplicación"):
            servidor1 = EC2("App Server 1")
            servidor2 = EC2("App Server 2")

        # Capa de datos: base de datos y almacenamiento
        with Cluster("Capa de Datos"):
            base_datos = RDS("Base de Datos RDS")
            almacenamiento = S3("Contenido Estático (S3)")

        # Relaciones entre los componentes
        usuario >> balanceador >> [servidor1, servidor2]
        [servidor1, servidor2] >> base_datos
        [servidor1, servidor2] >> almacenamiento