# Edge Provisioning

This directory provides profiles for API products, developers, and apps.

Directions:

1. If you do not have an account yet, register at:
>https://accounts.apigee.com/accounts/sign_up

2. In the file `../setenv.sh`, configure values for your
organization, username, environment.
   * Also update the following values according to your OpenShift account.
     * callback_url="https://login-{youraccount}.rhcloud.com/callback/auth2"
     * authredirect_url="https://login-{youraccount}.rhcloud.com/signinoauthimplicit"

3. Run `setup.sh` in this directory to create all sample entities.
```
 ./setup.sh
```

4. Enter your org admin password when prompted.

5. Enter `android-oauth` when prompted to enter the proxies to attach to the API product.


--- 
Licensed under the Apache License, Version 2.0 (the "License"); you may not use
this file except in compliance with the License. You may obtain a copy
of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.