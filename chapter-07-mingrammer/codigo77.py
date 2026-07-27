# diagrama_hibrido_multicloud.py

from diagrams import Diagram, Cluster
from diagrams.generic.network import Firewall, VPN
from diagrams.onprem.database import PostgreSQL
from diagrams.aws.compute import EC2
from diagrams.azure.compute import AppServices
from diagrams.azure.network import ApplicationGateway


with Diagram("Arquitectura Híbrida y Multicloud", show=True, direction="LR"):

    with Cluster("Entorno On-Premise"):
        firewall_local = Firewall("Firewall Local")
        base_datos_local = PostgreSQL("Base de Datos Local")

    with Cluster("AWS Cloud"):
        app_server1 = EC2("Servidor App 1")
        app_server2 = EC2("Servidor App 2")

    with Cluster("Azure Cloud"):
        app_gateway = ApplicationGateway("App Gateway")
        frontend = AppServices("Frontend Web")

    # Conexiones entre los entornos
    firewall_local >> base_datos_local
    base_datos_local >> [app_server1, app_server2]
    [app_server1, app_server2] >> app_gateway >> frontend

    # Conexión VPN simulada entre nubes
    vpn_segura = VPN("Conexión VPN Segura")
    base_datos_local - vpn_segura - frontend