# 02 — C4 Nível 1: Contexto

O sistema é uma **caixa preta**, cercado por pessoas e sistemas externos.

- **Público:** negócio, diretoria, clientes, pessoas não técnicas.
- **Pergunta respondida:** quem usa o sistema e com quais sistemas ele conversa?

## Diagrama (C4Context)

```mermaid
C4Context
    title Diagrama de Contexto - Sistema de E-commerce
    Person(cliente, "Cliente", "Navega, compra e acompanha pedidos")
    System(ecom, "Sistema de E-commerce", "Catálogo, pedidos e pagamento")
    System_Ext(gateway, "Gateway de Pagamento", "Autoriza pagamentos")
    System_Ext(email, "Serviço de E-mail", "Envia notificações")
    System_Ext(transp, "Transportadora", "Entrega os pedidos")
    Rel(cliente, ecom, "Faz pedidos", "HTTPS")
    Rel(ecom, gateway, "Autoriza pagamentos", "HTTPS/JSON")
    Rel(ecom, email, "Envia e-mails", "SMTP")
    Rel(ecom, transp, "Solicita entrega", "HTTPS/JSON")
```

## Alternativa em flowchart (externos em cinza)

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

Fontes: [`01-contexto.mmd`](../diagramas/01-contexto.mmd), [`01-contexto-flowchart.mmd`](../diagramas/01-contexto-flowchart.mmd)

> *Exemplo adicional:* a Transportadora como sistema externo não consta nos slides.

Decisão relacionada: [ADR-0001](../adr/0001-gateway-de-pagamento-externo.md)

Próximo: [Nível 2 — Contêineres](03-c4-nivel2-conteineres.md)
