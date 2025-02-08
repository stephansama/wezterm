---@class TlsDomainClient
---@field name String
-- The name of this specific domain.  Must be unique amongst
-- all types of domain in the configuration file.
---@field bootstrap_via_ssh String
-- If set, use ssh to connect, start the server, and obtain
-- a certificate.
-- The value is "user@host:port", just like "wezterm ssh" accepts.
---@field remote_address String
-- identifies the host:port pair of the remote server.
---@field pem_private_key PathBuf
-- the path to an x509 PEM encoded private key file
---@field pem_cert PathBuf
-- the path to an x509 PEM encoded certificate file
---@field pem_ca PathBuf
-- the path to an x509 PEM encoded CA chain file
---@field pem_root_certs PathBuf[]
-- A set of paths to load additional CA certificates.
-- Each entry can be either the path to a directory or to a PEM encoded
-- CA file.  If an entry is a directory, then its contents will be
-- loaded as CA certs and added to the trust store.
---@field accept_invalid_hostnames bool
-- explicitly control whether the client checks that the certificate
-- presented by the server matches the hostname portion of
-- `remote_address`.  The default is true.  This option is made
-- available for troubleshooting purposes and should not be used outside
-- of a controlled environment as it weakens the security of the TLS
-- channel.
---@field expected_cn String
-- the hostname string that we expect to match against the common name
-- field in the certificate presented by the server.  This defaults to
-- the hostname portion of the `remote_address` configuration and you
-- should not normally need to override this value.
---@field connect_automatically bool
-- If true, connect to this domain automatically at startup
---@field read_timeout Duration
---@field write_timeout Duration
---@field local_echo_threshold_ms u64
-- The path to the wezterm binary on the remote host
---@field remote_wezterm_path String
-- Show time since last response when waiting for a response.
-- It is recommended to use
-- <https://wezfurlong.org/wezterm/config/lua/pane/get_metadata.html#since_last_response_ms>
-- instead.
---@field overlay_lag_indicator bool
