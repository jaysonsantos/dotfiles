extra_keys_file=~/.keychain_keys
if [ -f "${extra_keys_file}" ]; then
    _EXTRA_KEYS=$(cat $extra_keys_file)
else
    _EXTRA_KEYS=""
    echo "Create the file $extra_keys_file to have the right keys loads and/or to dismiss this message."
fi
eval $(keychain --eval --agents ssh,gpg --inherit any id_rsa "$_EXTRA_KEYS")
