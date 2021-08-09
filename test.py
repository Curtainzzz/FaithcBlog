import pymongo
from bson import ObjectId
myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["runoobdb"]
mycol = mydb["site2"]

mylist = [
    {"name": "RUNOOB", "cn_name": "菜鸟教程"},
    {"name": "Google", "address": "Google 搜索"},
]
x = mycol.insert_many(mylist)
x = x.inserted_ids
for i in x:
    print(i,type(i))
x = mycol.delete_many({})
print(x.deleted_count, "个文档已删除")