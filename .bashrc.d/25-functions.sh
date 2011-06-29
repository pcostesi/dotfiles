# Show current git branch in prompt.
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


function get_ret_code {
  _ret=$?; 
  if test $_ret -ne 0; then
    echo "(${_ret}) "; 
    set ?=$_ret; 
    unset _ret; 
  fi
}
