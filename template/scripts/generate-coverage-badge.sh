#!/bin/bash

TOTAL_COVERAGE=$(coverage report --format=total)
COLOR="#9f9f9f"

if [ "$TOTAL_COVERAGE" -gt 95 ]; then
    COLOR="#4c1"
elif [ "$TOTAL_COVERAGE" -gt 90 ]; then
    COLOR="#a3c51c"
elif [ "$TOTAL_COVERAGE" -gt 75 ]; then
    COLOR="#dfb317"
elif [ "$TOTAL_COVERAGE" -gt 0 ]; then
    COLOR="#e05d44"
fi

cat << EOF > "${1:-.}/coverage.json"
{
  "schemaVersion": 1,
  "label": "coverage",
  "message": "${TOTAL_COVERAGE}%",
  "color": "${COLOR}"
}
EOF
