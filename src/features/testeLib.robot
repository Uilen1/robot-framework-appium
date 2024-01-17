*** Settings ***
Library    ./src/utils/DateLibrary.py

*** Test Cases ***
Get Current Date
    ${current_date}=    Get Current Date
    Log    Current Date: ${current_date}
    ${next_sunday}=    Get Next Sunday
    Log    Next Sunday: ${next_sunday}
    ${difference_in_days}=     Get Difference Between Dates    2023-12-25    2024-01-10
    Log    Difference Between Dates: ${difference_in_days}
    ${difference_in_hours}=     Get Difference Between Hours    23:59:59    00:00:48
    Log    Difference In Hours: ${difference_in_hours["hours"]}
    Log    Difference In Minutes: ${difference_in_hours["minutes"]}
    Log    Difference In Seconds: ${difference_in_hours["seconds"]}
    Log    Difference Between Hours: ${difference_in_hours}