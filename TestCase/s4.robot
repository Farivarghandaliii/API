***Settings***
Library   RequestsLibrary
Library   REST
Library   JSONLibrary
Library   Collections
Library      ../Library/Times.py

***Variables***
${API_Base}  https://reqres.in/

***Test Cases***
TC1_Post_Request
    create session  AddData  ${API_Base}  verify=true
    ${body}  create dictionary  name=morpheus  job=leader  email=morpheus@gmail.com  
    ${header}  create dictionary  Content-Type=application/json  Accept=application/json
    ${Response}=  POST On Session  AddData  ${API_Base}api/users  data=${body}

    should be equal as strings    ${Response.status_code}   201

    ${response.json()} = 	Add Object To Json 	${response.json()}  	$.name	 ${body}
    ${response.json()} = 	Add Object To Json 	${response.json()}  	$.email	 ${body}

    ${NameValue}=  get value from json  ${response.json()}  $.name
    ${name_update}= 	Set Variable 	david 		
    ${response.json()}= 	Update Value To Json 	${response.json()} 	$.name 	${name_update}

    ${emailValue}=  get value from json  ${response.json()}  $.email
    ${email_update}= 	Set Variable 	david@gmail.com		
    ${response.json()}= 	Update Value To Json 	${response.json()} 	$.email	 	${email_update}

    log to console  ${response.json()}

    ${jalali}=   change date to jalali   date=${response.json()}[createdAt]
    log to console    output:${SPACE}${SPACE}${jalali}

    ${length}  Get length   ${response.json()}[id]
    should be equal as integers  3  ${length}