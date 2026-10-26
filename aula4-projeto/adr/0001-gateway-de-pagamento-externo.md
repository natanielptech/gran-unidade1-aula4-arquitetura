# ADR-0001: Usar gateway de pagamento externo

> *Exemplo adicional* — não consta nos slides.

- **Status:** Aceito
- **Diagramas relacionados:** [Contexto](../docs/02-c4-nivel1-contexto.md), [Contêineres](../docs/03-c4-nivel2-conteineres.md)

## Contexto
O sistema precisa autorizar pagamentos com cartão, o que exige conformidade (PCI-DSS) e integração com adquirentes.

## Decisão
Delegar a autorização a um **Gateway de Pagamento externo**, integrado via **HTTPS/JSON** pela API de Pedidos.

## Consequências
- (+) Menos escopo de conformidade e menor tempo de entrega.
- (−) Dependência de terceiro: exige timeout, retentativa e tratamento de indisponibilidade.
- No C4, o gateway aparece em **cinza** (fora da responsabilidade do time).
