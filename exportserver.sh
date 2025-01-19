VAR_DESTINATION=""
VAR_TOKEN=""
VAR_APPLOCATION=""

for arg in "$@"; do
  case $arg in
    DESTINATION=*)
      VAR_DESTINATION="$(realpath "${arg#*=}")"
      shift
      ;;
    TOKEN=*)
      VAR_TOKEN="${arg#*=}"
      shift
      ;;
    APPLOCATION=*)
      VAR_APPLOCATION="$(realpath "${arg#*=}")"
      shift
      ;;
  esac
done

echo "MODULE INFO:"
echo
echo "Module:      silverlps.discord.exportserver"
echo "Path:        $(pwd)"
echo "DESTINATION: $VAR_DESTINATION"
echo "TOKEN:       MD5=$(echo -n $VAR_TOKEN | md5sum | awk '{print $1}')"
echo "APPLOCATION: $VAR_APPLOCATION"
echo
cd "$VAR_APPLOCATION"
./DiscordChatExporter.Cli exportall -t "$VAR_TOKEN" -o "$VAR_DESTINATION" --media True --reuse-media True
