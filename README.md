# apigee-android-app
This repository includes an Android App that uses OAuth 2.0 Implicit Grant flow with Apigee Edge acting as the authorization server and a Node.js server running in OpenShift as the user authentication server.

The purpose of this repository is to demonstrate the use of the Implicit Grant flow with a mobile application.


### Sequence Diagram
TODO - insert sequence diagram

1. User navigates to page that provides a link to login with another account.
2. This page sends an /authorize request to Edge to validate, redirect URI, and client ID
3. Edge redirects the user's agent to the login page
4. User enters username and password and clicks submit. At this point another page would be displayed requesting consent, but in this case consent is implied from the login.
5. The login process validates the username and password.
6. Assuming the username/password is correct, then the login process sends a /token request to Edge requesting the access token
7. Edge returns the access token as part of the URI to the callback URI listed App when it was registered
8. Login process then parses the token and stores it for future use
9. Login process forwards the request to another endpoint (i.e /userhome) and all communication to the API will use the Access token it saved in the previous step.

### Prerequistes
1. Setup an [Openshift](https://www.openshift.com) account or use an existing PaaS to run the Node.js application.
2. Setup an [Edge](https://apigee.com) account.

### Submodules
This repository includes the following submodules.
* userAuth

### Setup
1. clone this repository
2. clone the userAuth repository as a submodule within this one.

```
cd userAuth
git submodule init
git submodule update
```

3. Follow the [README](https://github.com/swilliams11/userAuth) for the userAuth repository to deploy the Node.js application to OpenShift.

4. Deploy the android-oauth proxy, product, app and developer by following the [README]() in the setup directory.


### Authorize Request - Implicit Grant
Documentation for the [implicit grant] (http://docs.apigee.com/api-services/content/oauthv2-policy#requestinganaccesstokenimplicitgranttype)

The following is a sample implicit grant request.
```
curl -X POST -H 'Content-Type: application/x-www-form-urlencoded' 'https://{org}-{env}.apigee.net/oauth/implicit?response_type=token&client_id=ABC123&redirect_uri=https://login-{openshiftaccount}.rhcloud.com/callback/auth2'
```
