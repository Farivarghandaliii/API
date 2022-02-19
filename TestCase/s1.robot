
*** Settings ***
Documentation    A Test API Get Request
Library          RequestsLibrary
Library          Collections
Library          JSONLibrary

*** Variables ***
${API_Base}   https://gorest.co.in/

*** Test Cases ***
TC_GET_Request
    create session  API_Testing  ${API_Base}  verify=true
    ${response}=  GET On Session  API_Testing  public/v1/posts/123/comments
    ${header}  create dictionary  Content-Type=application/json  Accept=application/json
    log to console  ${response.headers}
    log to console  ${response.content}
    ${statuscode}  convert to string  ${response.status_code}
    should be equal  ${statuscode}  200
    ${PageValue}=  get value from json  ${response.json()}  $.meta.pagination.page
    ${PageValue}  convert to string  ${PageValue}
    should be equal  ${PageValue}  [1]
    ${DataValue}=  get value from json  ${response.json()}  $.data
    ${DataValue}  convert to string   ${DataValue}
    should be equal  ${DataValue}  [[]]