# Infraestrutura como Código no Azure - Terraform

Este repositório contém a definição da infraestrutura dos ambientes **QA** e **Produção**, utilizando [Terraform](https://www.terraform.io/) para provisionamento de recursos no [Microsoft Azure](https://azure.microsoft.com/).

## Estrutura do Projeto
. ├── main.tf # Recursos principais do Azure ├── variables.tf # Definição de variáveis ├── outputs.tf # Saídas dos recursos ├── versions.tf # Requisitos de versão e provider ├── terraform.qa.tfvars # Variáveis do ambiente QA ├── terraform.prod.tfvars # Variáveis do ambiente Produção ├── .gitignore # Arquivo para ignorar arquivos sensíveis e desnecessários

## Pré-requisitos

- Conta no [Microsoft Azure](https://portal.azure.com/)
- [Terraform](https://www.terraform.io/downloads.html) instalado (`brew install hashicorp/tap/terraform`)
- [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) instalada (`brew install azure-cli`)
- Permissões para criar recursos no Azure ou um Service Principal configurado

## Configuração Inicial

1. **Clone o repositório**
    ```sh
    git clone git@github.com:luizhferraz/infra-as-code.git
    cd infra-as-code
    ```

2. **Autentique no Azure**
    ```sh
    az login
    ```

3. **Configure variáveis sensíveis**
   - Crie um Service Principal para o Terraform:
     ```sh
     az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/<SEU_SUBSCRIPTION_ID>"
     ```
   - Configure as variáveis de ambiente retornadas:
     ```sh
     export ARM_CLIENT_ID="..."
     export ARM_CLIENT_SECRET="..."
     export ARM_SUBSCRIPTION_ID="..."
     export ARM_TENANT_ID="..."
     ```
   - Ou preencha os valores apropriados nos arquivos `terraform.qa.tfvars` ou `terraform.prod.tfvars`.

## Como Usar

### 1. Inicialize o Terraform

```sh
terraform init
2. Planeje a implantação para o ambiente desejado
sh
Copiar
terraform plan -var-file="terraform.qa.tfvars"
# ou para produção:
terraform plan -var-file="terraform.prod.tfvars"
3. Aplique a infraestrutura
sh
Copiar
terraform apply -var-file="terraform.qa.tfvars"
# ou para produção:
terraform apply -var-file="terraform.prod.tfvars"
Boas Práticas
Nunca faça commit de arquivos .tfvars com segredos em repositórios públicos!
Use sempre o arquivo .gitignore fornecido neste projeto.
Prefira variáveis de ambiente para informações sensíveis.
Créditos
Desenvolvido por Luiz Henrique Ferraz