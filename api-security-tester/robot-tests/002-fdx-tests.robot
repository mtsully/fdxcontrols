*** Settings ***
Library    Process

*** Variables ***

*** Test Cases ***
Run FDX Custom Nuclei Template
    ${hostname}=    Set Variable    https://fdx-ref-impl.sr.f5-cloud-demo.com
    Log to console    Scanning host: ${hostname}
    ${result}=    Run Process    /usr/local/bin/nuclei    -u    ${hostname}    -H    "Authorization":"Bearer ${JWT}"    -tags    cves2021    -vv    -debug

*** Keywords ***

