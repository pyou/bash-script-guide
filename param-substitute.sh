#!/bin/bash

# ${parameter-default}, ${parameter:-default}
# If parameter not set, use default.
# ${parameter-default} and ${parameter:-default} are almost equivalent.
# The extra : makes a difference only when parameter has been declared, but is null.

username0=
echo "username0 has been declared, but is set to null."
echo "username0 = ${username0-`whoami`}"
# Will not echo.

echo

echo username1 has not been declared.
echo "username1 = ${username1-`whoami`}"
# Will echo

echo

username2=
echo "username2 has been declared, but is set to null."
echo "username2 = ${username2:-`whoami`}"

echo

variable=
# variable has been declared, but is set to null.

echo "${variable-0}"
echo "${variable:-1}"

unset variable

echo "${variable-2}"
echo "${variable:-3}"

exit 0