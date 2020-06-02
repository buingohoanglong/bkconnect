from flask import Flask,request,jsonify
from InfoManager import InfoManager


app = Flask(__name__)

infoManager = InfoManager()

@app.route("/login/",methods=["POST"])
def login():
    content = request.json
    user_name = content["username"]
    password = content["password"]
    print(user_name + " login with password " + password)   
    d = {
        "username": user_name,
        "password": password,
    }
    return jsonify(d)    
            

@app.route("/register/", methods=["POST"])
def register():
    content = request.json
    user = {
        "username": content["username"],
        "id": content["id"],
        "email": content["email"],
        "phone": content["phone"],
        "password": content["password"]
    }
    
    if infoManager.checkDuplicate(user["username"]):
        msg = {"status" : { "type" : "failure" ,   "message" : "username already taken"}}
        return jsonify(msg)
    
    infoManager.addUser(user)
    infoManager.printDB()
    msg = {"status" : { "type" : "success" ,   "message" : "register successfully"}}
    return jsonify(msg)


if __name__ == "__main__":
    app.run(debug=True)