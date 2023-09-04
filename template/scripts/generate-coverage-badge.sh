#!/bin/bash

TOTAL_COVERAGE=$(coverage report --format=total)
COLOR="red"

if [ "$TOTAL_COVERAGE" -gt 90 ]; then
    COLOR="green"
elif [ "$TOTAL_COVERAGE" -gt 75 ]; then
    COLOR="yellow"
fi

cat << EOF > "${1:-.}/coverage_badge.json"
{
  "schemaVersion": 1,
  "label": "coverage",
  "message": "${TOTAL_COVERAGE}%",
  "color": "${COLOR}"
}
EOF
