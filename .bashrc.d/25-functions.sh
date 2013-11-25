# Show current git branch in prompt.
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}


function parse_core_temp {
    case "$HOSTNAME" in
        "HP-425")
            VAR=$(sensors | grep temp1 | grep -o "[0-9\.]*°C" | head -n1)
            ;;
        "a13")
            VAR=$(sensors | grep CPU | grep -o "[0-9\.]*°C" | head -n1)
            ;;
        *)
            echo "";
            return;
            ;;
    esac

    echo "∆ $VAR"
}


function get_ret_code {
  _ret=$?; 
  if test $_ret -ne 0; then
    echo "(${_ret}) "; 
    set ?=$_ret; 
    unset _ret; 
  fi
}
