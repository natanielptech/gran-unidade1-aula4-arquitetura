# 04 — C4 Nível 3: Componentes *(opcional)*

Mostra os componentes internos de **um** contêiner e suas responsabilidades. É **opcional**: use apenas para os contêineres mais complexos — aqui, a **API de Pedidos**.

- **Público:** desenvolvedores do contêiner.

## Diagrama (C4Component)

```mermaid
C4Component
    title Componentes - API de Pedidos
    Container_Boundary(api, "API de Pedidos") {
        Component(ctrl, "Controlador de Pedidos", "Spring MVC", "Expõe endpoints REST")
        Component(frete, "Serviço de Cálculo de Frete", "Spring Bean", "Calcula frete")
        Component(repo, "Repositório de Pedidos", "Spring Data", "Acesso a dados")
    }
    ContainerDb(db, "Banco de Pedidos", "PostgreSQL")
    Rel(ctrl, frete, "Usa")
    Rel(ctrl, repo, "Usa")
    Rel(repo, db, "Lê e grava", "JDBC")
```

## Alternativa em flowchart

```mermaid
flowchart LR
    subgraph api["API de Pedidos [Contêiner: Java / Spring Boot]"]
        ctrl["Controlador de Pedidos<br/>[Componente: Spring MVC]"]
        frete["Serviço de Cálculo de Frete<br/>[Componente: Spring Bean]"]
        repo["Repositório de Pedidos<br/>[Componente: Spring Data]"]
    end
    db[("Banco de Pedidos<br/>[Contêiner: PostgreSQL]")]
    ctrl -- "Usa" --> frete
    ctrl -- "Usa" --> repo
    repo -- "Lê e grava (JDBC)" --> db
```

Fontes: [`03-componentes.mmd`](../diagramas/03-componentes.mmd), [`03-componentes-flowchart.mmd`](../diagramas/03-componentes-flowchart.mmd)

Anterior: [Nível 2](03-c4-nivel2-conteineres.md) · Próximo: [Nível 4](05-c4-nivel4-codigo.md)
