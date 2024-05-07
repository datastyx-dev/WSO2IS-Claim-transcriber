#!/bin/bash

# password grant IDP (initial token obtention)
CONSUMER_KEY='V1DXwgqZC4_Yp3jTJHzU2THnpnIa'
CONSUMER_SECRET='r2kRN4OnOAWEXKdiyZz8Y2G9Gq9rm45gN2gwiW73uB4a'
IDP_1_TOKEN_URL=https://localhost:9444/oauth2/token
# CONSUMER_KEY='IUpTFFygTWume47Y63Gs5Bglsbsa'
# CONSUMER_SECRET='SyBVpJtDglepgstr3uk28vvTfIQa'
USERNAME='test_user' 
PASSWORD='Hi123456!'

# JWT grant assertion IDP
JWT_CONSUMER_KEY='dBfQbKlqhoouhEmyAYaQPuoaRDMa'
JWT_CONSUMER_SECRET='FeS_jccV84a8lw9u2i8YmPMFL5NiVqfVPel_L5afBCMa'
IDP_2_TOKEN_URL=https://localhost:9444/oauth2/token

# JWT grant assertion IDP
EXCHANGE_CONSUMER_KEY='4LJr24sUc5m2qlcrPNfuPmraTUca'
EXCHANGE_CONSUMER_SECRET='a20FUScKKWLQVkiZPrUL4BU1NHZ5KBi2g4vuKmMA8_Ua'
IDP_3_TOKEN_URL=https://localhost:9444/oauth2/token

echo "OIDC : Obtaining Access token" 
ACCESS_TOKEN=$(curl -k -d "grant_type=password&username=${USERNAME}&password=${PASSWORD}&scope=openid email" \
    -u ${CONSUMER_KEY}:${CONSUMER_SECRET} \
    -H "Content-Type: application/x-www-form-urlencoded" \
    "${IDP_1_TOKEN_URL}" | jq -r '.access_token')
echo "Obtained access token is :"
# IFS='.' read -ra SEG <<< "${ACCESS_TOKEN}"
# for i in "${SEG[@]}"; do
#   echo "${i}" | base64 -d | jq
# done
arrIN=(${ACCESS_TOKEN//./ })
echo -n ${arrIN[0]} | base64 -di - | jq
echo -n ${arrIN[1]} | base64 -di - | jq

echo "Using Obtained Access Token for JWT Grant"

ACCESS_TOKEN_2=$(curl -X POST -k -u ${JWT_CONSUMER_KEY}:${JWT_CONSUMER_SECRET}  \
-d "grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion=${ACCESS_TOKEN}" \
-H 'Content-Type: application/x-www-form-urlencoded' \
"${IDP_2_TOKEN_URL}" | jq -r '.access_token')


echo "Obtained access token is :"
# IFS='.' read -ra SEG <<< "${ACCESS_TOKEN}"
# for i in "${SEG[@]}"; do
#   echo "${i}" | base64 -d | jq
# done
arrIN2=(${ACCESS_TOKEN_2//./ })
echo -n ${arrIN2[0]} | base64 -di - | jq
echo -n ${arrIN2[1]} | base64 -di - | jq


EXCHANGED_TOKEN=$(curl -k --location "${IDP_3_TOKEN_URL}" \
--header 'Content-Type: application/x-www-form-urlencoded' \
-u "${EXCHANGE_CONSUMER_KEY}:${EXCHANGE_CONSUMER_SECRET}" \
--data-urlencode "subject_token=${ACCESS_TOKEN_2}" \
--data-urlencode 'subject_token_type=urn:ietf:params:oauth:token-type:jwt' \
--data-urlencode 'requested_token_type=urn:ietf:params:oauth:token-type:access_token' \
--data-urlencode 'grant_type=urn:ietf:params:oauth:grant-type:token-exchange' | jq -r '.access_token')

echo "Exchanged access token is :"
arrIN3=(${EXCHANGED_TOKEN//./ })
echo -n ${arrIN3[0]} | base64 -di - | jq
echo -n ${arrIN3[1]} | base64 -di - | jq