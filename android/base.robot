*** Settings ***

Library    AppiumLibrary
Library    FakerLibrary    locale=pt_BR

Resource    utils/config.robot
Resource    utils/commons.robot


#pages
Resource    pages/generalPage.robot