# diagrama_red_basico.py

from diagrams import Diagram, Cluster
from diagrams.generic.network import Router, Switch, Firewall
from diagrams.onprem.compute import Server
from diagrams.onprem.client import Users


# Creación del diagrama de red
with Diagram("Topología de Red - Organización Básica", show=True, direction="LR"):

    usuarios = Users("Usuarios Internos")

    with Cluster("Red Interna"):
        switch_principal = Switch("Switch de Distribución")
        servidor_app = Server("Servidor de Aplicaciones")
        servidor_db = Server("Servidor de Base de Datos")

        switch_principal >> [servidor_app, servidor_db]

    firewall = Firewall("Firewall Perimetral")
    router = Router("Router Principal / Internet")

    # Flujo de comunicación en la red
    usuarios >> switch_principal
    switch_principal >> firewall >> router