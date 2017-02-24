# Cloudflare

curl or [cli4](https://github.com/cloudflare/python-cloudflare#cli)

    curl --header "X-Auth-Key: your_api_key" \
         --header "X-Auth-Email: your.name@example.org" \
         https://api.cloudflare.com/client/v4/zones
    `CF_API_EMAIL=your.name@example.org CF_API_KEY=your_api_key cli4 /zones`

## Zones

### List

    curl https://api.cloudflare.com/client/v4/zones
    cli4 /zones

### DNS

    curl https://api.cloudflare.com/client/v4/zones/your_zone_internal_id/dns_records
    cli4 /zones/:example.org/dns_records
