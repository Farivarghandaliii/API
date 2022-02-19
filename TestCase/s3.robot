***Settings***
Documentation   A Post Request to Checked StatusCode
Library         RequestsLibrary
Library         JSONLibrary
Library         Collections

***Variables***
${API_Base}  https://reqres.in/

***Test Cases***
TC_Post_Request
    create session  AddData  ${API_Base}  verify=true  
    ${body}  create dictionary  email=sydney@fife
    ${header}  create dictionary  Content-Type=application/json  Accept=application/json
    ${Response}=  POST On Session  AddData  api/register  data=${body}  expected_status=400