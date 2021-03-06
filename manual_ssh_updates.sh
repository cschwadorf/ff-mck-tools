Stable Branch:
uci set autoupdater.stable.mirror=''
uci add_list autoupdater.stable.mirror='http://[fda0:747e:ab29:2241:215:5dff:fee1:d02f]/update/stable/images/sysupgrade'
uci add_list autoupdater.stable.mirror='http://[fda0:747e:ab29:2241:62e3:27ff:fe4a:7c34]/update/stable/images/sysupgrade/'
uci set autoupdater.stable.good_signatures='1'
uci set autoupdater.stable.pubkey=''
uci add_list autoupdater.stable.pubkey='f91c4445e69fbc9cdebbe1015dc8b9ad996046c06280e4b60190d2f2279182cb'
uci set autoupdater.settings.enabled='1'
uci set autoupdater.settings.branch='stable'
uci commit autoupdater

Beta Branch:
uci set autoupdater.beta.mirror=''
uci add_list autoupdater.beta.mirror='http://[fda0:747e:ab29:2241:215:5dff:fee1:d02f]/update/beta/images/sysupgrade'
uci add_list autoupdater.beta.mirror='http://[fda0:747e:ab29:2241:62e3:27ff:fe4a:7c34]/update/beta/images/sysupgrade/'
uci set autoupdater.beta.good_signatures='1'
uci set autoupdater.beta.pubkey=''
uci add_list autoupdater.beta.pubkey='f91c4445e69fbc9cdebbe1015dc8b9ad996046c06280e4b60190d2f2279182cb'
uci set autoupdater.settings.enabled='1'
uci set autoupdater.settings.branch='beta'
uci commit autoupdater

Experimental Branch:
uci set autoupdater.experimental.mirror=''
uci add_list autoupdater.experimental.mirror='http://[fda0:747e:ab29:2241:215:5dff:fee1:d02f]/update/experimental/images/sysupgrade'
uci add_list autoupdater.experimental.mirror='http://[fda0:747e:ab29:2241:62e3:27ff:fe4a:7c34]/update/experimental/images/sysupgrade/'
uci set autoupdater.experimental.good_signatures='1'
uci set autoupdater.experimental.pubkey=''
uci add_list autoupdater.experimental.pubkey='f91c4445e69fbc9cdebbe1015dc8b9ad996046c06280e4b60190d2f2279182cb'
uci set autoupdater.settings.enabled='1'
uci set autoupdater.settings.branch='experimental'
uci commit autoupdater
