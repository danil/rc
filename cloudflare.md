# Cloudflare

    curl --header "X-Auth-Key: your_api_key" \
         --header "X-Auth-Email: your.name@example.org" \
         https://api.cloudflare.com/client/v4/zones

## Zones

### List

    curl https://api.cloudflare.com/client/v4/zones

### DNS

    curl https://api.cloudflare.com/client/v4/zones/your_zone_internal_id/dns_records
