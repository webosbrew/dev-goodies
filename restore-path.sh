# Put in /opt/webos-sdk-x86_64/1.0.g/sysroots/x86_64-webossdk-linux/environment-setup.d and it will use system version of tools like CMake.
path_first=""
path_last=""

for p in ${PATH//:/ }; do
  if [[ $p == ${OECORE_NATIVE_SYSROOT}* ]]; then
    path_last="${path_last}${p}:"
  else
    path_first="${path_first}${p}:"
  fi
done

export PATH="${path_first}${path_last}"

export PATH=$(printf %s "$PATH" | awk -vRS=: '!a[$0]++' | paste -s -d:)
