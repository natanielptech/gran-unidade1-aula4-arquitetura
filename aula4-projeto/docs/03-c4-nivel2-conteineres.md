# 03 — C4 Nível 2: Contêineres

Mostra as **unidades implantáveis ou de armazenamento**: aplicação web, API, serviço, banco, app móvel.

> ⚠️ **Contêiner C4 ≠ contêiner Docker.** Pode incluir um contêiner Docker, mas não se limita a isso.

- **Público:** arquitetos, líderes técnicos, novos desenvolvedores.

## Diagrama (C4Container)

```mermaid
C4Container
    title Diagrama de Contêineres - E-commerce
    Person(cliente, "Cliente")
    System_Boundary(sis, "Sistema de E-commerce") {
        Container(web, "Aplicação Web", "React", "Interface do cliente")
        Container(api, "API de Pedidos", "Java / Spring Boot", "Regras de pedido")
        ContainerDb(db, "Banco de Pedidos", "PostgreSQL", "Armazena pedidos")
    }
    System_Ext(gateway, "Gateway de Pagamento", "Sistema externo")
    Rel(cliente, web, "Usa", "HTTPS")
    Rel(web, api, "Chama", "HTTPS/JSON")
    Rel(api, db, "Lê e grava", "JDBC")
    Rel(api, gateway, "Autoriza pagamento", "HTTPS/JSON")
```

## Alternativa em flowchart

```mermaid
flowchart LR
    cliente(["👤 Cliente<br/>[Pessoa]"])
    subgraph sis["Sistema de E-commerce"]
        web["Aplicação Web<br/>[Contêiner: React]"]
        api["API de Pedidos<br/>[Contêiner: Java / Spring Boot]"]
        db[("Banco de Pedidos<br/>[Contêiner: PostgreSQL]")]
    end
    gateway["Gateway de Pagamento<br/>[Sistema Externo]"]
    cliente -- "Usa (HTTPS)" --> web
    web -- "Chama (HTTPS/JSON)" --> api
    api -- "Lê e grava (JDBC)" --> db
    api -- "Autoriza pagamento (HTTPS/JSON)" --> gateway
    classDef ext fill:#999,stroke:#666,color:#fff
    class gateway ext
```

Fontes: [`02-conteineres.mmd`](../diagramas/02-conteineres.mmd), [`02-conteineres-flowchart.mmd`](../diagramas/02-conteineres-flowchart.mmd)

Decisão relacionada: [ADR-0002](../adr/0002-api-de-pedidos-com-spring-boot.md)

Anterior: [Nível 1](02-c4-nivel1-contexto.md) · Próximo: [Nível 3](04-c4-nivel3-componentes.md)
