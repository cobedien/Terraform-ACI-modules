resource "aci_tenant" "tenant" {
    name                  = var.tenant
    }

output "tenant_id" {
    value = "\${aci_tenant.tenant.id}"
    }
