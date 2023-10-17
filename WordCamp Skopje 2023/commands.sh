# Raw history dump from WordCamp Skopje talk
# https://skopje.wordcamp.org/2023/session/alias-wp-cli/
wp @client eval 'echo wp_login_url() . "\n";'
ls -al
alias milana='ls -la'
milana

wp cli alias list
wp cli alias --help

# remote WordPress needed path and SSH setting (user@server:port)
# local WordPress needed only path
# group needed only names of aliases for --grouping param
wp cli alias add --prompt

# ran on remote server
wp option get home
pwd

# back to local
wp @djeva option get home
wp @magic option get home
subl ~/.wp-cli/config.yml
wp @group core version
wp @group plugin list
wp @group plugin install jetpack --activate
wp @group core update
wp @group plugin install jetpack --activate
wp @group plugin list

# import remote database to local install without ever logging into remote
# we could use alias @magic and avoid navigating into its root folder
cd magic.loc/
wp db export
wp @client db export - > client-db.sql
nano client-db.sql
wp db import client-db.sql
wp search-replace "milana.dev" "magic.loc"
wp search-replace "https://magic.loc" "http://magic.loc"
wp rewrite flush --hard

# put everything back
rm client-db.sql
wp db import magic-2023-10-14-cb15e16.sql

# do it again in one line
wp @client db export - | wp db import - && wp search-replace "milana.dev" "magic.loc" && wp search-replace "https://magic.loc" "http://magic.loc" && wp rewrite flush --hard

# put everything back again
wp db import magic-2023-10-14-cb15e16.sql

# convert one-liner into bash alias
alias sexy='wp @client db export - | wp db import - && wp search-replace "milana.dev" "magic.loc" && wp search-replace "https://magic.loc" "http://magic.loc" && wp rewrite flush --hard'
sexy

# to do: create a bash script for importing db 
