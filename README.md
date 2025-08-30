# kubernetes-labs-infra-cluster

Kubernetes Labs - Infra Cluster.

This repository contains Terraform code and supporting scripts to provision and manage Kubernetes infrastructure across multiple cloud providers (GCP and Vultr) for both development and production environments.

## Repository Structure

### Top-level configuration files

- **main.tf**: The primary Terraform configuration file. It defines the main resources, modules, and orchestrates the overall infrastructure setup.
- **providers.tf**: Specifies the cloud providers (such as GCP and Vultr) and their required configurations for Terraform to interact with them.
- **backend.tf**: Configures the backend for storing Terraform state remotely, ensuring state consistency and collaboration.
- **data.tf**: Contains data sources used to fetch information from providers or other resources, which can be referenced elsewhere in the configuration.

### Folders

- **environments/**  
  Contains environment-specific variable definitions for different deployment targets.
  - `tfvars` file for environment-specific variables.

- **modules/**  
  Reusable Terraform modules for different infrastructure components.
  - `cluster/`: Module for provisioning Kubernetes clusters.
  - `helm-charts/`: Module for deploying Helm charts to the cluster.

- **scripts/**  
  - Utility scripts for local configuration and automation.

- **.github/**  
  GitHub configuration files.
  - `PULL_REQUEST_TEMPLATE/`: Templates for pull requests.
  - `workflows/`: GitHub Actions workflows for CI/CD (we use reusable workflow)

## Usage - local

1. **Configure Environment Variables:**  
   Edit the appropriate `terraform.tfvars` file under `environments`

2. **Initialize Terraform:**  
   ```sh
   terraform init
   ```

3. **Plan and Apply:**  
   ```sh
   terraform plan -var-file=environments/<env>/terraform.tfvars
   terraform apply -var-file=environments/<env>/terraform.tfvars
   ```

## Requirements

- Access credentials for Vultr

## Como conectar ao cluster

* Necessario instalar a ferramenta [kubectl](https://kubernetes.io/docs/tasks/tools/)
  * recomendamos a opcao `winget` + `gitbash` no windows (seguia os passos)
* A ferramenta *kubectl* precisa ser configurada para conectar ao cluster
  * Caminho padrao `$HOME/.kube/config`. 
  * A configuracao pode ser feita manualmente editando o arquivo `config` ou qualquer outro `ex.: config-labs` em qualquer diretorio
  * Outra opcao é utilizar as configuracões `kubeconfig` fornecidas pelo provedor em formato base64 e decodificar em um arquivo config
  * Por ser um ambiente lab (efêmero) neste projeto utilizamos um arquivo .bash para configurar (veja a pasta scripts)
  * NOTA: quando o valor dos atributos do arquivos também estão em formato base64 eles devem conter o sufixo `-data`, exemplo: `client-certificate-data`
  * Exemplo de um arquivo de config
  ```
    apiversion: v1
    clusters:
    - cluster:
        certificate-authority-data: LS0...
        server: https://aaaa.vultr-k8s.com:6443
      name: vke-bc693129-000...
    contexts:
    - context:
        cluster: vke-bc693129-000...
        user: user
      name: vke-bc693129-000...
    current-context: vke-bc693129-000...
    kind: Config
    preferences: {}
    users:
    - name: user
      user:
        client-certificate-data: LS0t...
        client-key-data: LS0t...

  ```
* Documentação oficial:
  * https://kubernetes.io/docs/reference/kubectl/
  * https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands
  * https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/

* Alguns comandos após configuração:
```
kubectl config current-context --kubeconfig ~/.kube/config-labs # consulta o contexto corrente no arquivo informado
```

---

O kubectl sempre usa o arquivo de configuração localizado em:

~/.kube/config

Mesmo que você use kubectl config use-context, ele está operando dentro desse mesmo arquivo (a menos que você indique outro explicitamente).

✅ Como usar um kubeconfig alternativo localmente

Se você criou um kubeconfig separado, por exemplo: ~/.kube/cloud-config, você tem duas opções para usá-lo:

- Usar a variável de ambiente KUBECONFIG

export KUBECONFIG=~/.kube/cloud-config
kubectl config use-context nome-do-contexto
kubectl get pods

Isso instruirá o kubectl a olhar para esse outro arquivo, e não o ~/.kube/config.

- Passar via flag --kubeconfig

kubectl --kubeconfig ~/.kube/cloud-config get pods

⚠️ Importante

Rodar kubectl config use-context sem mudar o kubeconfig usado não terá efeito se o contexto que você quer mudar não está no arquivo default (~/.kube/config).

Para tornar o novo arquivo permanente, você pode exportar o KUBECONFIG no seu ~/.bashrc, ~/.zshrc ou equivalente:

export KUBECONFIG=~/.kube/cloud-config

---

🧠 O que é um contexto no kubectl?

Um contexto no kubectl é uma entrada no kubeconfig que agrupa:

* cluster (o servidor Kubernetes que você vai acessar)

* usuário (as credenciais usadas para autenticar)

* namespace padrão (opcional, para comandos que não especificam o --namespace)

✅ Um contexto responde:

"Quando eu executo kubectl, para qual cluster, como e com qual namespace padrão eu estou me conectando?"

📄 Exemplo de kubeconfig com múltiplos contextos

```
contexts:
- name: minikube
  context:
    cluster: minikube
    user: minikube
    namespace: default

- name: vultr-prod
  context:
    cluster: vultr-k8s
    user: vultr-user
    namespace: prod

- name: vultr-hml
  context:
    cluster: vultr-k8s
    user: vultr-user
    namespace: homologacao
```    

⚙️ Comandos úteis

🔹 Ver o contexto atual

kubectl config current-context

🔹 Listar todos os contextos

kubectl config get-contexts

🔹 Mudar de contexto

kubectl config use-context vultr-prod

🧱 Por que o contexto é importante?

- 🔒 Evita erros críticos	Você evita deletar pods ou fazer deploys acidentalmente no cluster errado.
- 🚀 Facilita ambientes múltiplos	Permite alternar entre dev, staging, prod com facilidade.
- 📚 Organização e rastreabilidade	Permite logs e automações mais seguras e claras.
- 🧪 Melhora o uso em CI/CD	Permite aplicar configs em clusters diferentes de forma programada.


Dica _gerado por IA 🤖_