# diagrama_logico_basico.py

from diagrams import Diagram
from diagrams.onprem.client import User
from diagrams.onprem.compute import Server
from diagrams.onprem.database import PostgreSQL


# Creación del diagrama lógico
with Diagram("Diagrama Lógico - Aplicación Web", show=True, direction="LR"):
    usuario = User("Cliente / Navegador")
    servidor_web = Server("Servidor Web")
    servidor_app = Server("Servidor de Aplicación")
    base_datos = PostgreSQL("Base de Datos")

    # Flujo lógico de interacción
    usuario >> servidor_web >> servidor_app >> base_datos