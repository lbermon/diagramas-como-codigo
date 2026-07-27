workspace "Ejemplo Básico" {
  model {
    usuario = person "Usuario"
    sistema = softwareSystem "Sistema de Gestión"
    usuario -> sistema "Usa"
  }

  views {
    systemContext sistema "Vista de Contexto" {
      include *
      autoLayout lr
    }
  }
}
