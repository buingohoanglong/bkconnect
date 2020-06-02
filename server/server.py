from flask import Flask,request,jsonify
from InfoManager import InfoManager


app = Flask(__name__)

infoManager = InfoManager()

@app.route("/login/",methods=["POST"])
def login():
    content = request.json
    user = {
        "username": content["username"],
        "password": content["password"],
    }
    
    if infoManager.authorizeSignIn(username=user["username"], password=user["password"]):
        msg = {"status" : { "type" : "success" ,   "message" : "login successfully"}}
        return jsonify(msg)
 
    msg = {"status" : { "type" : "failure" ,   "message" : "invalid username or password"}}
    return jsonify(msg) 
            

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
    
    if infoManager.authorizeSignUp(username=user["username"]):
        infoManager.addUser(user)
        infoManager.printDB()
        msg = {"status" : { "type" : "success" ,   "message" : "register successfully"}}
        return jsonify(msg)

    infoManager.printDB()
    msg = {"status" : { "type" : "failure" ,   "message" : "username already taken"}}
    return jsonify(msg)


if __name__ == "__main__":
    app.run(debug=True)