
import urllib.request

response = urllib.request.urlopen('https://www.facebook.com/Suzuki2Wheelers/')
html = response.read()

#print(html)#prints empty space! 

#hf=open('test.txt','w')
a=str(html,'utf-8')
p=str(a.encode("utf-8"))
#hf.write(str(a.encode("utf-8")))
#hf.close()
begin = p.index("src=\"https://static.xx.fbcdn.net/rsrc.php/v3/y5/r/dsGlZIZMa30.png\" alt=\"Highlights info row image\" /></div><div class=\"_4bl9\"><div>")
end = p.index("\\xe0\\xb2\\x9c\\xe0\\xb2\\xa8\\xe0\\xb2\\xb0\\xe0\\xb3\\x81 \\xe0\\xb2\\x87\\xe0\\xb2\\xa6\\xe0\\xb2\\xa8\\xe0\\xb3\\x8d\\xe0\\xb2\\xa8\\xe0\\xb3\\x81 \\xe0\\xb2\\x85\\xe0\\xb2\\xa8\\xe0\\xb3\\x81\\xe0\\xb2\\xb8\\xe0\\xb2\\xb0\\xe0\\xb2\\xbf\\xe0\\xb2\\xb8\\xe0\\xb3\\x81\\xe0\\xb2\\xa4\\xe0\\xb3\\x8d\\xe0\\xb2\\xa4\\xe0\\xb2\\xbf\\xe0\\xb2\\xa6\\xe0\\xb3\\x8d\\xe0\\xb2\\xa6\\xe0\\xb2\\xbe\\xe0\\xb2\\xb0\\xe0\\xb3\\x86</div></div></div></div></div><div class=\"_4-u2 _u9q _3xaf _4-u8\"><div class=\"_4-u3 _5dwa _5dwb _g3i\"><span class=\"_38my\">")
b=int(begin)+131 
e=int(end)
#print(b)
#print(e)
#type(b);
followers = p[b:e]
print(followers)