*** Settings ***
Library     OpenApiDriver
...             source=https://raw.githubusercontent.com/vtobi/fdx-controls-reference-implementation/main/fdx/fdxapi.money-movement.yaml
...             origin=https://fdx-ref-impl.sr.f5-cloud-demo.com:443
...             base_path=/fdx/v4
...             security_token=Bearer ${JWT}
...             response_validation=DISABLED
Library    Process
Test Template      Validate Using Test Endpoint Keyword

*** Variables ***

*** Test Cases ***
Test Endpoint for ${method} on ${endpoint} where ${status_code} is expected


*** Keywords ***
Validate Using Test Endpoint Keyword
    [Arguments]    ${endpoint}    ${method}    ${status_code}
    Test Endpoint
    ...    endpoint=${endpoint}    method=${method}    status_code=${status_code}

