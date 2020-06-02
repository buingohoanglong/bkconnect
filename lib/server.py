from flask import Flask,request,jsonify


app = Flask(__name__)

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
    user_name = content['username']
    email = content['email']
    password = content['password']
    phone = content['phone']
    id = content['id']
    print(user_name + " signup with password " + password + ", email " + email + ", phone " + phone + ", id " + id)
    d = {
        "username": user_name,
        "email": email,
        "password": password,
        "phone": phone,
        "id": id,
    } 
    return jsonify(d)    



if __name__ == "__main__":
    app.run(debug=True)