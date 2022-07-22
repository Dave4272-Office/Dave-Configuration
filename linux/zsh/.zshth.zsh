#################################
# all colour codes
#
# for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
#################################
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  # =========================[ Line #1 ]=========================
  os_icon                 # os identifier
  context                 # user@hostname
  dir                     # current directory
  vcs                     # git status
  # =========================[ Line #2 ]=========================
  newline                 # \n
  prompt_char             # prompt symbol
) 
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  # =========================[ Line #1 ]=========================
  status                  # exit code of the last command
  command_execution_time  # duration of the last command
  background_jobs         # presence of background jobs
  direnv                  # direnv status (https://direnv.net/)
  kubecontext             # current kubernetes context (https://kubernetes.io/)
  terraform               # terraform workspace (https://www.terraform.io)
  aws                     # aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
  aws_eb_env              # aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/)
  azure                   # azure account name (https://docs.microsoft.com/en-us/cli/azure)
  gcloud                  # google cloud cli account and project (https://cloud.google.com/)
  google_app_cred         # google application credentials (https://cloud.google.com/docs/authentication/production)
  # =========================[ Line #2 ]=========================
  newline                 # \n
  asdf                    # asdf version manager (https://github.com/asdf-vm/asdf)
)

###############################################################################
# Prompt Outline
###############################################################################
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%196F╭─'
POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='%196F├─'
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%196F╰─'
  # None in Right Side
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX=
POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX=
POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX=



###############################################################################
# Segments
###############################################################################
##########[ os_icon: os identifier ]##########
POWERLEVEL9K_OS_ICON_FOREGROUND=232
POWERLEVEL9K_OS_ICON_BACKGROUND=7

##################################[ dir: current directory ]##################################
POWERLEVEL9K_DIR_BACKGROUND=4
POWERLEVEL9K_DIR_FOREGROUND=254
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  # Replace removed segment suffixes with this symbol.
POWERLEVEL9K_SHORTEN_DELIMITER=*
  # Color of the shortened directory segments.
POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=250
POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=255
POWERLEVEL9K_DIR_ANCHOR_BOLD=true

POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
  # Don't shorten this many last directory segments. They are anchors.

  # If set to true, embed a hyperlink into the directory. Useful for quickly
  # opening a directory in the file manager simply by clicking the link.
  # Can also be handy when the directory is shortened, as it allows you to see
  # the full directory that was used in previous commands.
POWERLEVEL9K_DIR_HYPERLINK=true

  # Don't count the number of unstaged, untracked and conflicted files in Git repositories with
  # more than this many files in the index. Negative value means infinity.
POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=99

##########################[ status: exit code of the last command ]###########################
POWERLEVEL9K_STATUS_OK_FOREGROUND=46
POWERLEVEL9K_STATUS_OK_BACKGROUND=239
POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=46
POWERLEVEL9K_STATUS_OK_PIPE_BACKGROUND=239
POWERLEVEL9K_STATUS_ERROR_FOREGROUND=3
POWERLEVEL9K_STATUS_ERROR_BACKGROUND=1
POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=3
POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND=1
POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=3
POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND=1

###################[ command_execution_time: duration of the last command ]###################
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=0
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=3
  # Show duration of the last command if takes at least this many seconds.
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=0.2
  # Show this many fractional digits. Zero means round to seconds.
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=3

#######################[ background_jobs: presence of background jobs ]#######################
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=6
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=0
POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE_ALWAYS=true
POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=true

#######################[ direnv: direnv status (https://direnv.net/) ]########################
POWERLEVEL9K_DIRENV_FOREGROUND=3
POWERLEVEL9K_DIRENV_BACKGROUND=0

###############[ asdf: asdf version manager (https://github.com/asdf-vm/asdf) ]###############
POWERLEVEL9K_ASDF_FOREGROUND=0
POWERLEVEL9K_ASDF_BACKGROUND=7

POWERLEVEL9K_ASDF_RUBY_FOREGROUND=0
POWERLEVEL9K_ASDF_RUBY_BACKGROUND=1
POWERLEVEL9K_ASDF_PYTHON_FOREGROUND=0
POWERLEVEL9K_ASDF_PYTHON_BACKGROUND=4
POWERLEVEL9K_ASDF_GOLANG_FOREGROUND=0
POWERLEVEL9K_ASDF_GOLANG_BACKGROUND=4
POWERLEVEL9K_ASDF_NODEJS_FOREGROUND=0
POWERLEVEL9K_ASDF_NODEJS_BACKGROUND=2
POWERLEVEL9K_ASDF_RUST_FOREGROUND=0
POWERLEVEL9K_ASDF_RUST_BACKGROUND=208
POWERLEVEL9K_ASDF_DOTNET_CORE_FOREGROUND=0
POWERLEVEL9K_ASDF_DOTNET_CORE_BACKGROUND=5
POWERLEVEL9K_ASDF_FLUTTER_FOREGROUND=0
POWERLEVEL9K_ASDF_FLUTTER_BACKGROUND=4
POWERLEVEL9K_ASDF_LUA_FOREGROUND=0
POWERLEVEL9K_ASDF_LUA_BACKGROUND=4
POWERLEVEL9K_ASDF_JAVA_FOREGROUND=1
POWERLEVEL9K_ASDF_JAVA_BACKGROUND=7
POWERLEVEL9K_ASDF_PERL_FOREGROUND=0
POWERLEVEL9K_ASDF_PERL_BACKGROUND=4
POWERLEVEL9K_ASDF_ERLANG_FOREGROUND=0
POWERLEVEL9K_ASDF_ERLANG_BACKGROUND=1
POWERLEVEL9K_ASDF_ELIXIR_FOREGROUND=0
POWERLEVEL9K_ASDF_ELIXIR_BACKGROUND=5
POWERLEVEL9K_ASDF_POSTGRES_FOREGROUND=0
POWERLEVEL9K_ASDF_POSTGRES_BACKGROUND=6
POWERLEVEL9K_ASDF_PHP_FOREGROUND=0
POWERLEVEL9K_ASDF_PHP_BACKGROUND=5
POWERLEVEL9K_ASDF_HASKELL_FOREGROUND=0
POWERLEVEL9K_ASDF_HASKELL_BACKGROUND=3
POWERLEVEL9K_ASDF_JULIA_FOREGROUND=0
POWERLEVEL9K_ASDF_JULIA_BACKGROUND=2

##################################[ context: user@hostname ]##################################
  # Context color when running with privileges.
POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=0
POWERLEVEL9K_CONTEXT_ROOT_BACKGROUND=1
  # Context color in SSH without privileges.
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND=0
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_FOREGROUND=0
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND=3
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_BACKGROUND=1
  # Default context color (no privileges, no SSH).
POWERLEVEL9K_CONTEXT_FOREGROUND=0
POWERLEVEL9K_CONTEXT_BACKGROUND=3

  # Context format when running with privileges: user@hostname.
POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='\uf489 %n@%m'
  # Context format when in SSH without privileges: user@hostname.
POWERLEVEL9K_CONTEXT_REMOTE_TEMPLATE='\uf489 %n@%m'
POWERLEVEL9K_CONTEXT_REMOTE_SUDO_TEMPLATE='\uf489 %n@%m'
  # Default context format (no privileges, no SSH): user@hostname.
POWERLEVEL9K_CONTEXT_TEMPLATE='\uf489 %n@%m'

unset POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION
unset POWERLEVEL9K_CONTEXT_PREFIX

POWERLEVEL9K_TERRAFORM_OTHER_FOREGROUND=4
POWERLEVEL9K_TERRAFORM_OTHER_BACKGROUND=0

POWERLEVEL9K_AWS_EB_ENV_FOREGROUND=2
POWERLEVEL9K_AWS_EB_ENV_BACKGROUND=0

POWERLEVEL9K_TRANSIENT_PROMPT=off
POWERLEVEL9K_INSTANT_PROMPT=quiet
