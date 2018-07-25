
set -ex

# nimble install jester -y
# nimble install nimlua -y
# nimble install libsodium -y
# nimble install redis -y
# nimble install libcurl -y
# nimble install c2nim -y
# nimble install capnp -y
# nimble install fnmatch -y
# #nimble install hastyscribe  -y
# nimble install jester -y
# nimble install jwt -y
# nimble install libnotify -y
# nimble install lmdb -y
# nimble install nimlz4 -y
# # nimble install nimongo -y
# nimble install nimPDF -y
# nimble install nimsnappy -y
# nimble install nimyaml -y
# nimble install notifications  -y
# nimble install oauth -y
# nimble install rbtree -y
# nimble install reactor -y
# #nimble install RingBuffer  -y
# nimble install shorturl  -y
# nimble install signals -y
# nimble install sophia -y
# nimble install sphinx  -y
# nimble install struct -y
# nimble install telebot -y
# nimble install tuples  -y
# nimble install uri2   -y
# nimble install websocket  -y
# nimble install yaml  -y
# nimble install zip  -y
# nimble install enet  -y #http://enet.bespin.org/Features.html
# nimble install teafiles  -y #https://github.com/unicredit/nim-teafiles
# # nimble install rethinkdb  -y
# nimble install otp  -y
# nimble install nimrpc -y
# nimble install fileinput -y
# nimble install pudge -y
# nimble install isa -y

echo will install nimlang from nimscale repo
curl https://raw.githubusercontent.com/nimscale/nimscale/master/install/install.sh?$RANDOM |bash

echo get the env done
sh setenv.sh
