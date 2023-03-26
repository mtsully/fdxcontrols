*** Settings ***
Library     OpenApiDriver
...             source=/tmp/openapi_spec.yaml
...             origin=https://fdx-ref-impl.sr.f5-cloud-demo.com:443
...             base_path=/fdx/v4
...             security_token=${JWT}
...             response_validation=DISABLED
Library    Process

Test Template      Validate Using Test Endpoint Keyword

*** Variables ***

*** Test Cases ***
Test Endpoint for ${method} on ${endpoint} where ${status_code} is expected


*** Keywords ***
Validate Using Test Endpoint Keyword
    [Arguments]    ${endpoint}    ${method}    ${status_code}
    FDX Custom Log    ${endpoint}
FDX Custom Log
    [Arguments]    ${endpoint}
    ${url}=    Set Variable    https://fdx-ref-impl.sr.f5-cloud-demo.com:443/fdx/v4/accounts
    Log to console    Scanning url: ${url}
    ${result}=    Run Process    /usr/local/bin/nuclei    -u    ${url}    -H    "Authorization":"Bearer ${JWT}"    -tags    cve2021    -vv    -debug
    Log to console    Result return code: ${result.rc}
    Log to console    Result stdout: ${result.stdout}
    Log to console    Result stderr: ${result.stderr}
