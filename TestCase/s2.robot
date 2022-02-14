***Settings***
Library   RequestsLibrary
Library   RESTinstance
Library   JSONLibrary
Library   Collections

***Variables***
${API_Base}  https://reqres.in/

***Test Cases***
TC2_Post_Request
    create session  AddData  ${API_Base}  verify=true
    ${body}  create dictionary  name=morpheus  job=leader  
    ${header}  create dictionary  Content-Type=application/json  Accept=application/json
    ${Response}=  POST On Session  AddData  api/users  data=${body}  

    log to console  ${Response.content}

    should be equal as strings  ${Response.status_code}  201

    ${JobValue}=  get value from json  ${response.json()}  [job]
    should be equal as strings  ${JobValue}  ['leader']

    ${NameValue}=  get value from json  ${response.json()}  [name]
    should be equal as strings  ${NameValue}  ['morpheus']