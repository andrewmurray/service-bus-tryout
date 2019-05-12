# service-bus-tryout
Terraformed Azure Service Bus infrastructure and sender/consumer apps

# Getting Started

Once you've pulled the repo down you will need to ensure that you have the azure cli tools:

With chocolatey:
```bat
choco install azure-cli -y
```
Or from the following web URL:

https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest

Then log into your Azure account typing `az login` at the command prompt.

Ensure you have the correct Azure subscription selected:

```
az account list
```
Then pick one from the list. To use your Azure account associated with your MSDN subscription:
```
az account set -s "Visual Studio Professional"
```

You can now use terraform to new up your infrastructure:
```
terraform apply
```
Review what it outputs as a plan to proceed then type yes at the prompt.