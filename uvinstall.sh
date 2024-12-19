cat uvinstall.sh
RC_FILE="$HOME/.$(basename "$SHELL")rc"

curl -LsSf https://astral.sh/uv/install.sh | sh
source "$RC_FILE"
uv venv ~/.venv --prompt uv --python \${1:-"3.12"}
source ~/.venv/bin/activate
uv pip install pip

cat >> "$RC_FILE" << EOF
source ~/.venv/bin/activate
alias upi='uv pip install'
alias upie='uv pip install --config-settings editable_mode=compat -e'
uv-activate () { source ~/.venv\${1:+/\$1}/bin/activate; }
uv-create   () { uv venv ~/.venv/\$1 --prompt \$1 --python \$2; }
EOF

source $RC_FILE
