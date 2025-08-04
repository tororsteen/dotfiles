SPACESHIP_PROMPT_ORDER=(
  time           # Time stamps section
  user           # Username sectionon
  host           # Hostname section
  battery        # Battery level and status
  dir            # Current directory section
  git            # Git section (git_branch + git_status)
  hg             # Mercurial section (hg_branch  + hg_status)
  package        # Package version
  node           # Node.js section
  bun            # Bun section
  deno           # Deno section
  ruby           # Ruby section
  python         # Python section
  elm            # Elm section
  elixir         # Elixir section
  xcode          # Xcode section
  xcenv          # xcenv section
  swift          # Swift section
  swiftenv       # swiftenv section
  golang         # Go section
  perl           # Perl section
  php            # PHP section
  rust           # Rust section
  haskell        # Haskell Stack section
  scala          # Scala section
  kotlin         # Kotlin section
  java           # Java section
  lua            # Lua section
  dart           # Dart section
  julia          # Julia section
  crystal        # Crystal section
  docker         # Docker section
  docker_compose # Docker section
  aws            # Amazon Web Services section
  gcloud         # Google Cloud Platform section
  azure          # Azure section
  venv           # virtualenv section
  conda          # conda virtualenv section
  uv             # uv section
  dotnet         # .NET section
  ocaml          # OCaml section
  vlang          # V section
  zig            # Zig section
  purescript     # PureScript section
  erlang         # Erlang section
  gleam          # Gleam section
  kubectl        # Kubectl context section
  ansible        # Ansible section
  terraform      # Terraform workspace section
  pulumi         # Pulumi stack section
  ibmcloud       # IBM Cloud section
  nix_shell      # Nix shell
  gnu_screen     # GNU Screen section
  exec_time      # Execution time
  async          # Async jobs indicator
  line_sep       # Line break
  jobs           # Background jobs indicator
  exit_code      # Exit code section
  sudo           # Sudo indicator
  char           # Prompt character
)

# Ei linje
SPACESHIP_PROMPT_ADD_NEWLINE='false'

# Vis klokke
SPACESHIP_TIME_SHOW='true'

# Vis brukernavn i grønt
SPACESHIP_USER_SHOW='always'
SPACESHIP_USER_COLOR='green'
SPACESHIP_USER_PREFIX='som '
SPACESHIP_USER_COLOR_ROOT='red'

# Viser navnet til maskinen
SPACESHIP_HOST_SHOW="always"
SPACESHIP_HOST_PREFIX="på "

# Vis full sti
SPACESHIP_DIR_TRUNC_REPO='false'
SPACESHIP_DIR_TRUNC=0
SPACESHIP_DIR_PREFIX='i '
SPACESHIP_DIR_SUFFIX="  "

#Vis batteristatus
SPACESHIP_BATTERY_SHOW='always'
SPACESHIP_BATTERY_ASYNC='true'
SPACESHIP_BATTERY_PREFIX='Bat '
SPACESHIP_BATTERY_THRESHOLD=100
