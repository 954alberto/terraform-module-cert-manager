## Providers

| Name | Version |
|------|---------|
| helm | n/a |
| kubernetes | n/a |
| template | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| cert\_manager\_helm\_values | Helm values for cert manager chart. | `any` | n/a | yes |
| chart\_repository | The repository name to download the chart | `any` | n/a | yes |
| chart\_version | Version of the chart to install | `any` | n/a | yes |
| email | email address for requests | `any` | n/a | yes |
| init\_chart\_version | Version of the init chart to install | `any` | n/a | yes |
| issuer\_dns | Enable or disable DNS challange Cluster Issuer | `any` | n/a | yes |
| name | Name of the Helm release | `any` | n/a | yes |
| namespace | Namespace of the Helm release | `any` | n/a | yes |
| route53\_role\_arn | The arn of a role with permissions to update route53 for the hosted zone | `any` | n/a | yes |
| zone | List of zones | `any` | n/a | yes |

## Outputs

No output.

