/*
 * Exemplo adicional: mesma arquitetura em Structurizr DSL.
 * Renderize em https://structurizr.com/dsl ou com structurizr-lite.
 */
workspace "E-commerce" "Aula 4 — Prof. Nataniel Paiva" {

    model {
        cliente = person "Cliente" "Navega, compra e acompanha pedidos"

        ecom = softwareSystem "Sistema de E-commerce" "Catálogo, pedidos e pagamento" {
            web = container "Aplicação Web" "Interface do cliente" "React"
            api = container "API de Pedidos" "Regras de pedido" "Java / Spring Boot" {
                ctrl = component "Controlador de Pedidos" "Expõe endpoints REST" "Spring MVC"
                frete = component "Serviço de Cálculo de Frete" "Calcula frete" "Spring Bean"
                repo = component "Repositório de Pedidos" "Acesso a dados" "Spring Data"
            }
            db = container "Banco de Pedidos" "Armazena pedidos" "PostgreSQL" "Database"
        }

        gateway = softwareSystem "Gateway de Pagamento" "Autoriza pagamentos" "Externo"
        email = softwareSystem "Serviço de E-mail" "Envia notificações" "Externo"
        transp = softwareSystem "Transportadora" "Entrega os pedidos" "Externo"

        cliente -> ecom "Faz pedidos" "HTTPS"
        ecom -> gateway "Autoriza pagamentos" "HTTPS/JSON"
        ecom -> email "Envia e-mails" "SMTP"
        ecom -> transp "Solicita entrega" "HTTPS/JSON"

        cliente -> web "Usa" "HTTPS"
        web -> api "Chama" "HTTPS/JSON"
        api -> db "Lê e grava" "JDBC"
        api -> gateway "Autoriza pagamento" "HTTPS/JSON"

        ctrl -> frete "Usa"
        ctrl -> repo "Usa"
        repo -> db "Lê e grava" "JDBC"
    }

    views {
        systemContext ecom "Contexto" { include * autolayout lr }
        container ecom "Conteineres" { include * autolayout lr }
        component api "Componentes" { include * autolayout lr }

        styles {
            element "Externo" { background #999999 color #ffffff }
            element "Database" { shape Cylinder }
        }
    }
}
