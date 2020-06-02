import pymongo, urllib.parse


class InfoManager:
    def __init__(self):
        self._client = pymongo.MongoClient("mongodb://localhost:27017/")
        self._db = _client["mydatabase"]
        self._collection = _db["users"]

    def checkDuplicate(self, username):
        if self._collection.find_one({"username": username}):
            return True
        return False

    def addUser(self, info):
        self._collection.insert_one(info)

    def getUser(self, username):
        return self._collection.find_one({"username": username})