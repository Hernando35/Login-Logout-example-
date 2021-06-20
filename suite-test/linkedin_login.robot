*** Settings ***
Documentation    Opens a browser to login url, inputs valid username
...              and encrypted password, checks functionality and logout that.
...              and account type dependent rules.
Library          Collections
Library          String
Library          SeleniumLibrary    plugins=CryptoLibrary.Plugin
Resource         ${CURDIR}${/}//resource//config.robot


*** Variables ***: 
${Admins-Password}           your encripted password! # It should looks like: crypt:hiuy676hiugugigum+nEGhl33FSRu/JNoOU3TMA0xGktfwWTaz0KEKbUP7WO57meSr2Igdx7840oAY0FsKgSSUoA==
${element_title}             Home        #It can be modified by another text from other web element
${me_title}                  Ik          #It can be modified by another text from other web element
${logout_text}               Afmelden    #It can be modified by another text from other web element
${home_element}              xpath://li[contains(@class, 'global-nav__primary-item')]//span[contains(., '${element_title}')]
${me_element}                xpath://li[contains(@class, 'global-nav__primary-item')]//span[contains(., '${me_title}')]
${logout_url}                xpath://div[contains(@class, 'artdeco-dropdown__content-inner')]//ul[contains(., '${logout_text}')]


*** Test Cases ***
Decrypt as Plugin Login
    Open Browser             ${link_url}                ${BROWSER}
    Input Text               id:username                ${user}
    Input Password           id:password                ${Admins-Password}
    Click Element            css=[type="submit"]
    BuiltIn.Sleep            2s

Check Functionality
    Testing Fixed Web Elements            ${element_title}         ${home_element}
    BuiltIn.Sleep            2s
    
Logout Web Page
    Testing Fixed Web Elements            ${me_title}             ${me_element}
    Element Should Be Visible             ${logout_url}
    Click Element                         ${logout_url}
    Close Browser
                 
     
