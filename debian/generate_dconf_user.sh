#!/bin/sh

user_db="user"
codename=$(lsb_release -sc 2>/dev/null)
if [ -n "$codename" ]; then
    # Profile names may only contain [[:alnum:]] and '_'
    user_db="user_${codename}"
fi

cat <<EOF
user-db:${user_db}
system-db:athena
EOF
