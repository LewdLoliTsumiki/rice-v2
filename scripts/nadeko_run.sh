#!/bin/sh
clientid="505009715911065611"
botid="505009715911065611"
token="NTA1MDA5NzE1OTExMDY1NjEx.DrNb4g.mBGnm5tr8bqiVEBrJs1fKi0ZxXI"
ownerid="[403362891597742081]"
googleapi=""
lolapikey=""
mashapekey=""
osu=""
scid=""
connection="Data Source=https://my.gearhost.com/databases/Details/RiceNadeko;Initial Catalog=;User ID=mimidoriaoi23@gmail.com;Password=in-correct23"

echo "NadekoBot 1.3b"

if hash dotnet 2>/dev/null
then
	echo "Dotnet installed."
else
	echo "Dotnet is not installed. Please install dotnet."
	exit 1
fi
root=$(pwd)
echo "Restoring Nadeko dependencies"
cd $root/NadekoBot/Discord.Net/src/Discord.Net.Core/
dotnet restore 1>/dev/null 2>&1
cd $root/NadekoBot/Discord.Net/src/Discord.Net.Rest/
dotnet restore 1>/dev/null 2>&1
cd $root/NadekoBot/Discord.Net/src/Discord.Net.WebSocket/
dotnet restore 1>/dev/null 2>&1
cd $root/NadekoBot/Discord.Net/src/Discord.Net.Commands/
dotnet restore 1>/dev/null 2>&1
cd $root/NadekoBot/src/NadekoBot/
dotnet restore 1>/dev/null 2>&1
echo ""
echo "Restoring done"

echo "Building NadekoBot"
cd $root/NadekoBot/src/NadekoBot/
dotnet build --configuration Release 1>/dev/null 2>&1
echo ""
echo "Installation Complete."

echo "Creating a new credentials.json"

echo "{
  \"ClientId\": $clientid,
  \"BotId\": $botid,
  \"Token\": \"$token\",
  \"OwnerIds\": [
    $ownerid
  ],
  \"LoLApiKey\": \"$lolapikey\",
  \"GoogleApiKey\": \"$googleapi\",
  \"MashapeKey\": \"$mashapekey\",
  \"OsuApiKey\": \"$osu\",
  \"SoundCloudClientId\": \"$scid\",
  \"Db\": {\"Type\": \"sqlserver\", \"ConnectionString\": \"$connection\"},
  \"TotalShards\": 1
}" | cat - >> credentials.json
sleep 5
cd -

cd $root/NadekoBot/src/NadekoBot
echo "Running NadekoBot. Please wait."
dotnet run --configuration Release
echo "Done"

exit 0

echo "Running NadekoBot with auto restart normally!"
sleep 5s
cd $root/NadekoBot/src/NadekoBot
while :; do dotnet run -c Release; sleep 5s; done
echo ""
echo "That didn't work? Please report to ScarletKuro"
sleep 3s
echo "Done"
exit 0
