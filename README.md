# CSU44098-project-3-malnutrition-app

The purpose of this project is to develop an app for volunteers to gather data on malnutrion in Honduras and provide relevant information.


  

## API

  
### **Setup:**


-  Change directory to server and run npm install.

-  cd..

-  Run docker-compose up
  
  

### **Endpoints:**  

**Test**  
(GET) http://localhost:5000/api/testDB


**User Login/Register {username: "", password:""}**  
(GET/POST) http://localhost:5000/api/user


**Create new area {name: ""}**  
(POST) http://localhost:5000/api/area


**Create new patient {"area": "newGroup",  "name": "newGroup", "age": "11", "weight": "16", "height": "16"}**  
(POST) http://localhost:5000/api/patients


**Get all patient data:**  
(GET) http://localhost:5000/api/patients


**Get data for all areas:**   
(GET) http://localhost:5000/api/area


**Get data for a specific area {"name": ""}:**  
(GET) http://localhost:5000/api/area





