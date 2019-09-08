# Cloud resources configuration

variable "name" {
  type = string

  default = "bitcoin"

  description = <<-DESCRIPTION
    Name of service.
    Used as name prefix when generating hostnames.
  DESCRIPTION
}

variable "servers" {
  type = number

  default = 1

  description = <<-DESCRIPTION
    Count of servers to create.
  DESCRIPTION
}

variable "random_id" {
  type = bool

  default = true

  description = <<-DESCRIPTION
    Appends random id to droplet's name if `true`.
  DESCRIPTION
}

variable "domain" {
  type = string

  default = ""

  description = <<-DESCRIPTION
    Domain name.
    Host will be registered in this domain if non-empty value assigned.
  DESCRIPTION
}

variable "domain_ttl" {
  type = number

  default = 300

  description = <<-DESCRIPTION
    TTL in seconds for domain records.
  DESCRIPTION
}

variable "region" {
  type = string

  description = <<-DESCRIPTION
    Required.
    DigitalOcean region for droplet creation.
  DESCRIPTION
}

variable "ssh_keys" {
  type = list

  default = []

  description = <<-DESCRIPTION
    List of SSH keys registered in DigitalOcean.
    User `root` authorized with this keys.
  DESCRIPTION
}

variable "tags" {
  type = list

  default = []

  description = <<-DESCRIPTION
    List of existing tags for droplet.
  DESCRIPTION
}

variable "size" {
  type = string

  default = "s-2vcpu-4gb"

  description = <<-DESCRIPTION
    Size of droplet.
  DESCRIPTION
}

variable "backups" {
  type = bool

  default = false

  description = <<-DESCRIPTION
    Enable backups feature for droplet.
  DESCRIPTION
}

variable "ipv6" {
  type = bool

  default = false

  description = <<-DESCRIPTION
    Enable IPv6 address on droplet.
  DESCRIPTION
}

variable "private_networking" {
  type = bool

  default = true

  description = <<-DESCRIPTION
    Enable DigitalOcean private networking.
  DESCRIPTION
}

variable "monitoring" {
  type = bool

  default = true

  description = <<-DESCRIPTION
    Enable DigitalOcean monitoring.
  DESCRIPTION
}

variable "volume_size" {
  type = number

  default = 150

  description = <<-DESCRIPTION
    Size of data volume in gigabytes.
    If zero, no volume will be created.
  DESCRIPTION
}

variable "trusted_sources" {
  type = list

  description = <<-DESCRIPTION
    Required.
    IP list to allow SSH and bitcoin rpc connections from.
  DESCRIPTION
}

# Provisioner confiuration

variable "provisioner_username" {
  type = string

  default = "provisioner"

  description = <<-DESCRIPTION
    This user will be added and used inside this module only.
  DESCRIPTION
}

# Service configuration

variable "image" {
  type = string

  default = "parity/parity:v2.5.7-stable"

  description = <<-DESCRIPTION
    Parity docker image tag.
  DESCRIPTION
}

variable "logging" {
  type = string

  default = "info"

  description = <<-DESCRIPTION
    Specify the general logging level:
    - `error`
    - `warn`
    - `info`
    - `debug`
    - `trace`
    It can also be set for a specific module, example: 'sync=debug,rpc=trace'
  DESCRIPTION
}

variable "testnet" {
  type = bool

  default = true

  description = <<-DESCRIPTION
    Use `ropsten` network or main if `false`.
  DESCRIPTION
}

variable "apis" {
  type = list

  default = [
    "web3",
    "eth",
    "pubsub",
    "net",
    "debug",
    "parity",
    "parity_set",
    "parity_pubsub",
    "traces",
    "rpc",
    "shh",
    "shh_pubsub",
  ]

  description = <<-DESCRIPTION
    Specify the APIs available through the HTTP/WebSockets JSON-RPC interface using a list of API names.
    Possible names are:
    - `all`
    - `safe`
    - `debug`
    - `web3`
    - `net`
    - `eth`
    - `pubsub`
    - `personal`
    - `signer`
    - `parity`
    - `parity_pubsub`
    - `parity_accounts`
    - `parity_set`
    - `traces`
    - `rpc`
    - `secretstore`
    - `shh`
    - `shh_pubsub`
    You can also disable a specific API by putting `-` in the front, example: `all,-personal`.
    `safe` - enables the following APIs: `web3`, `net`, `eth`, `pubsub`, `parity`, `parity_pubsub`, `traces`, `rpc`, `shh`, `shh_pubsub`.
  DESCRIPTION
}

variable "jsonrpc_threads" {
  type = number

  default = 4

  description = <<-DESCRIPTION
    Turn on additional processing threads for JSON-RPC servers (all transports).
    Setting this to a non-zero value allows parallel execution of cpu-heavy queries.
  DESCRIPTION
}

variable "ws_origins" {
  type = string

  default = "parity://*,chrome-extension://*,moz-extension://*"

  description = <<-DESCRIPTION
    Specify Origin header values allowed to connect.
    Special options: `all`, `none`.
  DESCRIPTION
}

variable "min_peers" {
  type = number

  default = 25

  description = <<-DESCRIPTION
    Try to maintain at least NUM peers.
  DESCRIPTION
}

variable "max_peers" {
  type = number

  default = 50

  description = <<-DESCRIPTION
    Allow up to NUM peers.
  DESCRIPTION
}

variable "snapshot_peers" {
  type = number

  default = 0

  description = <<-DESCRIPTION
    Allow additional NUM peers for a snapshot sync.
  DESCRIPTION
}

variable "max_pending_peers" {
  type = number

  default = 64

  description = <<-DESCRIPTION
    Allow up to NUM pending connections.
  DESCRIPTION
}

variable "whisper" {
  type = bool

  default = false

  description = <<-DESCRIPTION
    Enable the Whisper network.
  DESCRIPTION
}

variable "whisper_pool_size" {
  type = number

  default = 10

  description = <<-DESCRIPTION
    Target size of the whisper message pool in megabytes.
  DESCRIPTION
}

variable "mode" {
  type = string

  default = "last"

  description = <<-DESCRIPTION
    Set the operating mode. MODE can be one of:
    - `last` - Uses the last-used mode, `active` if none
    - `active` - Parity continuously syncs the chain
    - `passive` - Parity syncs initially, then sleeps and wakes regularly to resync
    - `dark` - Parity syncs only when the JSON-RPC is active
    - `offline` - Parity doesn't sync.
  DESCRIPTION
}

variable "mode_timeout" {
  type = number

  default = 300

  description = <<-DESCRIPTION
    Specify the number of seconds before auto sleep reawake timeout occurs when mode is `passive`.
  DESCRIPTION
}

variable "mode_alarm" {
  type = number

  default = 3600

  description = <<-DESCRIPTION
    Specify the number of seconds before inactivity timeout occurs when mode is `dark` or `passive`.
  DESCRIPTION
}

variable "extra_args" {
  type = list

  default = []

  description = <<-DESCRIPTION
    Parity CLI additional arguments.
  DESCRIPTION
}

variable "tracing" {
  type = string

  default = "auto"

  description = <<-DESCRIPTION
    Indicates if full transaction tracing should be enabled.
    Works only if client had been fully synced with tracing enabled.
    May be one of `auto`, `on`, `off`.
    `auto` uses last used value of this option (`off` if it does not exist).
  DESCRIPTION
}

variable "pruning" {
  type        = string
  default     = "auto"
  description = <<-DESCRIPTION
    Configure pruning of the state/storage trie.
    METHOD may be one of
    - `archive` - keep all state trie data. No pruning.
    - `fast` - maintain journal overlay. Fast but 50MB used.
    - `auto` - use the method most recently synced or default to `fast` if none synced.
  DESCRIPTION
}

variable "pruning_history" {
  type = number

  default = 64

  description = <<-DESCRIPTION
    Set a minimum number of recent states to keep in memory when pruning is active.
  DESCRIPTION
}

variable "pruning_memory" {
  type = number

  default = 32

  description = <<-DESCRIPTION
    The ideal amount of memory in megabytes to use to store recent states.
    As many states as possible will be kept within this limit, and at least `--pruning-history` states will always be kept.
  DESCRIPTION
}

variable "cache_size_db" {
  type = number

  default = 128

  description = <<-DESCRIPTION
    Override database cache size.
  DESCRIPTION
}

variable "cache_size_blocks" {
  type = number

  default = 8

  description = <<-DESCRIPTION
    Specify the preferred size of the blockchain cache in megabytes.
  DESCRIPTION
}

variable "cache_size_queue" {
  type = number

  default = 40

  description = <<-DESCRIPTION
    Specify the maximum size of memory to use for block queue.
  DESCRIPTION
}

variable "cache_size_state" {
  type = number

  default = 25

  description = <<-DESCRIPTION
    Specify the maximum size of memory to use for the state cache.
  DESCRIPTION
}

variable "fat_db" {
  type = string

  default = "auto"

  description = <<-DESCRIPTION
    Build appropriate information to allow enumeration of all accounts and storage keys.
    Doubles the size of the state database.
    May be one of `on`, `off` or `auto`.
  DESCRIPTION
}

variable "cache_size" {
  type = number

  default = 128

  description = <<-DESCRIPTION
    Set total amount of discretionary memory to use for the entire system, overrides other cache and queue options.
  DESCRIPTION
}

# Exporter configuration

variable "ethereum_exporter" {
  type        = bool
  default     = true
  description = <<-DESCRIPTION
    Installs ethereum-exporter.
  DESCRIPTION
}
