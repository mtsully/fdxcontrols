*** Settings ***
Library    Process

*** Variables ***

*** Test Cases ***
Run FDX Custom Nuclei Template
    ${hostname}=    Set Variable    https://fdx-ref-impl.sr.f5-cloud-demo.com
    Log to console    Scanning host: ${hostname}
    ${result}=    Run Process    /usr/local/bin/nuclei    -u    ${hostname}    -V    JWT\=${JWT}    -t    fdx    -vv    -debug      
    Log to console    Result return code: ${result.rc}
    Log to console    Result stdout: ${result.stdout}
    Log to console    Result stderr: ${result.stderr}
*** Keywords ***

