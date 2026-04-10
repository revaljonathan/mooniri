'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  [[ $ZSH_VERSION == (5.<1->*|<6->.*) ]] || return

  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    context
    #os_icon                 # os identifier
    dir                     # current directory
    vcs                     # git status
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status                  # exit code of the last command
    command_execution_time  # duration of the last command
    background_jobs         # presence of background jobs
    direnv                  # direnv status (https://direnv.net/)
    asdf                    # asdf version manager (https://github.com/asdf-vm/asdf)
    virtualenv              # python virtual environment (https://docs.python.org/3/library/venv.html)
    anaconda                # conda environment (https://conda.io/)
    pyenv                   # python environment (https://github.com/pyenv/pyenv)
    goenv                   # go environment (https://github.com/syndbg/goenv)
    nodenv                  # node.js version from nodenv (https://github.com/nodenv/nodenv)
    nvm                     # node.js version from nvm (https://github.com/nvm-sh/nvm)
    nodeenv                 # node.js environment (https://github.com/ekalinin/nodeenv)
    rbenv                   # ruby version from rbenv (https://github.com/rbenv/rbenv)
    rvm                     # ruby version from rvm (https://rvm.io)
    fvm                     # flutter version management (https://github.com/leoafarias/fvm)
    luaenv                  # lua version from luaenv (https://github.com/cehoffman/luaenv)
    jenv                    # java version from jenv (https://github.com/jenv/jenv)
    plenv                   # perl version from plenv (https://github.com/tokuhirom/plenv)
    perlbrew                # perl version from perlbrew (https://github.com/gugod/App-perlbrew)
    phpenv                  # php version from phpenv (https://github.com/phpenv/phpenv)
    scalaenv                # scala version from scalaenv (https://github.com/scalaenv/scalaenv)
    haskell_stack           # haskell version from stack (https://haskellstack.org/)
    kubecontext             # current kubernetes context (https://kubernetes.io/)
    terraform               # terraform workspace (https://www.terraform.io)
    aws                     # aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
    aws_eb_env              # aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/)
    azure                   # azure account name (https://docs.microsoft.com/en-us/cli/azure)
    gcloud                  # google cloud cli account and project (https://cloud.google.com/)
    google_app_cred         # google application credentials (https://cloud.google.com/docs/authentication/production)
    toolbox                 # toolbox name (https://github.com/containers/toolbox)                 # user@hostname
    nordvpn                 # nordvpn connection status, linux only (https://nordvpn.com/)
    ranger                  # ranger shell (https://github.com/ranger/ranger)
    yazi                    # yazi shell (https://github.com/sxyazi/yazi)
    nnn                     # nnn shell (https://github.com/jarun/nnn)
    lf                      # lf shell (https://github.com/gokcehan/lf)
    xplr                    # xplr shell (https://github.com/sayanarijit/xplr)
    vim_shell               # vim shell indicator (:sh)
    midnight_commander      # midnight commander shell (https://midnight-commander.org/)
    nix_shell               # nix shell (https://nixos.org/nixos/nix-pills/developing-with-nix-shell.html)
    chezmoi_shell           # chezmoi shell (https://www.chezmoi.io/)
    vi_mode                 # vi mode (you don't need this if you've enabled prompt_char)
    todo                    # todo items (https://github.com/todotxt/todo.txt-cli)
    timewarrior             # timewarrior tracking status (https://timewarrior.net/)
    taskwarrior             # taskwarrior task count (https://taskwarrior.org/)
    per_directory_history   # Oh My Zsh per-directory-history local/global indicator
    time                    # current time
  )

 # Core colors
typeset -g P10K_COLOR_BASE="#222436"     # bg
typeset -g P10K_COLOR_MANTLE="#1e2030"   # bg_dark
typeset -g P10K_COLOR_CRUST="#191b29"    # bg_dark1

# Text and Subtext
typeset -g P10K_COLOR_TEXT="#c8d3f5"     # fg
typeset -g P10K_COLOR_SUBTEXT1="#828bb8" # fg_dark
typeset -g P10K_COLOR_SUBTEXT0="#636da6" # comment

# Overlays
typeset -g P10K_COLOR_OVERLAY2="#737aa2" # dark5
typeset -g P10K_COLOR_OVERLAY1="#545c7e" # dark3
typeset -g P10K_COLOR_OVERLAY0="#444a73" # terminal_black

# Surfaces
typeset -g P10K_COLOR_SURFACE2="#394b70" # blue7
typeset -g P10K_COLOR_SURFACE1="#3b4261" # fg_gutter
typeset -g P10K_COLOR_SURFACE0="#2f334d" # bg_highlight

# Accent colors
typeset -g P10K_COLOR_BLUE="#82aaff"     # blue
typeset -g P10K_COLOR_LAVENDER="#c099ff" # magenta
typeset -g P10K_COLOR_SAPPHIRE="#0db9d7" # blue2
typeset -g P10K_COLOR_SKY="#86e1fc"      # cyan
typeset -g P10K_COLOR_TEAL="#4fd6be"     # teal / green1
typeset -g P10K_COLOR_GREEN="#c3e88d"    # green
typeset -g P10K_COLOR_YELLOW="#ffc777"   # yellow
typeset -g P10K_COLOR_PEACH="#ff966c"    # orange
typeset -g P10K_COLOR_RED="#ff757f"      # red
typeset -g P10K_COLOR_MAROON="#c53b53"   # red1
typeset -g P10K_COLOR_PINK="#fca7ea"     # purple
typeset -g P10K_COLOR_FLAMINGO="#b4f9f8" # blue6
typeset -g P10K_COLOR_ROSEWATER="#89ddff" # blue5
typeset -g P10K_COLOR_MAUVE="#65bcff"    # blue1


  typeset -g POWERLEVEL9K_MODE=nerdfont-v3
  typeset -g POWERLEVEL9K_ICON_PADDING=moderate

  typeset -g POWERLEVEL9K_ICON_BEFORE_CONTENT=

  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

  # Border/connector lines use OVERLAY0 (muted dark gray)
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%F{${P10K_COLOR_OVERLAY0}}╭─"
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX="%F{${P10K_COLOR_OVERLAY0}}├─"
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%F{${P10K_COLOR_OVERLAY0}}╰─"
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX="%F{${P10K_COLOR_OVERLAY0}}─╮"
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX="%F{${P10K_COLOR_OVERLAY0}}─┤"
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX="%F{${P10K_COLOR_OVERLAY0}}─╯"

  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR=' '
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_BACKGROUND=
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_GAP_BACKGROUND=
  if [[ $POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_CHAR != ' ' ]]; then
    typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_GAP_FOREGROUND=$P10K_COLOR_OVERLAY0
    typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_FIRST_SEGMENT_END_SYMBOL='%{%}'
    typeset -g POWERLEVEL9K_EMPTY_LINE_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='%{%}'
  fi

  typeset -g POWERLEVEL9K_BACKGROUND=$P10K_COLOR_SURFACE0

  # Subsegment separators use OVERLAY1 (slightly lighter muted gray)
  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR="%F{${P10K_COLOR_OVERLAY1}}\uE0B1"
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR="%F{${P10K_COLOR_OVERLAY1}}\uE0B3"
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'

  typeset -g POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B0'
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B2'
  typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0B6'
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0B4'
  typeset -g POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=

  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=$P10K_COLOR_TEXT

  typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=$P10K_COLOR_GREEN
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=$P10K_COLOR_RED
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='V'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_{LEFT,RIGHT}_WHITESPACE=

  typeset -g POWERLEVEL9K_DIR_FOREGROUND=$P10K_COLOR_BLUE
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=$P10K_COLOR_LAVENDER
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=$P10K_COLOR_SKY
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  local anchor_files=(
    .bzr
    .citc
    .git
    .hg
    .node-version
    .python-version
    .go-version
    .ruby-version
    .lua-version
    .java-version
    .perl-version
    .php-version
    .tool-versions
    .mise.toml
    .shorten_folder_marker
    .svn
    .terraform
    CVS
    Cargo.toml
    composer.json
    go.mod
    package.json
    stack.yaml
  )
  typeset -g POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
  typeset -g POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
  typeset -g POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
  typeset -g POWERLEVEL9K_DIR_HYPERLINK=false

  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3


  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON='\uF126 '

  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

  function my_git_formatter() {
    emulate -L zsh

    if [[ -n $P9K_CONTENT ]]; then
      typeset -g my_git_format=$P9K_CONTENT
      return
    fi

    if (( $1 )); then
      local       meta="%F{${P10K_COLOR_OVERLAY2}}"  # muted gray
      local      clean="%F{${P10K_COLOR_GREEN}}"      # green
      local   modified="%F{${P10K_COLOR_YELLOW}}"     # yellow
      local  untracked="%F{${P10K_COLOR_SKY}}"        # sky blue
      local conflicted="%F{${P10K_COLOR_RED}}"        # red
    else
      local       meta="%F{${P10K_COLOR_OVERLAY1}}"
      local      clean="%F{${P10K_COLOR_OVERLAY1}}"
      local   modified="%F{${P10K_COLOR_OVERLAY1}}"
      local  untracked="%F{${P10K_COLOR_OVERLAY1}}"
      local conflicted="%F{${P10K_COLOR_OVERLAY1}}"
    fi

    local res

    if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
      local branch=${(V)VCS_STATUS_LOCAL_BRANCH}
      (( $#branch > 32 )) && branch[13,-13]="…"  # <-- this line
      res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}${branch//\%/%%}"
    fi

    if [[ -n $VCS_STATUS_TAG
          && -z $VCS_STATUS_LOCAL_BRANCH  # <-- this line
        ]]; then
      local tag=${(V)VCS_STATUS_TAG}
      (( $#tag > 32 )) && tag[13,-13]="…"  # <-- this line
      res+="${meta}#${clean}${tag//\%/%%}"
    fi

    [[ -z $VCS_STATUS_LOCAL_BRANCH && -z $VCS_STATUS_TAG ]] &&  # <-- this line
      res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

    if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
      res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"
    fi

    if [[ $VCS_STATUS_COMMIT_SUMMARY == (|*[^[:alnum:]])(wip|WIP)(|[^[:alnum:]]*) ]]; then
      res+=" ${modified}wip"
    fi

    if (( VCS_STATUS_COMMITS_AHEAD || VCS_STATUS_COMMITS_BEHIND )); then
      (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
      (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
      (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
    elif [[ -n $VCS_STATUS_REMOTE_BRANCH ]]; then
    fi

    (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
    (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
    (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
    (( VCS_STATUS_STASHES        )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
    [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
    (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
    (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
    (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
    (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"
    (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"

    typeset -g my_git_format=$res
  }
  functions -M my_git_formatter 2>/dev/null

  typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1

  typeset -g POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'

  typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
  typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter(1)))+${my_git_format}}'
  typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION='${$((my_git_formatter(0)))+${my_git_format}}'
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

  typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_COLOR=$P10K_COLOR_GREEN
  typeset -g POWERLEVEL9K_VCS_LOADING_VISUAL_IDENTIFIER_COLOR=$P10K_COLOR_OVERLAY1

  typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=$P10K_COLOR_GREEN
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=$P10K_COLOR_GREEN
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=$P10K_COLOR_YELLOW

  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true

  typeset -g POWERLEVEL9K_STATUS_OK=true
  typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=$P10K_COLOR_GREEN
  typeset -g POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'

  typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=$P10K_COLOR_GREEN
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'

  typeset -g POWERLEVEL9K_STATUS_ERROR=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=$P10K_COLOR_RED
  typeset -g POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'

  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=$P10K_COLOR_RED
  typeset -g POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='✘'

  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=$P10K_COLOR_RED
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='✘'

  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=$P10K_COLOR_SUBTEXT0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'

  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=$P10K_COLOR_TEAL

  typeset -g POWERLEVEL9K_DIRENV_FOREGROUND=$P10K_COLOR_YELLOW

  typeset -g POWERLEVEL9K_ASDF_FOREGROUND=$P10K_COLOR_TEAL

  typeset -g POWERLEVEL9K_ASDF_SOURCES=(shell local global)

  typeset -g POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW=false

  typeset -g POWERLEVEL9K_ASDF_SHOW_SYSTEM=true

  typeset -g POWERLEVEL9K_ASDF_SHOW_ON_UPGLOB=

  typeset -g POWERLEVEL9K_ASDF_RUBY_FOREGROUND=$P10K_COLOR_MAROON

  typeset -g POWERLEVEL9K_ASDF_PYTHON_FOREGROUND=$P10K_COLOR_TEAL

  typeset -g POWERLEVEL9K_ASDF_GOLANG_FOREGROUND=$P10K_COLOR_TEAL

  typeset -g POWERLEVEL9K_ASDF_NODEJS_FOREGROUND=$P10K_COLOR_GREEN

  typeset -g POWERLEVEL9K_ASDF_RUST_FOREGROUND=$P10K_COLOR_PEACH

  typeset -g POWERLEVEL9K_ASDF_DOTNET_CORE_FOREGROUND=$P10K_COLOR_MAUVE

  typeset -g POWERLEVEL9K_ASDF_FLUTTER_FOREGROUND=$P10K_COLOR_SKY

  typeset -g POWERLEVEL9K_ASDF_LUA_FOREGROUND=$P10K_COLOR_SAPPHIRE

  typeset -g POWERLEVEL9K_ASDF_JAVA_FOREGROUND=$P10K_COLOR_SAPPHIRE

  typeset -g POWERLEVEL9K_ASDF_PERL_FOREGROUND=$P10K_COLOR_LAVENDER

  typeset -g POWERLEVEL9K_ASDF_ERLANG_FOREGROUND=$P10K_COLOR_MAROON

  typeset -g POWERLEVEL9K_ASDF_ELIXIR_FOREGROUND=$P10K_COLOR_MAUVE

  typeset -g POWERLEVEL9K_ASDF_POSTGRES_FOREGROUND=$P10K_COLOR_SAPPHIRE

  typeset -g POWERLEVEL9K_ASDF_PHP_FOREGROUND=$P10K_COLOR_MAUVE

  typeset -g POWERLEVEL9K_ASDF_HASKELL_FOREGROUND=$P10K_COLOR_PEACH

  typeset -g POWERLEVEL9K_ASDF_JULIA_FOREGROUND=$P10K_COLOR_GREEN

  typeset -g POWERLEVEL9K_NORDVPN_FOREGROUND=$P10K_COLOR_SKY
  typeset -g POWERLEVEL9K_NORDVPN_{DISCONNECTED,CONNECTING,DISCONNECTING}_CONTENT_EXPANSION=
  typeset -g POWERLEVEL9K_NORDVPN_{DISCONNECTED,CONNECTING,DISCONNECTING}_VISUAL_IDENTIFIER_EXPANSION=

  typeset -g POWERLEVEL9K_RANGER_FOREGROUND=$P10K_COLOR_YELLOW

  typeset -g POWERLEVEL9K_YAZI_FOREGROUND=$P10K_COLOR_YELLOW

  typeset -g POWERLEVEL9K_NNN_FOREGROUND=$P10K_COLOR_TEAL

  typeset -g POWERLEVEL9K_LF_FOREGROUND=$P10K_COLOR_TEAL

  typeset -g POWERLEVEL9K_XPLR_FOREGROUND=$P10K_COLOR_TEAL

  typeset -g POWERLEVEL9K_VIM_SHELL_FOREGROUND=$P10K_COLOR_GREEN

  typeset -g POWERLEVEL9K_MIDNIGHT_COMMANDER_FOREGROUND=$P10K_COLOR_YELLOW

  typeset -g POWERLEVEL9K_NIX_SHELL_FOREGROUND=$P10K_COLOR_SAPPHIRE

  typeset -g POWERLEVEL9K_CHEZMOI_SHELL_FOREGROUND=$P10K_COLOR_BLUE

  typeset -g POWERLEVEL9K_DISK_USAGE_NORMAL_FOREGROUND=$P10K_COLOR_TEAL
  typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_FOREGROUND=$P10K_COLOR_YELLOW
  typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_FOREGROUND=$P10K_COLOR_RED
  typeset -g POWERLEVEL9K_DISK_USAGE_WARNING_LEVEL=90
  typeset -g POWERLEVEL9K_DISK_USAGE_CRITICAL_LEVEL=95
  typeset -g POWERLEVEL9K_DISK_USAGE_ONLY_WARNING=false

  typeset -g POWERLEVEL9K_VI_COMMAND_MODE_STRING=NORMAL
  typeset -g POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND=$P10K_COLOR_GREEN
  typeset -g POWERLEVEL9K_VI_VISUAL_MODE_STRING=VISUAL
  typeset -g POWERLEVEL9K_VI_MODE_VISUAL_FOREGROUND=$P10K_COLOR_BLUE
  typeset -g POWERLEVEL9K_VI_OVERWRITE_MODE_STRING=OVERTYPE
  typeset -g POWERLEVEL9K_VI_MODE_OVERWRITE_FOREGROUND=$P10K_COLOR_PEACH
  typeset -g POWERLEVEL9K_VI_INSERT_MODE_STRING=
  typeset -g POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND=$P10K_COLOR_TEAL

  typeset -g POWERLEVEL9K_RAM_FOREGROUND=$P10K_COLOR_TEAL

  typeset -g POWERLEVEL9K_SWAP_FOREGROUND=$P10K_COLOR_MAUVE

  typeset -g POWERLEVEL9K_LOAD_WHICH=5
  typeset -g POWERLEVEL9K_LOAD_NORMAL_FOREGROUND=$P10K_COLOR_TEAL
  typeset -g POWERLEVEL9K_LOAD_WARNING_FOREGROUND=$P10K_COLOR_YELLOW
  typeset -g POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND=$P10K_COLOR_PEACH

  typeset -g POWERLEVEL9K_TODO_FOREGROUND=$P10K_COLOR_SKY
  typeset -g POWERLEVEL9K_TODO_HIDE_ZERO_TOTAL=true
  typeset -g POWERLEVEL9K_TODO_HIDE_ZERO_FILTERED=false

  typeset -g POWERLEVEL9K_TIMEWARRIOR_FOREGROUND=$P10K_COLOR_SKY
  typeset -g POWERLEVEL9K_TIMEWARRIOR_CONTENT_EXPANSION='${P9K_CONTENT:0:24}${${P9K_CONTENT:24}:+…}'

  typeset -g POWERLEVEL9K_TASKWARRIOR_FOREGROUND=$P10K_COLOR_SAPPHIRE

  typeset -g POWERLEVEL9K_PER_DIRECTORY_HISTORY_LOCAL_FOREGROUND=$P10K_COLOR_MAUVE
  typeset -g POWERLEVEL9K_PER_DIRECTORY_HISTORY_GLOBAL_FOREGROUND=$P10K_COLOR_PEACH

  typeset -g POWERLEVEL9K_CPU_ARCH_FOREGROUND=$P10K_COLOR_PEACH

  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=$P10K_COLOR_YELLOW
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_FOREGROUND=$P10K_COLOR_PEACH
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=$P10K_COLOR_PEACH

  typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%B%n@%m'
  typeset -g POWERLEVEL9K_CONTEXT_{REMOTE,REMOTE_SUDO}_TEMPLATE='%n@%m'
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'

  typeset -g POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=

  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=$P10K_COLOR_TEAL
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=false
  typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=

  typeset -g POWERLEVEL9K_ANACONDA_FOREGROUND=$P10K_COLOR_TEAL

  typeset -g POWERLEVEL9K_ANACONDA_CONTENT_EXPANSION='${${${${CONDA_PROMPT_MODIFIER#\(}% }%\)}:-${CONDA_PREFIX:t}}'

  typeset -g POWERLEVEL9K_PYENV_FOREGROUND=$P10K_COLOR_TEAL
  typeset -g POWERLEVEL9K_PYENV_SOURCES=(shell local global)
  typeset -g POWERLEVEL9K_PYENV_PROMPT_ALWAYS_SHOW=false
  typeset -g POWERLEVEL9K_PYENV_SHOW_SYSTEM=true

  typeset -g POWERLEVEL9K_PYENV_CONTENT_EXPANSION='${P9K_CONTENT}${${P9K_CONTENT:#$P9K_PYENV_PYTHON_VERSION(|/*)}:+ $P9K_PYENV_PYTHON_VERSION}'

  typeset -g POWERLEVEL9K_GOENV_FOREGROUND=$P10K_COLOR_TEAL
  typeset -g POWERLEVEL9K_GOENV_SOURCES=(shell local global)
  typeset -g POWERLEVEL9K_GOENV_PROMPT_ALWAYS_SHOW=false
  typeset -g POWERLEVEL9K_GOENV_SHOW_SYSTEM=true

  typeset -g POWERLEVEL9K_NODENV_FOREGROUND=$P10K_COLOR_GREEN
  typeset -g POWERLEVEL9K_NODENV_SOURCES=(shell local global)
  typeset -g POWERLEVEL9K_NODENV_PROMPT_ALWAYS_SHOW=false
  typeset -g POWERLEVEL9K_NODENV_SHOW_SYSTEM=true

  typeset -g POWERLEVEL9K_NVM_FOREGROUND=$P10K_COLOR_GREEN
  typeset -g POWERLEVEL9K_NVM_PROMPT_ALWAYS_SHOW=false
  typeset -g POWERLEVEL9K_NVM_SHOW_SYSTEM=true

  typeset -g POWERLEVEL9K_NODEENV_FOREGROUND=$P10K_COLOR_GREEN
  typeset -g POWERLEVEL9K_NODEENV_SHOW_NODE_VERSION=false
  typeset -g POWERLEVEL9K_NODEENV_{LEFT,RIGHT}_DELIMITER=

  typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=$P10K_COLOR_GREEN
  typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true

  typeset -g POWERLEVEL9K_GO_VERSION_FOREGROUND=$P10K_COLOR_TEAL
  typeset -g POWERLEVEL9K_GO_VERSION_PROJECT_ONLY=true

  typeset -g POWERLEVEL9K_RUST_VERSION_FOREGROUND=$P10K_COLOR_PEACH
  typeset -g POWERLEVEL9K_RUST_VERSION_PROJECT_ONLY=true

  typeset -g POWERLEVEL9K_DOTNET_VERSION_FOREGROUND=$P10K_COLOR_MAUVE
  typeset -g POWERLEVEL9K_DOTNET_VERSION_PROJECT_ONLY=true

  typeset -g POWERLEVEL9K_PHP_VERSION_FOREGROUND=$P10K_COLOR_MAUVE
  typeset -g POWERLEVEL9K_PHP_VERSION_PROJECT_ONLY=true

  typeset -g POWERLEVEL9K_LARAVEL_VERSION_FOREGROUND=$P10K_COLOR_RED

  typeset -g POWERLEVEL9K_JAVA_VERSION_FOREGROUND=$P10K_COLOR_SAPPHIRE
  typeset -g POWERLEVEL9K_JAVA_VERSION_PROJECT_ONLY=true
  typeset -g POWERLEVEL9K_JAVA_VERSION_FULL=false

  typeset -g POWERLEVEL9K_PACKAGE_FOREGROUND=$P10K_COLOR_SKY

  typeset -g POWERLEVEL9K_RBENV_FOREGROUND=$P10K_COLOR_MAROON
  typeset -g POWERLEVEL9K_RBENV_SOURCES=(shell local global)
  typeset -g POWERLEVEL9K_RBENV_PROMPT_ALWAYS_SHOW=false
  typeset -g POWERLEVEL9K_RBENV_SHOW_SYSTEM=true

  typeset -g POWERLEVEL9K_RVM_FOREGROUND=$P10K_COLOR_MAROON
  typeset -g POWERLEVEL9K_RVM_SHOW_GEMSET=false
  typeset -g POWERLEVEL9K_RVM_SHOW_PREFIX=false

  typeset -g POWERLEVEL9K_FVM_FOREGROUND=$P10K_COLOR_SKY

  typeset -g POWERLEVEL9K_LUAENV_FOREGROUND=$P10K_COLOR_SAPPHIRE
  typeset -g POWERLEVEL9K_LUAENV_SOURCES=(shell local global)
  typeset -g POWERLEVEL9K_LUAENV_PROMPT_ALWAYS_SHOW=false
  typeset -g POWERLEVEL9K_LUAENV_SHOW_SYSTEM=true

  typeset -g POWERLEVEL9K_JENV_FOREGROUND=$P10K_COLOR_SAPPHIRE
  typeset -g POWERLEVEL9K_JENV_SOURCES=(shell local global)
  typeset -g POWERLEVEL9K_JENV_PROMPT_ALWAYS_SHOW=false
  typeset -g POWERLEVEL9K_JENV_SHOW_SYSTEM=true

  typeset -g POWERLEVEL9K_PLENV_FOREGROUND=$P10K_COLOR_LAVENDER
  typeset -g POWERLEVEL9K_PLENV_SOURCES=(shell local global)
  typeset -g POWERLEVEL9K_PLENV_PROMPT_ALWAYS_SHOW=false
  typeset -g POWERLEVEL9K_PLENV_SHOW_SYSTEM=true

  typeset -g POWERLEVEL9K_PERLBREW_FOREGROUND=$P10K_COLOR_LAVENDER
  typeset -g POWERLEVEL9K_PERLBREW_PROJECT_ONLY=true
  typeset -g POWERLEVEL9K_PERLBREW_SHOW_PREFIX=false

  typeset -g POWERLEVEL9K_PHPENV_FOREGROUND=$P10K_COLOR_MAUVE
  typeset -g POWERLEVEL9K_PHPENV_SOURCES=(shell local global)
  typeset -g POWERLEVEL9K_PHPENV_PROMPT_ALWAYS_SHOW=false
  typeset -g POWERLEVEL9K_PHPENV_SHOW_SYSTEM=true

  typeset -g POWERLEVEL9K_SCALAENV_FOREGROUND=$P10K_COLOR_RED
  typeset -g POWERLEVEL9K_SCALAENV_SOURCES=(shell local global)
  typeset -g POWERLEVEL9K_SCALAENV_PROMPT_ALWAYS_SHOW=false
  typeset -g POWERLEVEL9K_SCALAENV_SHOW_SYSTEM=true

  typeset -g POWERLEVEL9K_HASKELL_STACK_FOREGROUND=$P10K_COLOR_PEACH
  typeset -g POWERLEVEL9K_HASKELL_STACK_SOURCES=(shell local)
  typeset -g POWERLEVEL9K_HASKELL_STACK_ALWAYS_SHOW=true

  typeset -g POWERLEVEL9K_TERRAFORM_SHOW_DEFAULT=false
  typeset -g POWERLEVEL9K_TERRAFORM_CLASSES=(
      '*'         OTHER)
  typeset -g POWERLEVEL9K_TERRAFORM_OTHER_FOREGROUND=$P10K_COLOR_SKY

  typeset -g POWERLEVEL9K_TERRAFORM_VERSION_FOREGROUND=$P10K_COLOR_SKY

  typeset -g POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|oc|istioctl|kogito|k9s|helmfile|flux|fluxctl|stern|kubeseal|skaffold|kubent|kubecolor|cmctl|sparkctl'

  typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
      '*'       DEFAULT)
  typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=$P10K_COLOR_MAUVE

  typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION=
  POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${P9K_KUBECONTEXT_CLOUD_CLUSTER:-${P9K_KUBECONTEXT_NAME}}'
  POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${${:-/$P9K_KUBECONTEXT_NAMESPACE}:#/default}'

  typeset -g POWERLEVEL9K_AWS_SHOW_ON_COMMAND='aws|awless|cdk|terraform|tofu|pulumi|terragrunt'

  typeset -g POWERLEVEL9K_AWS_CLASSES=(
      '*'       DEFAULT)
  typeset -g POWERLEVEL9K_AWS_DEFAULT_FOREGROUND=$P10K_COLOR_PEACH

  typeset -g POWERLEVEL9K_AWS_CONTENT_EXPANSION='${P9K_AWS_PROFILE//\%/%%}${P9K_AWS_REGION:+ ${P9K_AWS_REGION//\%/%%}}'

  typeset -g POWERLEVEL9K_AWS_EB_ENV_FOREGROUND=$P10K_COLOR_GREEN

  typeset -g POWERLEVEL9K_AZURE_SHOW_ON_COMMAND='az|terraform|tofu|pulumi|terragrunt'

  typeset -g POWERLEVEL9K_AZURE_CLASSES=(
      '*'         OTHER)

  typeset -g POWERLEVEL9K_AZURE_OTHER_FOREGROUND=$P10K_COLOR_SAPPHIRE

  typeset -g POWERLEVEL9K_GCLOUD_SHOW_ON_COMMAND='gcloud|gcs|gsutil'
  typeset -g POWERLEVEL9K_GCLOUD_FOREGROUND=$P10K_COLOR_SAPPHIRE

  typeset -g POWERLEVEL9K_GCLOUD_PARTIAL_CONTENT_EXPANSION='${P9K_GCLOUD_PROJECT_ID//\%/%%}'
  typeset -g POWERLEVEL9K_GCLOUD_COMPLETE_CONTENT_EXPANSION='${P9K_GCLOUD_PROJECT_NAME//\%/%%}'

  typeset -g POWERLEVEL9K_GCLOUD_REFRESH_PROJECT_NAME_SECONDS=60

  typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_SHOW_ON_COMMAND='terraform|tofu|pulumi|terragrunt'

  typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES=(
      '*'             DEFAULT)
  typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_FOREGROUND=$P10K_COLOR_SAPPHIRE

  typeset -g POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_CONTENT_EXPANSION='${P9K_GOOGLE_APP_CRED_PROJECT_ID//\%/%%}'

  typeset -g POWERLEVEL9K_TOOLBOX_FOREGROUND=$P10K_COLOR_YELLOW
  typeset -g POWERLEVEL9K_TOOLBOX_CONTENT_EXPANSION='${P9K_TOOLBOX_NAME:#fedora-toolbox-*}'

  typeset -g POWERLEVEL9K_PUBLIC_IP_FOREGROUND=$P10K_COLOR_PEACH

  typeset -g POWERLEVEL9K_VPN_IP_FOREGROUND=$P10K_COLOR_SKY
  typeset -g POWERLEVEL9K_VPN_IP_CONTENT_EXPANSION=
  typeset -g POWERLEVEL9K_VPN_IP_INTERFACE='(gpd|wg|(.*tun)|tailscale)[0-9]*|(zt.*)'
  typeset -g POWERLEVEL9K_VPN_IP_SHOW_ALL=false

  typeset -g POWERLEVEL9K_IP_FOREGROUND=$P10K_COLOR_SKY
  typeset -g POWERLEVEL9K_IP_CONTENT_EXPANSION='${P9K_IP_RX_RATE:+%F{'"${P10K_COLOR_GREEN}"'}⇣$P9K_IP_RX_RATE }${P9K_IP_TX_RATE:+%F{'"${P10K_COLOR_PEACH}"'}⇡$P9K_IP_TX_RATE }%F{'"${P10K_COLOR_SKY}"'}$P9K_IP_IP'
  typeset -g POWERLEVEL9K_IP_INTERFACE='[ew].*'

  typeset -g POWERLEVEL9K_PROXY_FOREGROUND=$P10K_COLOR_BLUE

  typeset -g POWERLEVEL9K_BATTERY_LOW_THRESHOLD=20
  typeset -g POWERLEVEL9K_BATTERY_LOW_FOREGROUND=$P10K_COLOR_RED
  typeset -g POWERLEVEL9K_BATTERY_{CHARGING,CHARGED}_FOREGROUND=$P10K_COLOR_GREEN
  typeset -g POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND=$P10K_COLOR_YELLOW
  typeset -g POWERLEVEL9K_BATTERY_STAGES='\UF008E\UF007A\UF007B\UF007C\UF007D\UF007E\UF007F\UF0080\UF0081\UF0082\UF0079'
  typeset -g POWERLEVEL9K_BATTERY_VERBOSE=false

  typeset -g POWERLEVEL9K_WIFI_FOREGROUND=$P10K_COLOR_BLUE

  typeset -g POWERLEVEL9K_TIME_FOREGROUND=$P10K_COLOR_TEAL
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false

  function prompt_example() {
    p10k segment -f $P10K_COLOR_PEACH -i '⭐' -t 'hello, %n'
  }

  function instant_prompt_example() {
    prompt_example
  }

  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always

  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose

  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  (( ! $+functions[p10k] )) || p10k reload
}

typeset -g POWERLEVEL9K_CONFIG_FILE=${${(%):-%x}:a}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
