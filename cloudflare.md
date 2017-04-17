# Cloudflare

curl or [cli4](https://github.com/cloudflare/python-cloudflare#cli)

    curl --header "X-Auth-Email: your.name@example.org" \
         --header "X-Auth-Key: your_api_key" \
         https://api.cloudflare.com/client/v4/zones?per_page=1000

also environmental variables can be used

    `CF_API_EMAIL=your.name@example.org CF_API_KEY=your_api_key cli4 /zones`

## Zones

### List

    curl https://api.cloudflare.com/client/v4/zones
    cli4 /zones

### DNS

    curl https://api.cloudflare.com/client/v4/zones/your_zone_internal_id/dns_records
    cli4 /zones/:example.org/dns_records
