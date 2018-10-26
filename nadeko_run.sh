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


echo "Building NadekoBot"
cd $root/rice-v2/src/NadekoBot/
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

echo "Runnin
