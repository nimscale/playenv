import os
import redis

let cl = open()

cl.setk("nim_redis:test", "Hello, World")
writeStackTrace()

echo (cl.get("nim_redis:test"))

os.sleep(100000)