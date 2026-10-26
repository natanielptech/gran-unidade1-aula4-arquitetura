# Aula 4 — UML: C4 Model, Documentação e Comunicação da Arquitetura

> **Curso:** Arquitetura de Sistemas e Microsserviços · Unidade 1 · Aula 4 — Prof. Nataniel Paiva

Documentação de um sistema de **e-commerce** nos **quatro níveis do C4 Model**, com diagramas suplementares, ADRs e a ideia de **documentação viva** (diagramas como texto, versionados com o código).

## Os quatro níveis de zoom

```mermaid
flowchart TB
    N1["Nível 1 · Contexto<br/>quem usa e com quem o sistema fala"]
    N2["Nível 2 · Contêineres<br/>apps, APIs, serviços, bancos"]
    N3["Nível 3 · Componentes<br/>partes internas de um contêiner"]
    N4["Nível 4 · Código<br/>classes e interfaces"]
    N1 -- zoom in --> N2 -- zoom in --> N3 -- zoom in --> N4
```

## Nível × público

| Nível | Diagrama | Público | Documento |
|---|---|---|---|
| 1 | Contexto | Negócio, diretoria, clientes | [02](docs/02-c4-nivel1-contexto.md) |
| 2 | Contêineres | Arquitetos, líderes técnicos, novos devs | [03](docs/03-c4-nivel2-conteineres.md) |
| 3 | Componentes *(opcional)* | Devs do contêiner | [04](docs/04-c4-nivel3-componentes.md) |
| 4 | Código *(opcional)* | Devs do contêiner | [05](docs/05-c4-nivel4-codigo.md) |

## Nível 1 — Contexto

```mermaid
flowchart LR
    cliente(["👤 Cliente<br/>[Pessoa]"])
    ecom["Sistema de E-commerce<br/>[Sistema de Software]"]
    gateway["Gateway de Pagamento<br/>[Sistema Externo]"]
    email["Serviço de E-mail<br/>[Sistema Externo]"]
    transp["Transportadora<br/>[Sistema Externo]"]
    cliente -- "Faz pedidos (HTTPS)" --> ecom
    ecom -- "Autoriza pagamentos (HTTPS/JSON)" --> gateway
    ecom -- "Envia e-mails (SMTP)" --> email
    ecom -- "Solicita entrega (HTTPS/JSON)" --> transp
    classDef ext fill:#999,stroke:#666,color:#fff
    class gateway,email,transp ext
```

## Nível 2 — Contêineres

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

## Nível 3 — Componentes (API de Pedidos)

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

## Nível 4 — Código

```mermaid
classDiagram
    class PedidoController {
        +criarPedido(dto) Pedido
    }
    class FreteService {
        <<interface>>
        +calcular(pedido) Money
    }
    class PedidoRepository {
        <<interface>>
        +salvar(pedido)
    }
    class Pedido {
        -id
        -status
    }
    PedidoController --> FreteService
    PedidoController --> PedidoRepository
    PedidoRepository --> Pedido
```

## C4 = o quê/como · ADR = por quê · arc42

```mermaid
flowchart LR
    C4["Diagramas C4<br/>o quê e como"] --- ADR["ADR<br/>por quê"] --- Q["Cenários de qualidade"]
    C4 & ADR & Q --> ARC["arc42 · documentação viva<br/>versionada como texto junto ao código"]
```

## Conteúdo

- [`docs/`](docs/) — um documento por tema (01 a 08), com versões C4 nativas do Mermaid e alternativas em `flowchart`.
- [`diagramas/`](diagramas/) — fontes `.mmd`, um por diagrama.
- [`adr/`](adr/) — ADRs de exemplo ligados aos diagramas.
- [`structurizr/workspace.dsl`](structurizr/workspace.dsl) — mesma arquitetura em Structurizr DSL *(exemplo adicional)*.
- [`glossario.md`](glossario.md)

> Os ADRs, a Transportadora e o Structurizr DSL são *exemplos adicionais*, fora dos slides.
> Fonte: Aula 4 — Prof. Nataniel Paiva.
