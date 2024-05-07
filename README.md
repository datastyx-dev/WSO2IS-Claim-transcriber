
## Custom JWT token Claim transcriptor
### Introduction / Use case.
This custom token issuer transcipts claims form input assertions to output access tokens.

### Applicable product versions.
Tested with IS-7.0.0

### How to use.
1) Stop the server if it is already running.
2) Build the project using following command,
  ```mvn clean install```
3) Copy the jar file __nato-jwt-token-issuer-1.0.0.jar__ from the target directory to __<IS_HOME>/repository/components/lib__ folder.
4) Add the following extension configuration in __<IS_HOME>/repository/conf/identity/deployment.xml__ as follows.
```
[[oauth.extensions.token_types]]
name = "NatoJWTissuer"
issuer = "org.datastyx.wso2.nato.jwtissuer.ClaimTranscriptionTokenIssuer"
persist_access_token_alias = true
```
5) The system running the WSO2IS must have a system environment variable `OAUTH_TRANSCRIPTION_CLAIMS` set with the claims to transcribe.
 (case sensitive list, whitespace is trimmed, separator is ';')


### Testing the project.
5) Start the server.
6) Create a new service provider in WSO2IS. Configure the  "OAuth/OpenID Connect Configuration" inbound Auth configuration.
7) Select the "ClaimTranscriptionTokenIssuer"
8) Add the audience restriction to match the same URL as the WSO2IS IdP.
9) Set the Callback URL to "regexp=(.*)" to match anything.
10) Add a claim mapping to add a `clearance`claim to the JWT token.
11) Copy the "OAuth Client Key" and the "OAuth Client Secret" values respectively to the `CONSUMER_KEY` and `CONSUMER_SECRET` constants of the `get_token.sh` script.
12) Run the `get_token.sh` script to perform claim transcription on the clearance value during a OAuth JWT grant token request.
