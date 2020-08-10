cat << EOF > main.tf
provider "aci" {
    username              = ""
    password              = ""
    url                   = ""
    insecure              = true
    }

module "my_tenant" {
    source                = "../modules/tenant"
    tenant                = "mod_pod26"
    }

module "my_vrf" {
    source                = "../modules/vrf"
    vrf                   = "pn_26"
    tenant_id             = "\${module.my_tenant.tenant_id}"
    }

module "my_bd_app" {
    source                = "../modules/bd"
    bd                    = "pod26_app"
    ip                    = "5.1.1.1/24"
    tenant_id             = "\${module.my_tenant.tenant_id}"
    vrf_id                = "\${module.my_vrf.vrf_id}"
    }

module "my_bd_web" {
    source                = "../modules/bd"
    bd                    = "pod26_web"
    ip                    = "6.1.1.1/24"
    tenant_id             = "\${module.my_tenant.tenant_id}"
    vrf_id                = "\${module.my_vrf.vrf_id}"
    }
EOF
