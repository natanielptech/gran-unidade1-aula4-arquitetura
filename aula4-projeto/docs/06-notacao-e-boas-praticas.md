# 06 — Notação e boas práticas

## Rótulos de tipo

| Elemento | Rótulo |
|---|---|
| Pessoa | `[Pessoa]` |
| Sistema interno / externo | `[Sistema de Software]` / `[Sistema Externo]` |
| Contêiner | `[Contêiner: tecnologia]` |
| Componente | `[Componente: tecnologia]` |

## Boas práticas

1. **Setas rotuladas** com o relacionamento e, idealmente, o protocolo/tecnologia (`HTTPS/JSON`, `gRPC`, `JDBC`, `SMTP`).
2. **Sistemas externos em cinza** — mostram onde termina a responsabilidade do time.
3. Use o **mesmo sistema de exemplo** em todos os níveis para permitir o "zoom".
4. Níveis 3 e 4 são **opcionais**; nível 4 idealmente gerado do código.
5. **Contêiner C4 ≠ contêiner Docker.**
6. Diagramas **como texto** (Mermaid, PlantUML, Structurizr) **versionados com o código** — evite imagens estáticas.

## Antipadrão

Retângulos e setas sem legenda nem tipo ("diagrama ad hoc"): cada leitor interpreta de um jeito.

Anterior: [Nível 4](05-c4-nivel4-codigo.md) · Próximo: [Diagramas suplementares](07-diagramas-suplementares.md)
