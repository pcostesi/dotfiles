# Show current git branch in prompt.
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'
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


function find_tag {
    # 4) sort by dev, RC 
    # 3) sort by revision
    # 2) sort by minor
    # 1) sort by major
    # all sorts are stable, and in reverse order so they stack up.
    local version=$(git tag \
            | sort -drs -t'-' -k2,2     \
            | sort -nrs -t'.' -k3,3     \
            | sort -nrs -t'.' -k2,2     \
            | sort -nrs -t'.' -k1,1     \
            | grep -E "$1" -m 1         \
            || echo "N/A");
    echo "($(parse_git_branch) «$version»)"
}

