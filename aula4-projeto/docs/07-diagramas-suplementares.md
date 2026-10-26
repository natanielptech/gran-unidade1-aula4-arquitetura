# 07 — Diagramas suplementares

## Diagrama dinâmico

Mostra a **colaboração entre contêineres/componentes** em um cenário (≈ diagrama de sequência da UML). Cenário: finalizar uma compra.

```mermaid
sequenceDiagram
    actor Cliente
    participant Web as Aplicação Web
    participant API as API de Pedidos
    participant DB as Banco de Pedidos
    Cliente->>Web: finaliza compra
    Web->>API: POST /pedidos (HTTPS/JSON)
    API->>DB: INSERT pedido
    API-->>Web: 201 Created
    Web-->>Cliente: confirmação
```

Fonte: [`06-dinamico.mmd`](../diagramas/06-dinamico.mmd)

## Diagrama de implantação (deployment)

Mapeia os contêineres para a **infraestrutura real**: servidores, regiões de nuvem, clusters Docker/Kubernetes. Aprofundado na **Unidade 3**.

```mermaid
flowchart LR
    subgraph Nuvem["Região de nuvem"]
        subgraph K8s["Cluster Kubernetes"]
            web["Pod: Aplicação Web"]
            api["Pod: API de Pedidos"]
        end
        db[("PostgreSQL gerenciado")]
    end
    web --> api --> db
```

Fonte: [`07-implantacao.mmd`](../diagramas/07-implantacao.mmd)

Anterior: [Notação](06-notacao-e-boas-praticas.md) · Próximo: [Comunicação por público](08-comunicacao-por-publico.md)
