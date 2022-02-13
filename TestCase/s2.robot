***Settings***
Library   RequestsLibrary
Library   RESTinstance
Library   JSONLibrary
Library   Collections

***Variables***
${API_Base}  https://reqres.in/api/users

***Test Cases***
TC2_Post_Request
    create session  AddData  ${API_Base}
    ${body}  create dictionary  name=morpheus  job=leader   id=400
    ${header}  create dictionary  Content-Type=application/json; charset=utf-8  Accept=application/json;charset=utf-8
    ${Response}=  POST On Session  AddData  api/users  data=${body} 

    log to console  ${Response.status_code}
    log to console  ${Response.content}

    ${code}  convert to string  ${Response.status_code}
    should be equal  ${code}  201

    ${JobValue}=  get value from json  ${response.json()}  $.job
    ${JobValue}  convert to string   ${JobValue}
    should be equal  ${JobValue}  ['leader']

    ${NameValue}=  get value from json  ${response.json()}  $.name
    ${NameValue}  convert to string   ${NameValue}
    should be equal  ${NameValue}  ['morpheus']