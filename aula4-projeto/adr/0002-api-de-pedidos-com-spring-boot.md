# ADR-0002: API de Pedidos com Java / Spring Boot e PostgreSQL

> *Exemplo adicional* — não consta nos slides.

- **Status:** Aceito
- **Diagramas relacionados:** [Contêineres](../docs/03-c4-nivel2-conteineres.md), [Componentes](../docs/04-c4-nivel3-componentes.md)

## Contexto
As regras de pedido precisam de transações consistentes e de um time com experiência em Java.

## Decisão
Implementar a **API de Pedidos** em **Java / Spring Boot**, persistindo em **PostgreSQL** via **JDBC** (Spring Data).

## Consequências
- (+) Transações ACID, ecossistema maduro.
- (−) Acoplamento à stack Spring nos componentes (Nível 3).
