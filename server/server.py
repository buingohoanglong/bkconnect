from flask import Flask,request,jsonify
from InfoManager import InfoManager


app = Flask(__name__)

infoManager = InfoManager()

@app.route("/login/",methods=["POST"])
def login():
    user = request.json
    msg = {
        "status": "failure",
        "type": "invalid username or password",
        "body": {}
    }

    if user["username"] == None or user["password"] == None:
        msg["type"] = "lost connection"
        return jsonify(msg)
    
    if infoManager.authorizeSignIn(username=user["username"], password=user["password"]):
        info = infoManager.getUser(user["username"])
        msg["status"] = "success"
        msg["type"] = "login sucessfully"
        msg["body"] = {
            "username": info["username"],
            "id": info["id"],
            "email": info["email"],
            "phone": info["phone"],
            "password": ""            
        }
        return jsonify(msg)
 
    return jsonify(msg) 
            

@app.route("/register/", methods=["POST"])
def register():
    user = request.json
    msg = {
        "status": "failure",
        "type": "username already taken",
    }

    if user["username"] == None or user["id"] == None or user["email"] == None or user["phone"] == None or user["password"] == None:
        msg["type"] = "lost connection"
        return jsonify(msg)

    if infoManager.authorizeSignUp(username=user["username"]):
        infoManager.addUser(user)
        infoManager.printDB()
        msg["status"] = "success"
        msg["type"] = "register successfully"
        return jsonify(msg)

    return jsonify(msg)


if __name__ == "__main__":
    app.run(debug=True)