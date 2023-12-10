*** Settings ***
Documentation       Configuraçoes basicas para o projeto
Library             AppiumLibrary

*** Variables ***
${APPIUM_URL}                 http://127.0.0.1:4723/wd/hub
${DEVICE_NAME}                emulator-5554
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=14}
${APP_PACKAGE}                com.google.android.deskclock
${APP_ACTIVITY}               com.android.deskclock.DeskClock
#${ANDROID_APP}                ${EXECDIR}/resources/apk/Chat21_1.0.9_apkcombo.com.apk

*** Keywords ***
abrir aplicativo
    [Documentation]    abre o aplicativo mobile
  Open Application    ${APPIUM_URL}    platformName=${ANDROID_PLATFORM_NAME}    
  ...    deviceName=${DEVICE_NAME}    platformVersion=${ANDROID_PLATFORM_VERSION}
  ...    appPackage=${APP_PACKAGE}    automationName=${ANDROID_AUTOMATION_NAME}
  ...    appActivity=${APP_ACTIVITY}


fechar aplicativo
    Close Application