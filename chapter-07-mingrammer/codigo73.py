# diagrama_fisico_basico.py

from diagrams import Diagram, Cluster
from diagrams.generic.network import Router, Switch
from diagrams.onprem.compute import Server


with Diagram("Centro de Datos - Diagrama Físico", show=True, direction="TB"):
    router_principal = Router("Router Principal")

    with Cluster("Rack Principal"):
        switch_central = Switch("Switch Central")
        servidor_1 = Server("Servidor Físico 1")
        servidor_2 = Server("Servidor Físico 2")

    switch_central >> [servidor_1, servidor_2]
    router_principal >> switch_central