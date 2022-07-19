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

POWERLEVEL9K_MODE=nerdfont-complete
POWERLEVEL9K_ICON_PADDING=none
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

###############################################################################
# Prompt Outline
###############################################################################
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%244F╭─'
POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='%244F├─'
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%244F╰─'
  # None in Right Side
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX=
POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX=
POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX=

###############################################################################
# Prompt Styling (Separator & Surroundings)
###############################################################################
  # Separator between same-color segments on the left.
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR='\uE0B1'
  # Separator between same-color segments on the right.
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR='\uE0B3'
  # Separator between different-color segments on the left.
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR='\uE0B0'
  # Separator between different-color segments on the right.
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR='\uE0B2'
  # The right end of left prompt.
POWERLEVEL9K_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL='▓▒░'
  # The left end of right prompt.
POWERLEVEL9K_RIGHT_PROMPT_FIRST_SEGMENT_START_SYMBOL='░▒▓'
  # The left end of left prompt.
POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL='\uE0BA'
  # The right end of right prompt.
POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL='\uE0BC'
  # Left prompt terminator for lines without any segments.
POWERLEVEL9K_EMPTY_LINE_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=


###############################################################################
# Segments
###############################################################################
##########[ os_icon: os identifier ]##########
POWERLEVEL9K_OS_ICON_FOREGROUND=232
POWERLEVEL9K_OS_ICON_BACKGROUND=7

################################[ prompt_char: prompt symbol ]################################
  # Transparent background.
POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=
  # Green prompt symbol if the last command succeeded.
POWERLEVEL9K_PROMPT_CHAR_OK_FOREGROUND=76
  # Red prompt symbol if the last command failed.
POWERLEVEL9K_PROMPT_CHAR_ERROR_FOREGROUND=196
  # Default prompt symbol.
POWERLEVEL9K_PROMPT_CHAR_CONTENT_EXPANSION='❯'
POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=
POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=
POWERLEVEL9K_PROMPT_CHAR_LEFT_WHITESPACE=

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
  # Don't shorten directories that contain any of these files. They are anchors.
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
  .tool-version
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
POWERLEVEL9K_SHORTEN_FOLDER_MARKER="(${(j:|:)anchor_files})"
POWERLEVEL9K_DIR_TRUNCATE_BEFORE_MARKER=false
  # Don't shorten this many last directory segments. They are anchors.
POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
POWERLEVEL9K_DIR_MAX_LENGTH=80
POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS=40
POWERLEVEL9K_DIR_MIN_COMMAND_COLUMNS_PCT=50
  # If set to true, embed a hyperlink into the directory. Useful for quickly
  # opening a directory in the file manager simply by clicking the link.
  # Can also be handy when the directory is shortened, as it allows you to see
  # the full directory that was used in previous commands.
POWERLEVEL9K_DIR_HYPERLINK=true
  # Enable special styling for non-writable and non-existent directories.
POWERLEVEL9K_DIR_SHOW_WRITABLE=v3

#####################################[ vcs: git status ]######################################
POWERLEVEL9K_VCS_CLEAN_BACKGROUND=2
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=3
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=2
POWERLEVEL9K_VCS_CONFLICTED_BACKGROUND=3
POWERLEVEL9K_VCS_LOADING_BACKGROUND=8
POWERLEVEL9K_VCS_BRANCH_ICON='\uF126 '
POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

  # Formatter for Git status.
  #
  # Example output: master ⇣42⇡42 *42 merge ~42 +42 !42 ?42.
  #
  # You can edit the function to customize how Git status looks.
  #
  # VCS_STATUS_* parameters are set by gitstatus plugin. See reference:
  # https://github.com/romkatv/gitstatus/blob/master/gitstatus.plugin.zsh.
function my_git_formatter() {
  emulate -L zsh

  if [[ -n $P9K_CONTENT ]]; then
    # If P9K_CONTENT is not empty, use it. It's either "loading" or from vcs_info (not from
    # gitstatus plugin). VCS_STATUS_* parameters are not available in this case.
    my_git_format=$P9K_CONTENT
    return
  fi

  # Styling for different parts of Git status.
  local       meta='%7F' # white foreground
  local      clean='%0F' # black foreground
  local   modified='%0F' # black foreground
  local  untracked='%0F' # black foreground
  local conflicted='%1F' # red foreground

  local res

  if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
    local branch=${(V)VCS_STATUS_LOCAL_BRANCH}
    # If local branch name is at most 32 characters long, show it in full.
    # Otherwise show the first 12 … the last 12.
    # Tip: To always show local branch name in full without truncation, delete the next line.
    (( $#branch > 32 )) && branch[13,-13]="…"  # <-- this line
    res+="${clean}${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}${branch//\%/%%}"
  fi

  if [[ -n $VCS_STATUS_TAG
        # Show tag only if not on a branch.
        # Tip: To always show tag, delete the next line.
        && -z $VCS_STATUS_LOCAL_BRANCH  # <-- this line
      ]]; then
    local tag=${(V)VCS_STATUS_TAG}
    # If tag name is at most 32 characters long, show it in full.
    # Otherwise show the first 12 … the last 12.
    # Tip: To always show tag name in full without truncation, delete the next line.
    (( $#tag > 32 )) && tag[13,-13]="…"  # <-- this line
    res+="${meta}#${clean}${tag//\%/%%}"
  fi

  # Display the current Git commit if there is no branch and no tag.
  # Tip: To always display the current Git commit, delete the next line.
  [[ -z $VCS_STATUS_LOCAL_BRANCH && -z $VCS_STATUS_TAG ]] &&  # <-- this line
    res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

  # Show tracking branch name if it differs from local branch.
  if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
    res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"
  fi

  # ⇣42 if behind the remote.
  (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
  # ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
  (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
  (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
  # ⇠42 if behind the push remote.
  (( VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" ${clean}⇠${VCS_STATUS_PUSH_COMMITS_BEHIND}"
  (( VCS_STATUS_PUSH_COMMITS_AHEAD && !VCS_STATUS_PUSH_COMMITS_BEHIND )) && res+=" "
  # ⇢42 if ahead of the push remote; no leading space if also behind: ⇠42⇢42.
  (( VCS_STATUS_PUSH_COMMITS_AHEAD  )) && res+="${clean}⇢${VCS_STATUS_PUSH_COMMITS_AHEAD}"
  # *42 if have stashes.
  (( VCS_STATUS_STASHES        )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
  # 'merge' if the repo is in an unusual state.
  [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
  # ~42 if have merge conflicts.
  (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
  # +42 if have staged changes.
  (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
  # !42 if have unstaged changes.
  (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
  # ?42 if have untracked files. It's really a question mark, your font isn't broken.
  # See POWERLEVEL9K_VCS_UNTRACKED_ICON above if you want to use a different icon.
  # Remove the next line if you don't want to see untracked files at all.
  (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"
  # "─" if the number of unstaged files is unknown. This can happen due to
  # POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY (see below) being set to a non-negative number lower
  # than the number of files in the Git index, or due to bash.showDirtyState being set to false
  # in the repository config. The number of staged and untracked files may also be unknown
  # in this case.
  (( VCS_STATUS_HAS_UNSTAGED == -1 )) && res+=" ${modified}─"

  my_git_format=$res
}
functions -M my_git_formatter 2>/dev/null

  # Don't count the number of unstaged, untracked and conflicted files in Git repositories with
  # more than this many files in the index. Negative value means infinity.
POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=99
POWERLEVEL9K_VCS_DISABLED_WORKDIR_PATTERN='~'
POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter()))+${my_git_format}}'
POWERLEVEL9K_VCS_STAGED_MAX_NUM=-1
POWERLEVEL9K_VCS_UNSTAGED_MAX_NUM=-1
POWERLEVEL9K_VCS_UNTRACKED_MAX_NUM=-1
POWERLEVEL9K_VCS_CONFLICTED_MAX_NUM=-1
POWERLEVEL9K_VCS_COMMITS_AHEAD_MAX_NUM=-1
POWERLEVEL9K_VCS_COMMITS_BEHIND_MAX_NUM=-1
POWERLEVEL9K_VCS_PREFIX='on '
  # Show status of repositories of these types. You can add svn and/or hg if you are
  # using them. If you do, your prompt may become slow even when your current directory
  # isn't in an svn or hg reposotiry.
POWERLEVEL9K_VCS_BACKENDS=(git)

##########################[ status: exit code of the last command ]###########################
  # Enable OK_PIPE, ERROR_PIPE and ERROR_SIGNAL status states to allow us to enable, disable and
  # style them independently from the regular OK and ERROR state.
POWERLEVEL9K_STATUS_EXTENDED_STATES=true
  # Status on success. No content, just an icon. No need to show it if prompt_char is enabled as
  # it will signify success by turning green.
POWERLEVEL9K_STATUS_OK=true
POWERLEVEL9K_STATUS_OK_VISUAL_IDENTIFIER_EXPANSION='✔'
POWERLEVEL9K_STATUS_OK_FOREGROUND=46
POWERLEVEL9K_STATUS_OK_BACKGROUND=239
  # Status when some part of a pipe command fails but the overall exit status is zero. It may look
  # like this: 1|0.
POWERLEVEL9K_STATUS_OK_PIPE=true
POWERLEVEL9K_STATUS_OK_PIPE_VISUAL_IDENTIFIER_EXPANSION='✔'
POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=46
POWERLEVEL9K_STATUS_OK_PIPE_BACKGROUND=239
  # Status when it's just an error code (e.g., '1'). No need to show it if prompt_char is enabled as
  # it will signify error by turning red.
POWERLEVEL9K_STATUS_ERROR=true
POWERLEVEL9K_STATUS_ERROR_VISUAL_IDENTIFIER_EXPANSION='✘'
POWERLEVEL9K_STATUS_ERROR_FOREGROUND=3
POWERLEVEL9K_STATUS_ERROR_BACKGROUND=1
  # Status when the last command was terminated by a signal.
POWERLEVEL9K_STATUS_ERROR_SIGNAL=true
  # Use terse signal names: "INT" instead of "SIGINT(2)".
POWERLEVEL9K_STATUS_VERBOSE_SIGNAME=false
POWERLEVEL9K_STATUS_ERROR_SIGNAL_VISUAL_IDENTIFIER_EXPANSION='✘'
POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=3
POWERLEVEL9K_STATUS_ERROR_SIGNAL_BACKGROUND=1
  # Status when some part of a pipe command fails and the overall exit status is also non-zero.
  # It may look like this: 1|0.
POWERLEVEL9K_STATUS_ERROR_PIPE=true
POWERLEVEL9K_STATUS_ERROR_PIPE_VISUAL_IDENTIFIER_EXPANSION='✘'
POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=3
POWERLEVEL9K_STATUS_ERROR_PIPE_BACKGROUND=1

###################[ command_execution_time: duration of the last command ]###################
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=0
POWERLEVEL9K_COMMAND_EXECUTION_TIME_BACKGROUND=3
  # Show duration of the last command if takes at least this many seconds.
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=1
  # Show this many fractional digits. Zero means round to seconds.
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
  # Duration format: 1d 2h 3m 4s.
POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
  # Custom icon.
  # POWERLEVEL9K_COMMAND_EXECUTION_TIME_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # Custom prefix.
POWERLEVEL9K_COMMAND_EXECUTION_TIME_PREFIX='took '

#######################[ background_jobs: presence of background jobs ]#######################
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=6
POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND=0
  # Show the number of background jobs.
  # POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE_ALWAYS=true
POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=true

#######################[ direnv: direnv status (https://direnv.net/) ]########################
POWERLEVEL9K_DIRENV_FOREGROUND=3
POWERLEVEL9K_DIRENV_BACKGROUND=0

###############[ asdf: asdf version manager (https://github.com/asdf-vm/asdf) ]###############
POWERLEVEL9K_ASDF_FOREGROUND=0
POWERLEVEL9K_ASDF_BACKGROUND=7

  # There are four parameters that can be used to hide asdf tools. Each parameter describes
  # conditions under which a tool gets hidden. Parameters can hide tools but not unhide them. If at
  # least one parameter decides to hide a tool, that tool gets hidden. If no parameter decides to
  # hide a tool, it gets shown.
  #
  # Special note on the difference between POWERLEVEL9K_ASDF_SOURCES and
  # POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW. Consider the effect of the following commands:
  #
  #   asdf local  python 3.8.1
  #   asdf global python 3.8.1
  #
  # After running both commands the current python version is 3.8.1 and its source is "local" as
  # it takes precedence over "global". If POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW is set to false,
  # it'll hide python version in this case because 3.8.1 is the same as the global version.
  # POWERLEVEL9K_ASDF_SOURCES will hide python version only if the value of this parameter doesn't
  # contain "local".
POWERLEVEL9K_ASDF_SOURCES=(shell local global)

  # If set to false, hide tool versions that are the same as global.
POWERLEVEL9K_ASDF_PROMPT_ALWAYS_SHOW=false

  # If set to false, hide tool versions that are equal to "system".
POWERLEVEL9K_ASDF_SHOW_SYSTEM=true
POWERLEVEL9K_ASDF_SHOW_ON_UPGLOB=
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

  # Don't show context unless running with privileges or in SSH.
  # Tip: Remove the next line to always show context.
  #POWERLEVEL9K_CONTEXT_{DEFAULT,SUDO}_{CONTENT,VISUAL_IDENTIFIER}_EXPANSION=

################[ terraform: terraform workspace (https://www.terraform.io) ]#################
  # Don't show terraform workspace if it's literally "default".
POWERLEVEL9K_TERRAFORM_SHOW_DEFAULT=false
  # POWERLEVEL9K_TERRAFORM_CLASSES is an array with even number of elements. The first element
  # in each pair defines a pattern against which the current terraform workspace gets matched.
  # More specifically, it's P9K_CONTENT prior to the application of context expansion (see below)
  # that gets matched. If you unset all POWERLEVEL9K_TERRAFORM_*CONTENT_EXPANSION parameters,
  # you'll see this value in your prompt. The second element of each pair in
  # POWERLEVEL9K_TERRAFORM_CLASSES defines the workspace class. Patterns are tried in order. The
  # first match wins.
  #
  # For example, given these settings:
  #
  # POWERLEVEL9K_TERRAFORM_CLASSES=(
  #     '*prod*'  PROD
  #     '*test*'  TEST
  #     '*'       OTHER)
  #
  # If your current terraform workspace is "project_test", its class is TEST because "project_test"
  # doesn't match the pattern '*prod*' but does match '*test*'.
  #
  # You can define different colors, icons and content expansions for different classes:
  #
  # POWERLEVEL9K_TERRAFORM_TEST_FOREGROUND=2
  # POWERLEVEL9K_TERRAFORM_TEST_BACKGROUND=0
  # POWERLEVEL9K_TERRAFORM_TEST_VISUAL_IDENTIFIER_EXPANSION='⭐'
  # POWERLEVEL9K_TERRAFORM_TEST_CONTENT_EXPANSION='> ${P9K_CONTENT} <'
POWERLEVEL9K_TERRAFORM_CLASSES=(
      # '*prod*'  PROD    # These values are examples that are unlikely
      # '*test*'  TEST    # to match your needs. Customize them as needed.
      '*'         OTHER)
POWERLEVEL9K_TERRAFORM_OTHER_FOREGROUND=4
POWERLEVEL9K_TERRAFORM_OTHER_BACKGROUND=0
  # POWERLEVEL9K_TERRAFORM_OTHER_VISUAL_IDENTIFIER_EXPANSION='⭐'

#############[ kubecontext: current kubernetes context (https://kubernetes.io/) ]#############
  # Show kubecontext only when the the command you are typing invokes one of these tools.
  # Tip: Remove the next line to always show kubecontext.
POWERLEVEL9K_KUBECONTEXT_SHOW_ON_COMMAND='kubectl|helm|kubens|kubectx|oc|istioctl|kogito|k9s|helmfile|fluxctl|stern'
POWERLEVEL9K_KUBECONTEXT_CLASSES=(
      # '*prod*'  PROD    # These values are examples that are unlikely
      # '*test*'  TEST    # to match your needs. Customize them as needed.
      '*'       DEFAULT)
POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=7
POWERLEVEL9K_KUBECONTEXT_DEFAULT_BACKGROUND=5
POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION=
POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${P9K_KUBECONTEXT_CLOUD_CLUSTER:-${P9K_KUBECONTEXT_NAME}}'
POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${${:-/$P9K_KUBECONTEXT_NAMESPACE}:#/default}'
POWERLEVEL9K_KUBECONTEXT_PREFIX='at '

#[ aws: aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html) ]#
  # Show aws only when the the command you are typing invokes one of these tools.
  # Tip: Remove the next line to always show aws.
POWERLEVEL9K_AWS_SHOW_ON_COMMAND='aws|awless|terraform|pulumi|terragrunt'
POWERLEVEL9K_AWS_CLASSES=(
      # '*prod*'  PROD    # These values are examples that are unlikely
      # '*test*'  TEST    # to match your needs. Customize them as needed.
      '*'       DEFAULT)
POWERLEVEL9K_AWS_DEFAULT_FOREGROUND=7
POWERLEVEL9K_AWS_DEFAULT_BACKGROUND=1
POWERLEVEL9K_AWS_CONTENT_EXPANSION='${P9K_AWS_PROFILE//\%/%%}${P9K_AWS_REGION:+ ${P9K_AWS_REGION//\%/%%}}'
POWERLEVEL9K_AWS_EB_ENV_FOREGROUND=2
POWERLEVEL9K_AWS_EB_ENV_BACKGROUND=0

##########[ azure: azure account name (https://docs.microsoft.com/en-us/cli/azure) ]##########
  # Show azure only when the the command you are typing invokes one of these tools.
  # Tip: Remove the next line to always show azure.
POWERLEVEL9K_AZURE_SHOW_ON_COMMAND='az|terraform|pulumi|terragrunt'
POWERLEVEL9K_AZURE_FOREGROUND=7
POWERLEVEL9K_AZURE_BACKGROUND=4

##########[ gcloud: google cloud account and project (https://cloud.google.com/) ]###########
  # Show gcloud only when the the command you are typing invokes one of these tools.
  # Tip: Remove the next line to always show gcloud.
POWERLEVEL9K_GCLOUD_SHOW_ON_COMMAND='gcloud|gcs'
POWERLEVEL9K_GCLOUD_FOREGROUND=7
POWERLEVEL9K_GCLOUD_BACKGROUND=4
  # You can customize the format, icon and colors of gcloud segment separately for states PARTIAL
  # and COMPLETE. You can also hide gcloud in state PARTIAL by setting
  # POWERLEVEL9K_GCLOUD_PARTIAL_VISUAL_IDENTIFIER_EXPANSION and
  # POWERLEVEL9K_GCLOUD_PARTIAL_CONTENT_EXPANSION to empty.
POWERLEVEL9K_GCLOUD_PARTIAL_CONTENT_EXPANSION='${P9K_GCLOUD_PROJECT_ID//\%/%%}'
POWERLEVEL9K_GCLOUD_COMPLETE_CONTENT_EXPANSION='${P9K_GCLOUD_PROJECT_NAME//\%/%%}'

  # Send a request to Google (by means of `gcloud projects describe ...`) to obtain project name
  # this often. Negative value disables periodic polling. In this mode project name is retrieved
  # only when the current configuration, account or project id changes.
POWERLEVEL9K_GCLOUD_REFRESH_PROJECT_NAME_SECONDS=60

#[ google_app_cred: google application credentials (https://cloud.google.com/docs/authentication/production) ]#
  # Show google_app_cred only when the the command you are typing invokes one of these tools.
  # Tip: Remove the next line to always show google_app_cred.
POWERLEVEL9K_GOOGLE_APP_CRED_SHOW_ON_COMMAND='terraform|pulumi|terragrunt'
POWERLEVEL9K_GOOGLE_APP_CRED_CLASSES=(
      # '*:*prod*:*'  PROD    # These values are examples that are unlikely
      # '*:*test*:*'  TEST    # to match your needs. Customize them as needed.
      '*'             DEFAULT)
POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_FOREGROUND=7
POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_BACKGROUND=4
POWERLEVEL9K_GOOGLE_APP_CRED_DEFAULT_CONTENT_EXPANSION='${P9K_GOOGLE_APP_CRED_PROJECT_ID//\%/%%}'
  # Transient prompt works similarly to the builtin transient_rprompt option. It trims down prompt
  # when accepting a command line. Supported values:
  #
  #   - off:      Don't change prompt when accepting a command line.
  #   - always:   Trim down prompt when accepting a command line.
  #   - same-dir: Trim down prompt when accepting a command line unless this is the first command
  #               typed after changing current working directory.
POWERLEVEL9K_TRANSIENT_PROMPT=off
  # Instant prompt mode.
  #
  #   - off:     Disable instant prompt. Choose this if you've tried instant prompt and found
  #              it incompatible with your zsh configuration files.
  #   - quiet:   Enable instant prompt and don't print warnings when detecting console output
  #              during zsh initialization. Choose this if you've read and understood
  #              https://github.com/romkatv/powerlevel10k/blob/master/README.md#instant-prompt.
  #   - verbose: Enable instant prompt and print a warning when detecting console output during
  #              zsh initialization. Choose this if you've never tried instant prompt, haven't
  #              seen the warning, or if you are unsure what this all means.
POWERLEVEL9K_INSTANT_PROMPT=quiet