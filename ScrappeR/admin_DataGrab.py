
# coding: utf-8
import pandas as pd
import requests
import time
#import random
#import pickle

# token = str(input("fb access token: "))
token = 'EAAJpH9UEb0YBAOIoZC7RO7yBMz424i5IvGZAie9poaPQ5pfjwiUjbqcsHxJFFyWVtj5cJUZC3y32fk07UF9lwpy9gNbt7QDPCZB9VDrXck5b2wCczpAtxJseagTGS7lON0pgXYurGdcL6uef0ZBLqeuKwiqaYRnpM0BAGzG3SUAZDZD'
u_id = 'ApriliaIndia'

#u_id = str(input("facebook handle: "))
req = u_id+"/feed?fields=from,message,permalink_url,created_time,comments.limit(0).summary(true),likes.limit(0).summary(true),shares.limit(0).summary(true)&limit=100&since=2018-12-01&until=2019-01-01"

def req_fb(req):
    r = requests.get("https://graph.facebook.com/v3.0/"+req, {'access_token' : token})
    return r

data = []

results = req_fb(req).json()
data.extend(results['data'])

# gh = results['paging']['next']


i = 0
while True:
    try:
        time.sleep(0.3)
        result = requests.get(gh).json()
        data.extend(result['data'])
        gh = result['paging']['next']
        i += 1
        print("line :" + str(i))
    except:
        print("done")
        break

print(len(data), "data done")
df2 = pd.io.json.json_normalize(data=data)
df2.drop(df2.columns[[0,1,2,8,9,10]],1,inplace=True)
df2.rename(columns={'comments.summary.total_count':'comments','likes.summary.total_count':'likes','shares.count':'shares', 'from.id':'user_id','from.name':'from','id':'post_id','permalink_url':'link'},inplace=True)

df2.to_csv(u_id+'_fb.csv')

writer = pd.ExcelWriter(u_id+'_fb.xlsx', engine='xlsxwriter',options={'strings_to_urls': False})
df2.to_excel(writer,sheet_name="adminposts")

del data

post_comm = df2[df2['comments']>0].reset_index(drop=True)
print(sum(df2['comments']), "comments total")


post_links =post_comm['post_id']
max_com = post_comm['comments'].max()
data = []
for j in range(len(post_links)):
    try:
        time.sleep(0.3)
        reqs = post_links[j]+"?fields=comments.limit("+str(max_com)+"){id,from,message,created_time,permalink_url}"
        new_line = req_fb(reqs).json()
        data.extend(new_line['comments']['data'])
    except:
        continue

df3 = pd.io.json.json_normalize(data=data)
print(len(df3),"comments downloaded")
df3.to_excel(writer,sheet_name="comments")
writer.close()



















