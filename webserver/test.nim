# import pure.md5
import htmlgen
import jester
import os


routes:
  get "/":
    resp h1("Hello world")