# Ethereum Parity

- Creates virtual server(s) with docker
- Creates cloud volume(s) and mount to /srv
- Register server(s) in domain `var.domain`
- Creates cloud firewall and apply network policy to server(s)
- Deploy parity in `/srv/ethereum`

## Components

_Parity_ the most advanced Ethereum client, to Polkadot, the next-generation interoperable blockchain network.

- [Official website](https://www.parity.io/)
- [Docker image](https://hub.docker.com/r/parity/parity)

## Cloud resources

- DigitalOcean droplet
- DigitalOcean volume
- DigitalOcean cloud firewall

## Default firewall rules

### Incoming

- Allow SSH from `var.trusted_sources`

### Outgoing

- Allow tcp to world
- Allow udp to world
- Allow icmp to world
