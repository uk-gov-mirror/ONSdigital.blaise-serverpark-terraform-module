terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "0.1.1"
    }
  }
}

data "azuredevops_project" "csharp" {
  name = "csharp"
}

resource "azuredevops_variable_group" "variablegroup" {
  project_id   = data.azuredevops_project.csharp.id
  name         = var.azure_agent_envname
  description  = "Variable group for ${var.azure_agent_envname}"
  allow_access = true

  variable {
    name  = "ENV_BLAISE_SERVER_HOST_NAME"
    value = "value"
  }
  variable {
    name  = "ENV_BLAISE_ADMIN_USER"
    value = var.blaise_admin_username
  }
  variable {
    name         = "ENV_BLAISE_ADMIN_PASSWORD"
    secret_value = random_password.blaise_admin_password.result
    is_secret    = true
  }
  variable {
    name  = "ENV_BLAISE_SERVER_BINDING"
    value = "value"
  }
  variable {
    name  = "ENV_BLAISE_CONNECTION_PORT"
    value = "value"
  }
  variable {
    name  = "ENV_BLAISE_REMOTE_CONNECTION_PORT"
    value = "value"
  }
  variable {
    name  = "ENV_LIBRARY_DIRECTORY"
    value = "value"
  }
  variable {
    name  = "ENV_CONNECTION_EXPIRES_IN_MINUTES"
    value = "value"
  }
  variable {
    name  = "ENV_BLAISE_GCP_BUCKET"
    value = var.blaise_install_distributables_bucket
  }
  variable {
    name  = "ENV_RESTAPI_URL"
    value = "value"
  }
  variable {
    name  = "ENV_TOBI_URL"
    value = "https://tobi-ui-dot-${var.project_id}.nw.r.appspot.com/"
  }
  variable {
    name  = "ENV_DQS_URL"
    value = "https://dqs-ui-dot-${var.project_id}.nw.r.appspot.com/"
  }
}