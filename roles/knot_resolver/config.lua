modules = {
    'policy',
    hints = '/etc/hosts',
    predict = {
        window = 15, -- 15 minutes sampling window
        period = 6*(60/15) -- track last 6 hours
    },
    'stats',
    {% if knot_resolver_enable_http_server %}
    http = {
        host = '127.0.0.1',
        port = 8053,
    }
    {% endif %}
}

net = { '127.0.0.1' }

-- VPN specific DNS
{% if knot_resolver_custom_servers %}
local custom_servers = {
    {% for ip, servers in knot_resolver_custom_servers.items() %}
    ['{{ ip }}'] = {
        {% for server in servers %}
        '{{ server }}',
        {% endfor %}
    },
    {% endfor %}
}
for server, domains in pairs(custom_servers) do
    for _, domain in pairs(domains) do
        log('Resolving %s with %s', domain, server)
        policy.add(policy.suffix(policy.STUB(server), {todname(domain)}))
    end
end
{% endif %}

-- Fallback to Cloudflare TLS
policy.add(
    policy.all(
        policy.TLS_FORWARD({
            {'1.1.1.1', hostname='1.1.1.1'}
        })
    )
)
