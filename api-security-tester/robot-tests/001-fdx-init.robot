*** Settings ***
Library     SeleniumLibrary

*** Variables ***

*** Test Cases ***
Retrieve JWT for OpenApiDriver library initialisation
    ${Token}=    Get JWT Access Token
    Set Global Variable    \${JWT}    ${Token}

*** Keywords ***
Open Chrome Browser
    ${options}    Evaluate    selenium.webdriver.ChromeOptions()
    Call Method    ${options}    add_argument    --no-sandbox
    Call Method    ${options}    add_argument    --headless
    Call Method    ${options}    add_argument    --remote-debugging-port\=9222
    Create Webdriver    Chrome    chrome_options=${options}
Get JWT Access Token
    Log    Get JWT Access Token    WARN
    ${Access Token}=    Set Variable    ${EMPTY}
    Open Chrome Browser
    WHILE    True    limit=100
        TRY
            Go To     https://fdx-oidc-proxy.sr.f5-cloud-demo.com/par
            Wait For Condition 	return document.title == "Sign-in"
            Input Text    name:login    Dummy
            Input Password    name:password    Password
            Click Button    Sign-in
            Wait For Condition 	return document.title == "Sign-in"
            Click Button    Continue
            ${json_string}=    Get Text   css:pre
            ${json_dict}=    Evaluate     json.loads("""${json_string}""")    json
            ${Access Token}=     Set Variable    ${json_dict['access_token']}
            Log    Access Token:    WARN
            Log    ${Access Token}    WARN
            IF    "${Access Token}" != "${EMPTY}"    RETURN    ${Access Token}
            Sleep    10s
        EXCEPT
            Sleep    10s
            CONTINUE
        END
    END
