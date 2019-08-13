#!/usr/bin/env /usr/local/bin/fish

set mullvad (curl -Ssf -XGET https://am.i.mullvad.net/json 2>/dev/null)
if test $status -ne 0
    echo ✘
    echo ---
    echo ✘ am.i.mullvad.net error
    exit
end

set ip (echo $mullvad | jq -r .ip)
set key "NTkzMzpsajJERzY4Nm1aeTVZaVJ0OFpaWFpVbG9IWnB4N1ZHNg=="
set iphub (curl -Ssf -H "X-Key: $key" -XGET https://v2.api.iphub.info/ip/$ip 2>/dev/null)
if test $status -ne 0
    echo ✘
    echo ---
    echo ✘ v2.api.iphub.info error
    exit
end

if test (echo $mullvad | jq -r .mullvad_exit_ip) = "true"
    echo ☗
    echo ---
    echo "☗ Mullvad"
else if test (echo $iphub | jq -r .block) -eq 1
    echo ▼
    echo ---
    echo "▼ Commercial IP"
else if test (echo $iphub | jq -r .block) -eq 2
    echo ⨸
    echo ---
    echo "⨸ Mixed IP"
else if test (echo $iphub | jq -r .block) -eq 0
    echo ⨀
    echo ---
    echo "⨀ Residential IP"
else
    echo ⨂
    echo ---
    echo "⨂ Indeterminate result"
end

echo ---

set city (echo $mullvad | jq -r .city)
set country (echo $mullvad | jq -r .country)
set isp (echo $iphub | jq -r .isp)
set asn (echo $iphub | jq -r .asn)
set org (echo $mullvad | jq -r .organization)
set server (echo $mullvad | jq -r .mullvad_exit_ip_hostname)

if test "$city" != "null"
	printf '%s, %s\n' $city $country
else
	printf '%s\n' $country
end

if test "$server" != "null"
    printf 'Mullvad server %s\n' $server
end

printf '%s %s\n' $asn $isp

if test "$org" != "null"
    printf '%s\n' $org
end

printf '%s\n' $ip
