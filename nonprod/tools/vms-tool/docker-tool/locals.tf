locals{
      location            = data.terraform_remote_state.organization.outputs.location
      resource_group_name = data.terraform_remote_state.organization.outputs.resource_group_name
      project             = data.terraform_remote_state.organization.outputs.project
      app                 = "docker-tool"
      environment         = data.terraform_remote_state.organization.outputs.environment
      default_username    = data.terraform_remote_state.organization.outputs.default_username
      ssh_publicKey       = data.terraform_remote_state.organization.outputs.ssh-key
}