*** Settings ***
Library        SeleniumLibrary


*** Variables ***            
${link_url}                  https://www.linkedin.com/login?fromSignIn=true&trk=guest_homepage-basic_nav-header-signin
${BROWSER}                   firefox
# Use a private key for encryption and decryption, in this case we are not decrypting data so it is here not used.
${private_key_password}      xg7/Ng4L59aL86+ZohlTTSzcHSMCmSOsPx15LFFwrkmB2yz5QxmN5Q2vjAdBtIR1YV3Ot+P5sPnso+RNDngP6cGyhGqRijuS
${user}                      your email address e.g. myemail@gmail.co.uk


*** Keywords ***
Testing Fixed Web Elements
   [Arguments]                                      ${text}             ${xpath} 
   Mouse Over                                       ${xpath} 
   Wait Until Element Contains                      ${xpath}            ${text}         timeout=5s
   Click Element                                    ${xpath} 



